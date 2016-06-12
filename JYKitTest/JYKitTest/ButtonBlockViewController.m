//
//  ButtonBlockViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ButtonBlockViewController.h"

@interface ButtonBlockViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button;
@end

@implementation ButtonBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_button handleControlEvent:UIControlEventTouchUpInside withBlock:^{
        NSLog(@"TODO: 事件处理");
    }];
}

@end
