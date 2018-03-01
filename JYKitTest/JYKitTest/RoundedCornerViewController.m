//
//  RoundedCornerViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "RoundedCornerViewController.h"

@interface RoundedCornerViewController ()
@property (nonatomic, weak) IBOutlet UIView *topRoundedView;
@property (nonatomic, weak) IBOutlet UIView *bottomRoundedView;
@property (nonatomic, weak) IBOutlet UIView *partRoundedView;
@end

@implementation RoundedCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_topRoundedView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight withRadius:20];
    [_bottomRoundedView addRoundedCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight withRadius:20];
    [_partRoundedView addRoundedCorners:UIRectCornerTopLeft | UIRectCornerBottomRight withRadius:20];
}

@end
