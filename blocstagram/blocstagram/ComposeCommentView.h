//
//  ComposeCommentView.h
//  blocstagram
//
//  Created by Paulo Choi on 8/11/15.
//  Copyright (c) 2015 Paulo Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComposeCommentView;

@protocol ComposeCommentViewDelegate <NSObject>

- (void) commentViewDidPressCommentButton: (ComposeCommentView *) sender;
- (void) commentView: (ComposeCommentView *) sender textDidChange:(NSString *) text;
- (void) commentViewWillStartEditing: (ComposeCommentView *) sender;

@end


@interface ComposeCommentView : UIView

@property (nonatomic,weak) NSObject <ComposeCommentViewDelegate> *delegate;
@property (nonatomic,assign) BOOL isWritingComment;
@property (nonatomic,strong) NSString *text;

- (void) stopComposingComment;

@end
