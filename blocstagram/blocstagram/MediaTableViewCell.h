//
//  MediaTableViewCell.h
//  blocstagram
//
//  Created by Paulo Choi on 7/2/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media, MediaTableViewCell;

@protocol MediaTableViewCellDelegate <NSObject>

- (void) cell:(MediaTableViewCell *)cell didTapImageView: (UIImageView *)imageView;
- (void) cell:(MediaTableViewCell *)cell didLongPressImageView: (UIImageView *)imageView;


@end

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic,strong) Media *mediaItem;
@property (nonatomic,weak) id <MediaTableViewCellDelegate> delegate;


+ (CGFloat) heightForMediaItem: (Media *) mediaItem width: (CGFloat) width ;


@end
