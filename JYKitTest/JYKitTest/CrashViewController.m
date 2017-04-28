//
//  CrashViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 2017/4/27.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "CrashViewController.h"

@interface CrashViewController ()

@end

@implementation CrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Events
- (IBAction)onClickCrash:(id)sender {
    [self performSelector:@selector(thisMethodDoesNotExist) withObject:nil];
}

@end
