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

@interface JDMenuViewController () <MasterViewDelegate>
@property (nonatomic, weak) IBOutlet UIView *masterView;
@property (nonatomic, weak) IBOutlet UIView *detailView;
@property (nonatomic, strong) JDMasterViewController *master;
@property (nonatomic, strong) JDDetailViewController *detail;
@property (nonatomic, strong) NSArray *items;
@end

@implementation JDMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"菜单";
    _items = @[@"食品", @"服饰", @"电器", @"清洁"];
    // 左侧菜单
    _master = [JDMasterViewController new];
    _master.delegate = self;
    _master.items = _items;
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:_master];
    [self addChildViewController:nav1];
    [_masterView addSubview:nav1.view];
    nav1.view.frame = _masterView.bounds;
    [nav1 didMoveToParentViewController:self];
    // 右侧详情
    _detail = [JDDetailViewController new];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:_detail];
    [self addChildViewController:nav2];
    [_detailView addSubview:nav2.view];
    nav2.view.frame = _detailView.bounds;
    [nav2 didMoveToParentViewController:self];
}

#pragma mark - MasterViewDelegate
- (void)masterViewDidSelectIndexPath:(NSIndexPath *)indexPath {
    _detail.lbChosen.text = [NSString stringWithFormat:@"'%@'页面内容", _items[indexPath.row]];
}

@end
