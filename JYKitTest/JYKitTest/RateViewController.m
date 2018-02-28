//
//  RateViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/2/28.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "RateViewController.h"
@import StoreKit;

@interface RateViewController ()

@end

@implementation RateViewController

#pragma mark - Events
- (IBAction)onClickRate:(id)sender {
    [self rateOnAppStoreWithAppID:@"1194867909"];
}

@end
