//
//  ControlLoadingViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ControlLoadingViewController.h"
#import "LoadingViewController.h"

@interface ControlLoadingViewController ()

@end

@implementation ControlLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onClickLoadFail:(id)sender {
    LoadingViewController *vc = [LoadingViewController new];
    vc.shouldFail = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)onClickLoadSuccess:(id)sender {
    LoadingViewController *vc = [LoadingViewController new];
    vc.shouldFail = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
