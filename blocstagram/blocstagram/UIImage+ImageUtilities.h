//
//  UIImage+ImageUtilities.h
//  blocstagram
//
//  Created by Paulo Choi on 8/15/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize)size;
- (UIImage *) imageCroppedToRect: (CGRect) cropRect;

@end
