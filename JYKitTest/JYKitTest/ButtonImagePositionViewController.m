//
//  ButtonImagePositionViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ButtonImagePositionViewController.h"

@interface ButtonImagePositionViewController ()
@property (nonatomic, weak) IBOutlet UIButton *btn1;
@property (nonatomic, weak) IBOutlet UIButton *btn2;
@end

@implementation ButtonImagePositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_btn1 setImageToRight];
    [_btn2 setImageToTop];
}

@end
