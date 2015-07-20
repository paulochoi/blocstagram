//
//  DataSource.m
//  blocstagram
//
//  Created by Paulo Choi on 7/1/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import "DataSource.h"
#import "User.h"
#import "Media.h"
#import "Comment.h"
#import "LoginViewController.h"

@interface DataSource () {
    NSMutableArray *_mediaItems;
}

@property (nonatomic, strong) NSArray *mediaItems;
@property (nonatomic, assign) BOOL isRefreshing;
@property (nonatomic, assign) BOOL isLoadingOlderItems;
@property (nonatomic, strong) NSString *accessToken;


@end

@implementation DataSource

+ (NSString *) instagramClientID {
    return @"e18b01565e0e40d7b58fd533c7b228e4";
}

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void) populateDataWithParameters : (NSDictionary *) parameters {
 
    if (self.accessToken) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSMutableString *urlString = [NSMutableString stringWithFormat:@"https://api.instagram.com/v1/users/self/feed?access_token=%@", self.accessToken];
            
            for (NSString *parameterName in parameters){
                [urlString appendFormat:@"&%@=%@",parameterName, parameters[parameterName]];
            }
            
            NSURL *url = [NSURL URLWithString:urlString];
            
            if (url) {
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                NSURLResponse *response;
                NSError *webError;
                NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&webError];
                
                if (responseData) {
                    NSError *jsonError;
                    NSDictionary *feedDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
                    
                    if (feedDictionary){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self parseDataFromFeedDictionary: feedDictionary fromRequestWithParameters: parameters];
                        });
                    }
                }
            }
        });
    }
}


- (void) parseDataFromFeedDictionary: (NSDictionary *) feedDictionary fromRequestWithParameters: (NSDictionary *)parameters {
    NSLog(@"%@", feedDictionary);
}


- (instancetype) init {
    self = [super init];
    
    if (self) {
        //[self addRandomData];
        [self registerForAccessTokenNotification];
    }
    
    return self;
}

- (void) registerForAccessTokenNotification {
    [[NSNotificationCenter defaultCenter] addObserverForName:LoginViewControllerDidGetAccessTokenNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        self.accessToken = note.object;
        [self populateDataWithParameters:nil];

    }];
}

- (NSUInteger) countOfMediaItems {
    return self.mediaItems.count;
}

- (id) objectInMediaItemsAtIndex:(NSUInteger)index {
    return [self.mediaItems objectAtIndex:index];
}

- (NSArray *) mediaItemsAtIndexes:(NSIndexSet *)indexes {
    return [self.mediaItems objectsAtIndexes:indexes];
}


- (void) insertObject:(Media *)object inMediaItemsAtIndex:(NSUInteger)index{
    [_mediaItems insertObject:object atIndex:index];
}

- (void) removeObjectFromMediaItemsAtIndex:(NSUInteger)index {
    [_mediaItems removeObjectAtIndex:index];
}

- (void) replaceObjectInMediaItemsAtIndex:(NSUInteger)index withObject:(id)object{
    [_mediaItems replaceObjectAtIndex:index withObject:object];
}



- (void) deleteMediaItem:(Media *)item {
    NSMutableArray *mutableArrayWithKVO = [self mutableArrayValueForKey:@"mediaItems"];
    [mutableArrayWithKVO removeObject:item];
}

- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler{
    
    if (self.isRefreshing == NO) {
        self.isRefreshing = YES;
        
        self.isRefreshing = NO;
        
        if (completionHandler) {
            completionHandler(nil);
        }
        
    }
}

- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler {
    if (self.isLoadingOlderItems == NO) {
        self.isLoadingOlderItems = YES;

        
        self.isLoadingOlderItems = NO;
        
        if (completionHandler) {
            completionHandler(nil);
        }
    }
}

@end
