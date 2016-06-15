//
//  JYDashLineView.m
//  JYKit
//
//  Created by Ren Jing on 16/5/26.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "JYDashLineView.h"

@implementation JYDashLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    // 默认值
    if (!_lineColor) {
        _lineColor = [UIColor redColor];
    }
    if (_lineWidth == 0) {
        _lineWidth = 3;
    }
    if (CGPointEqualToPoint(_startPoint, CGPointZero)) {
        _startPoint = CGPointMake(0, CGRectGetHeight(rect)/2.f);
    }
    if (CGPointEqualToPoint(_endPoint, CGPointZero)) {
        _endPoint = CGPointMake(self.bounds.size.width, CGRectGetHeight(rect)/2.f);
    }
    _dashPatterns = @[@10, @5];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:_lineColor.CGColor];
    [shapeLayer setLineWidth:_lineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:_dashPatterns];

    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _startPoint.x, _startPoint.y);
    CGPathAddLineToPoint(path, NULL, _endPoint.x, _endPoint.y);

    [shapeLayer setPath:path];
    CGPathRelease(path);

    [[self layer] addSublayer:shapeLayer];
}

#pragma mark - Setters
- (void)setDashPatterns:(NSArray *)dashPatterns {
    _dashPatterns = dashPatterns;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
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
