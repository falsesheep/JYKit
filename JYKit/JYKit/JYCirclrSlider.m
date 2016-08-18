//
//  JYCirclrSlider.m
//  testKnob
//
//  Created by Ren Jing on 16/8/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "JYCirclrSlider.h"
#import "JYCircleGestureRecognizer.h"

@interface JYCirclrSlider ()
@property (nonatomic, strong) CAShapeLayer *layerTrack;
@property (nonatomic, strong) CAShapeLayer *layerKnob;
/// 最大值
@property (nonatomic, assign) CGFloat maxValue;
/// 最小值
@property (nonatomic, assign) CGFloat minValue;
/// 起始位置
@property (nonatomic, assign) CGFloat startAngle;
@end

@implementation JYCirclrSlider

- (instancetype)initWithFrame:(CGRect)frame
                     maxValue:(CGFloat)maxValue
                     minValue:(CGFloat)minValue
                   startAngle:(CGFloat)startAngle
                     barWidth:(CGFloat)barWidth
                    knobWidth:(CGFloat)knobWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxValue = maxValue;
        _minValue = minValue;
        _startAngle = startAngle;
        _value = _minValue;

        // Track Path
        CGFloat outterRadius = frame.size.width/2;
        CGFloat innerRadius = outterRadius - barWidth;
        UIBezierPath *outterPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:outterRadius startAngle:_startAngle endAngle:M_PI*2+_startAngle clockwise:YES];
        UIBezierPath *outterOutPath = outterPath.bezierPathByReversingPath;
        UIBezierPath *innerPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:innerRadius startAngle:_startAngle endAngle:M_PI*2+_startAngle clockwise:YES];

        CGMutablePathRef path = CGPathCreateMutableCopy(outterOutPath.CGPath);
        CGPathAddPath(path, NULL, innerPath.CGPath);

        // Layer Track
        _layerTrack = [CAShapeLayer layer];
        _layerTrack.path = path;
        _layerTrack.fillColor = [UIColor blueColor].CGColor;
        [self.layer addSublayer:_layerTrack];
        CGPathRelease(path);

        // Knob Path
        knobWidth = 50;
        CGFloat knobCenterRadius = outterRadius - barWidth/2;
        CGFloat knobCenterX = CGRectGetMidX(self.bounds) + knobCenterRadius * cos(_startAngle);
        CGFloat knobCenterY = CGRectGetMidY(self.bounds) + knobCenterRadius * sin(_startAngle);
        CGPoint knobCenter = CGPointMake(knobCenterX, knobCenterY);
        UIBezierPath *knobPath = [UIBezierPath bezierPathWithArcCenter:knobCenter radius:knobWidth/2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];

        // Layer Knob
        _layerKnob = [CAShapeLayer layer];
        _layerKnob.path = knobPath.CGPath;
        _layerKnob.fillColor = [UIColor colorWithRed:240/255.f green:240/255.f blue:242/255.f alpha:0.8].CGColor;
        _layerKnob.strokeColor = [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:1.0].CGColor;
        _layerKnob.shadowOpacity = 0.8;
        _layerKnob.shadowOffset = CGSizeZero;
        _layerKnob.bounds = self.bounds;
        _layerKnob.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        [self.layer addSublayer:_layerKnob];

        // Gesture
        JYCircleGestureRecognizer *gesture = [[JYCircleGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)handleGesture:(JYCircleGestureRecognizer *)gesture {
    CGFloat angle = gesture.touchAngle;
    NSLog(@"%f", angle);
    self.value = [self valueFromAngle:angle];
}

#pragma mark - Setters & Getters
- (void)setValue:(CGFloat)value {
    if (value != _value) {
        _value = MIN(_maxValue, MAX(_minValue, value));
        CGFloat angle = [self angleFromValue:_value];
        _layerKnob.transform = CATransform3DMakeRotation(angle, 0, 0, 1);
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)setBarColor:(UIColor *)barColor {
    _layerTrack.fillColor = barColor.CGColor;
}

- (void)setKnobColor:(UIColor *)knobColor {
    _layerKnob.fillColor = knobColor.CGColor;
}

#pragma mark Value & Angle Convert
- (CGFloat)valueFromAngle:(CGFloat)angle {
    if (_maxValue == _minValue) {
        return _minValue;
    }
    CGFloat valuePerAngle = (_maxValue-_minValue) / (M_PI*2);
    CGFloat value = 0;
    if (angle >= _startAngle) {
        value = (angle - _startAngle) * valuePerAngle;
    }else {
        value = (M_PI*2 - (_startAngle - angle)) * valuePerAngle;
    }
    return value;
}

- (CGFloat)angleFromValue:(CGFloat)value {
    if (_maxValue == _minValue) {
        return _startAngle;
    }
    value = MIN(_maxValue, MAX(_minValue, value));
    CGFloat valuePerAngle = (_maxValue-_minValue) / (M_PI*2);
    CGFloat angle = value / valuePerAngle;
    return angle;
}

@end
