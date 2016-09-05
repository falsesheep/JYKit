//
//  QRCodeViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/9/5.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "QRCodeViewController.h"

@interface QRCodeViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.image = [@"http://www.baidu.com" generateQRCodeWithSideWidth:320];
}

@end
