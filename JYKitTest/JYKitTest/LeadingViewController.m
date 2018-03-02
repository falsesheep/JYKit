//
//  LeadingViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/2.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "LeadingViewController.h"

@interface LeadingViewController ()

@end

@implementation LeadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    NSArray *imageNames = @[@"178-1", @"178-2", @"178-3", @"178-4"]; // 16/9的图片
    if (UIScreen.mainScreen.bounds.size.height / UIScreen.mainScreen.bounds.size.width > 2) {
        imageNames = @[@"200-1", @"200-2", @"200-3", @"200-4"]; // 2/1的图片
    }
    
    UIButton *btnEnter = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 175, 36)];
    [btnEnter setTitle:@"开启应用" forState:UIControlStateNormal];
    [btnEnter setTitleColor:[UIColor colorWithRGBA:@[@31,@142,@247]] forState:UIControlStateNormal];
    [btnEnter setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(10, 10)] forState:UIControlStateNormal];
    btnEnter.layer.cornerRadius = 2;
    btnEnter.layer.masksToBounds = YES;
    
    JYIntroView *introView = [[JYIntroView alloc] initWithImages:imageNames enterButton:btnEnter clickedEnterCallBackBlock:^{
        [self alertMessage:@"进入主页面"];
    }];
    [self.view addSubview:introView];
}

@end
