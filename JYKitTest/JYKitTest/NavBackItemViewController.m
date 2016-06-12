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
    [self.navigationItem setBackBarButtonItemWithTitle:@"物品管理" image:[UIImage imageNamed:@"item_back"] target:self action:@selector(onClickBack:)];
}

- (IBAction)onClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
