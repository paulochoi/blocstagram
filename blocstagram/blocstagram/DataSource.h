//
//  DataSource.h
//  blocstagram
//
//  Created by Paulo Choi on 7/1/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Media;

@interface DataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *mediaItems;           

+ (instancetype) sharedInstance;

- (void) deleteMediaItem:(Media *)item;
- (void) moveMediaItemToTop:(Media *)item;
@end
