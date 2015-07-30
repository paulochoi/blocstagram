//
//  ImagesTableViewController.h
//  blocstagram
//
//  Created by Paulo Choi on 6/29/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MediaTableViewCell;

@interface ImagesTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *images;


-(void) cell:(MediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;


@end
