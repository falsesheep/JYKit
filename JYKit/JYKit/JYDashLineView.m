//
//  JYDashLineView.m
//  JYKit
//
//  Created by Ren Jing on 16/5/26.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "JYDashLineView.h"

@implementation JYDashLineView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // 默认值
    [self setDefaultValue];

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:_lineColor.CGColor];
    [shapeLayer setLineWidth:_lineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:@[@(_patternShow), @(_patternHide)]];

    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _startPoint.x, _startPoint.y);
    CGPathAddLineToPoint(path, NULL, _endPoint.x, _endPoint.y);

    [shapeLayer setPath:path];
    CGPathRelease(path);

    [[self layer] addSublayer:shapeLayer];
}

- (void)setDefaultValue {
    if (!_lineColor) {
        _lineColor = [UIColor redColor];
    }
    if (_lineWidth == 0) {
        _lineWidth = 3;
    }
    if (_patternShow == 0) {
        _patternShow = 10;
    }
    if (_patternHide == 0) {
        _patternHide = 5;
    }
    if (CGPointEqualToPoint(_startPoint, CGPointZero)) {
        _startPoint = CGPointMake(0, CGRectGetHeight(self.bounds)/2.f);
    }
    if (CGPointEqualToPoint(_endPoint, CGPointZero)) {
        _endPoint = CGPointMake(self.bounds.size.width, CGRectGetHeight(self.bounds)/2.f);
    }
}

#pragma mark - Setters
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setPatternShow:(CGFloat)patternShow {
    _patternShow = patternShow;
    [self setNeedsDisplay];
}

- (void)setPatternHide:(CGFloat)patternHide {
    _patternHide = patternHide;
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
