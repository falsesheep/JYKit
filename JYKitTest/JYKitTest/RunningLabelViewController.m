//
//  RunningLabelViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/16.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "RunningLabelViewController.h"

@interface RunningLabelViewController ()

@end

@implementation RunningLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 30);
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"测试一下，今天要发布新活动了，欢迎各位网友积极参与，有抽奖环节哦" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    JYRunningLabel *label = [[JYRunningLabel alloc] initWithFrame:frame content:attrStr speed:30];
    label.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:label];
}

@end
