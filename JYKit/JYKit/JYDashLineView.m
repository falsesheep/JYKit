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
    if (!_lineColor) {
        _lineColor = [UIColor redColor];
    }
    if (!_lineWidth) {
        _lineWidth = @3;
    }
    if (!_dashPattern1) {
        _dashPattern1 = @10;
    }
    if (!_dashPattern2) {
        _dashPattern2 = @5;
    }
    if (CGPointEqualToPoint(_startPoint, CGPointZero)) {
        _startPoint = CGPointMake(0, CGRectGetHeight(rect)/2.f);
    }
    if (CGPointEqualToPoint(_endPoint, CGPointZero)) {
        _endPoint = CGPointMake(self.bounds.size.width, CGRectGetHeight(rect)/2.f);
    }

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:_lineColor.CGColor];
    [shapeLayer setLineWidth:_lineWidth.floatValue];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:@[_dashPattern1, _dashPattern2]];

    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _startPoint.x, _startPoint.y);
    CGPathAddLineToPoint(path, NULL, _endPoint.x, _endPoint.y);

    [shapeLayer setPath:path];
    CGPathRelease(path);

    [[self layer] addSublayer:shapeLayer];
}

#pragma mark - Setters
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(NSNumber *)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setDashPattern1:(NSNumber *)dashPattern1 {
    _dashPattern1 = dashPattern1;
    [self setNeedsDisplay];
}

- (void)setDashPattern2:(NSNumber *)dashPattern2 {
    _dashPattern2 = dashPattern2;
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
