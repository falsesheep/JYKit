//
//  LoadingBaseViewController.h
//  JYKitTest
//
//  Created by Ren Jing on 16/6/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "BaseViewController.h"

@interface LoadingBaseViewController : BaseViewController
@property (nonatomic, assign) CGFloat topOffset;
@property (nonatomic, strong) UIColor *loadingBGColor;

// 加载页面
- (void)loadData;
// 显示加载过程
- (void)showLoadingView;
// 隐藏加载过程
- (void)hideLoadingView;
// 显示加载失败
- (void)showLoadingFailView;
// 隐藏加载失败
- (void)hideLoadingFailView;

@end
