//
//  DeepCopyViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "DeepCopyViewController.h"
#import "MDeepCopyTest.h"

@interface DeepCopyViewController ()

@end

@implementation DeepCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MDeepCopyTest *test = [[MDeepCopyTest alloc] init];
    test.name = @"test";
    test.friends = @[@"张三",@"李四"];

    MDeepCopyTest *test2 = [test deepCopy];
    NSLog(@"Name:%p, %p", test.name, test2.name);
    NSLog(@"Friends:%p, %p", test.friends, test2.friends);
}

@end
