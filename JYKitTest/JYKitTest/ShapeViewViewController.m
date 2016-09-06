//
//  ShapeViewViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/8/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ShapeViewViewController.h"

@interface ShapeViewViewController ()
@property (nonatomic, weak) IBOutlet UIView *viewOriginal;
@property (nonatomic, weak) IBOutlet UIView *viewScaled;
@end

@implementation ShapeViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    UIImage *maskImage = [UIImage imageNamed:@"heart"];
    [_viewOriginal viewWithMaskImage:maskImage scaled:NO];
    [_viewScaled viewWithMaskImage:maskImage scaled:YES];
    [self.view layoutSubviews];
}

@end
