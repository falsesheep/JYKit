//
//  ColorViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "ColorViewController.h"

@interface ColorViewController ()
@property (nonatomic, weak) IBOutlet UIView *color1;
@property (nonatomic, weak) IBOutlet UIView *color2;
@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _color1.backgroundColor = [UIColor colorWithRGBA:@[@0,@255,@0]];
    _color2.backgroundColor = [UIColor colorWithHexValue:@"#DCFFFF"];
}

@end
