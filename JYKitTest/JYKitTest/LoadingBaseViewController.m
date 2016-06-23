//
//  LoadingBaseViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "LoadingBaseViewController.h"

@interface LoadingBaseViewController ()
@property (nonatomic, strong) UIWindow *loadingWindow;
@property (nonatomic, strong) UIView *loadFailView;
@end

@implementation LoadingBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)loadData {
    NSLog(@"TODO: 需要在子类重载");
}

- (void)showLoadingView {
    self.loadingWindow.hidden = NO;
    [self.loadingWindow makeKeyAndVisible];
}

- (void)hideLoadingView {
    self.loadingWindow.hidden = YES;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}

- (void)showLoadingFailView {
    self.loadFailView.hidden = NO;
}

- (void)hideLoadingFailView {
    self.loadFailView.hidden = YES;
}

- (UIWindow *)loadingWindow {
    if (_loadingWindow) {
        return _loadingWindow;
    }

    _loadingWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _topOffset, CGRectGetWidth(_loadingWindow.frame), CGRectGetHeight(_loadingWindow.frame)-_topOffset)];
    if (_loadingBGColor) {
        contentView.backgroundColor = _loadingBGColor;
    }else {
        contentView.backgroundColor = [UIColor clearColor];
    }
    [_loadingWindow addSubview:contentView];
    // 加载动画
    UILabel *lbLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    lbLoading.text = @"加载中...";
    lbLoading.textColor = [UIColor whiteColor];
    lbLoading.textAlignment = NSTextAlignmentCenter;
    lbLoading.backgroundColor = [UIColor redColor];
    lbLoading.center = CGPointMake(CGRectGetWidth(contentView.frame)/2.f, CGRectGetHeight(contentView.frame)/2.f);
    [contentView addSubview:lbLoading];

    return _loadingWindow;
}

//- (UIView *)loadFailView {
//    if (_loadFailView) {
//        return _loadFailView;
//    }
//}

@end
