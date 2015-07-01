//
//  DataSource.h
//  blocstagram
//
//  Created by Paulo Choi on 7/1/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *mediaItems;           

+ (instancetype) sharedInstance;
@end
