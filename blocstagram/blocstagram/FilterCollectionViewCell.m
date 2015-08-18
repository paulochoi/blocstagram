//
//  FilterCollectionViewCell.m
//  blocstagram
//
//  Created by Paulo Choi on 8/18/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import "FilterCollectionViewCell.h"
#import "PostToInstagramViewController.h"


@interface FilterCollectionViewCell()

@end


@implementation FilterCollectionViewCell

- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.thumbnail = [[UIImageView alloc] init];
        self.thumbnail.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnail.clipsToBounds = YES;
        
        self.label = [[UILabel alloc] init];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:10];

        [self.contentView addSubview:self.thumbnail];
        [self.contentView addSubview:self.label];
    }
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    self.thumbnail.frame = CGRectMake(0, 0, 128, 128);
    self.label.frame = CGRectMake(0, 128, 128, 20);
}


@end
