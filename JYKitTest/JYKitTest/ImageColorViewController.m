//
//  ImageColorViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ImageColorViewController.h"

@interface ImageColorViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *image1;
@property (nonatomic, weak) IBOutlet UIImageView *image2;
@end

@implementation ImageColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"item_back"];
    _image1.image = [image imageWithColor:[UIColor greenColor]];
    _image2.image = [image imageWithColor:[UIColor redColor]];
}

@end
