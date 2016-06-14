//
//  HideNavLineViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/14.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "HideNavLineViewController.h"

@interface HideNavLineViewController ()

@end

@implementation HideNavLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.bottomLine.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.bottomLine.hidden = NO;
}

@end
