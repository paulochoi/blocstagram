//
//  CropImageViewController.h
//  blocstagram
//
//  Created by Paulo Choi on 8/16/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import "MediaFullScreenViewController.h"

@class CropImageViewController;

@protocol CropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage: (UIImage *) croppedImage;

@end

@interface CropImageViewController : MediaFullScreenViewController

- (instancetype) initWithImage: (UIImage *) sourceImage;
@property (nonatomic, weak) NSObject <CropImageViewControllerDelegate> *delegate;


@end
