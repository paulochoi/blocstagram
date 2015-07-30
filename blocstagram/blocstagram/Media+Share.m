//
//  Media+Share.m
//  blocstagram
//
//  Created by Paulo Choi on 7/28/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import "Media+Share.h"

@implementation Media (Share)

- (void) presentShareOnViewController :(UIViewController *) viewController {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (self.caption.length > 0){
        [itemsToShare addObject:self.caption];
    }
    
    if (self.image){
        [itemsToShare addObject:self.image];
    }
    
    if (itemsToShare.count > 0){
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        [viewController presentViewController:activityVC animated:YES completion:nil];

    }
}
@end
