//
//  FlexContentViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "FlexContentViewController.h"

@interface FlexContentViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *labelHeight;
@end

@implementation FlexContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"话剧是单卡到家啦是几点开始放假了卡机付款了爱上加大垃圾袋lsdasjk";
    _label.text = str;
    _labelHeight.constant = [str acceptableSizeWithFont:_label.font maxWith:200 maxHeight:0].height;
}

@end
