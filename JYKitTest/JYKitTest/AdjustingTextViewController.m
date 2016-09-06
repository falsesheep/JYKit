//
//  AdjustingTextViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/8/24.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "AdjustingTextViewController.h"

@interface AdjustingTextViewController () <UITextViewDelegate>
@property (nonatomic, strong) UITextView *textView;
@end

@implementation AdjustingTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 20, 200, 30)];
    _textView.delegate = self;
    _textView.layer.borderWidth = 0.5;
    _textView.scrollEnabled = NO;
    [self.view addSubview:_textView];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    CGSize newSize = [textView sizeThatFits:CGSizeMake(200, 120)];
    CGFloat newHeight = newSize.height;
    if (newHeight > 120) {
        textView.scrollEnabled = YES;
        newHeight = 120;
    }else {
        textView.scrollEnabled = NO;
    }
    textView.frame = CGRectMake(15, 20, 200, newHeight);
}

@end
