//
//  MediaFullScreenViewController.h
//  blocstagram
//
//  Created by Paulo Choi on 7/27/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Media;
@class MediaTableViewCell;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *imageView;

- (instancetype) initWithMedia:(Media *)media withCell:(MediaTableViewCell *) cell ;

- (void) centerScrollView;

@end
