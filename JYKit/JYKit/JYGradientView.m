//
//  JYGradientView.m
//  JYKit
//
//  Created by Ren Jing on 16/6/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "JYGradientView.h"

@implementation JYGradientView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // 默认值
    [self setDefaultValue];

    CAGradientLayer *layer = [CAGradientLayer layer];
    if (_middleColor) {
        layer.colors = @[(id)_startColor.CGColor, (id)_middleColor.CGColor, (id)_endColor.CGColor];
    }else {
        layer.colors = @[(id)_startColor.CGColor, (id)_endColor.CGColor];
    }
    layer.frame = self.bounds;
    layer.startPoint = _startPoint;
    layer.endPoint = _endPoint;

    [self.layer addSublayer:layer];
}

- (void)setDefaultValue {
    if (!_startColor) {
        _startColor = [UIColor greenColor];
    }
    if (!_endColor) {
        _endColor = [UIColor blueColor];
    }
    if (CGPointEqualToPoint(_startPoint, CGPointZero)) {
        _startPoint = CGPointZero;
    }
    if (CGPointEqualToPoint(_endPoint, CGPointZero)) {
        _endPoint = CGPointMake(1, 1);
    }
}

#pragma mark - Setters
- (void)setStartColor:(UIColor *)startColor {
    _startColor = startColor;
    [self setNeedsDisplay];
}

- (void)setEndColor:(UIColor *)endColor {
    _endColor = endColor;
    [self setNeedsDisplay];
}

- (void)setMiddleColor:(UIColor *)middleColor {
    _middleColor = middleColor;
    [self setNeedsDisplay];
}

- (void)setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    [self setNeedsDisplay];
}

- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    [self setNeedsDisplay];
}

@end
