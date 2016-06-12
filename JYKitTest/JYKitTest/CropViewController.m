//
//  CropViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "CropViewController.h"

@interface CropViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imgView.layer.borderColor = [UIColor grayColor].CGColor;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _imgView.image = [UIImage captureImageFromView:[UIApplication sharedApplication].keyWindow];
}

@end
