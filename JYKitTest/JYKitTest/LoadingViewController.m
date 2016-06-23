//
//  LoadingViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _shouldFail ? @"加载失败" : @"加载成功";
    // 配置加载页面
    self.topOffset = 64;
    self.loadingBGColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self loadData];
}

- (void)loadData {
    [self hideLoadingFailView];
    [self showLoadingView];

    SEL sel = @selector(hideLoadingView);
    if (_shouldFail) {
        sel = @selector(showLoadingFailView);
    }
    [self performSelector:sel withObject:nil afterDelay:3];
}

@end
