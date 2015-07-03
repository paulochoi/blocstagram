//
//  MediaTableViewCell.h
//  blocstagram
//
//  Created by Paulo Choi on 7/2/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic,strong) Media *mediaItem;

+ (CGFloat) heightForMediaItem: (Media *) mediaItem width: (CGFloat) width ;

@end
