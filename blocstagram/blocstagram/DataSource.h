//
//  DataSource.h
//  blocstagram
//
//  Created by Paulo Choi on 7/1/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *mediaItems;
@property (nonatomic, strong, readonly) NSString *accessToken;

+ (instancetype) sharedInstance;
+ (NSString *) instagramClientID;

- (void) deleteMediaItem:(Media *)item;

- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock) completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock) completionHandler;

- (void) downloadImageForMediaItem:(Media *)mediaItem;

- (void) toggleLikeOnMediaItem: (Media *)mediaItem withCompletionHandler: (void (^)(void))completionHandler;
@end
