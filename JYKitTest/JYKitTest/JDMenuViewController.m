//
//  JDMenuViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "JDMenuViewController.h"
#import "JDMasterViewController.h"
#import "JDDetailViewController.h"

@interface JDMenuViewController ()
@property (nonatomic, weak) IBOutlet UIView *masterView;
@property (nonatomic, weak) IBOutlet UIView *detailView;
@end

@implementation JDMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"菜单";
    // 左侧菜单
    JDMasterViewController *master = [JDMasterViewController new];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:master];
    [self addChildViewController:nav1];
    [_masterView addSubview:nav1.view];
    nav1.view.frame = _masterView.bounds;
    [nav1 didMoveToParentViewController:self];
    // 右侧详情
    JDDetailViewController *detail = [JDDetailViewController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:detail];
    [self addChildViewController:nav2];
    [_detailView addSubview:nav2.view];
    nav2.view.frame = _detailView.bounds;
    [nav2 didMoveToParentViewController:self];
}

@end
