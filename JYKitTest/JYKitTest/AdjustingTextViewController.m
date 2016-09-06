//
//  AdjustingTextViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/8/24.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "AdjustingTextViewController.h"

@interface AdjustingTextViewController () <UITextViewDelegate>
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewHeight;
@end

@implementation AdjustingTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGFloat fixedWidth = textView.frame.size.width;
    CGFloat newHeight = [textView sizeThatFits:CGSizeMake(fixedWidth, CGFLOAT_MAX)].height;
    if (newHeight > 66.5) {
        newHeight = 66.5;
        textView.scrollEnabled = YES;
    }else {
        textView.scrollEnabled = NO; // 避免contentOffset一直变化
    }
    _textViewHeight.constant = newHeight;
}

@end
