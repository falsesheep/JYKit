//
//  CircleSliderViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/8/18.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "CircleSliderViewController.h"

@interface CircleSliderViewController ()
@property (nonatomic, strong) UILabel *lb;
@property (nonatomic, strong) JYCirclrSlider *slider;
@end

@implementation CircleSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Slider
    _slider = [[JYCirclrSlider alloc] initWithFrame:CGRectMake(0, 0, 300, 300) maxValue:360 minValue:0 startAngle:0 barWidth:50 knobWidth:50];
    [self.view addSubview:_slider];
    _slider.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2-64);
    [_slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    // Label
    _lb = [[UILabel alloc] initWithFrame:_slider.frame];
    [self.view addSubview:_lb];
    _lb.text = @"0";
    _lb.textColor = [UIColor blackColor];
    _lb.textAlignment = NSTextAlignmentCenter;
    _lb.font = [UIFont systemFontOfSize:50];
}

- (void)valueChanged:(JYCirclrSlider *)slider {
    _lb.text = [NSString stringWithFormat:@"%.0f", slider.value];
}

@end
