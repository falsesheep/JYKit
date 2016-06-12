//
//  ImageSizeViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ImageSizeViewController.h"

@interface ImageSizeViewController ()
@property (nonatomic, weak) IBOutlet UIButton *btn1;
@property (nonatomic, weak) IBOutlet UIButton *btn2;
@end

@implementation ImageSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_btn1 setImage:[UIImage imageWithImage:[UIImage imageNamed:@"ranking_list"] scaledToSize:CGSizeMake(24, 22)] forState:UIControlStateNormal];
    [_btn2 setImage:[UIImage imageWithImage:[UIImage imageNamed:@"ranking_list"] scaledToSize:CGSizeMake(12, 11)] forState:UIControlStateNormal];
}

@end
