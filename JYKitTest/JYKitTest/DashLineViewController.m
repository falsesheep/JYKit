//
//  DashLineViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "DashLineViewController.h"

@interface DashLineViewController ()

@end

@implementation DashLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JYDashLineView *line = [[JYDashLineView alloc] initWithFrame:CGRectMake(20, 80, 100, 10)];
    [self.view addSubview:line];
}

@end
