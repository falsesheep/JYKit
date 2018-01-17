//
//  NavBackItemViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "NavBackItemViewController.h"

@interface NavBackItemViewController ()

@end

@implementation NavBackItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSAttributedString *leftTitle = [[NSAttributedString alloc] initWithString:@"返回" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: UIColor.whiteColor}];
    NSAttributedString *rightTitle = [[NSAttributedString alloc] initWithString:@"详情" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: UIColor.blueColor}];
    [self.navigationItem setBarButtonItemForRightSide:NO title:leftTitle image:[UIImage imageNamed:@"item_back"] target:self action:@selector(onClickBack:)];
    [self.navigationItem setBarButtonItemForRightSide:YES title:rightTitle image:nil target:nil action:nil];
}

- (IBAction)onClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
