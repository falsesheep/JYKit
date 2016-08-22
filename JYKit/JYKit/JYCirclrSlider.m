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
@property (nonatomic, strong) CAShapeLayer *layerProgress;
@property (nonatomic, strong) CALayer *layerBarImage;
/// 最大值
@property (nonatomic, assign) CGFloat maxValue;
/// 最小值
@property (nonatomic, assign) CGFloat minValue;
/// 起始位置
@property (nonatomic, assign) CGFloat startAngle;
/// 滚动条宽度
@property (nonatomic, assign) CGFloat barWidth;
@end

@implementation JYCirclrSlider

- (instancetype)initWithFrame:(CGRect)frame
                     maxValue:(CGFloat)maxValue
                     minValue:(CGFloat)minValue
                   startAngle:(CGFloat)startAngle
                     barWidth:(CGFloat)barWidth
                    knobWidth:(CGFloat)knobWidth
                     barImage:(UIImage *)barImage
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxValue = maxValue;
        _minValue = minValue;
        _startAngle = startAngle;
        _barWidth = barWidth;
        _value = _minValue;

        // Track Path
        CGFloat trackRadius = frame.size.width/2 - barWidth/2;
        UIBezierPath *trackPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:trackRadius startAngle:_startAngle endAngle:M_PI*2+_startAngle clockwise:YES];

        // Layer Track
        _layerTrack = [CAShapeLayer layer];
        _layerTrack.path = trackPath.CGPath;
        _layerTrack.fillColor = [UIColor clearColor].CGColor;
        _layerTrack.strokeColor = [UIColor colorWithRed:171/255.f green:217/255.f blue:252/255.f alpha:1].CGColor;
        _layerTrack.lineWidth = barWidth;
        [self.layer addSublayer:_layerTrack];

        // Layer Progress
        _layerProgress = [CAShapeLayer layer];
        _layerProgress.path = [UIBezierPath bezierPathWithArcCenter:self.center radius:trackRadius startAngle:_startAngle endAngle:_startAngle clockwise:YES].CGPath;
        _layerProgress.fillColor = [UIColor clearColor].CGColor;
        _layerProgress.strokeColor = [UIColor redColor].CGColor;
        _layerProgress.lineWidth = _layerTrack.lineWidth;
        [self.layer addSublayer:_layerProgress];

        // Layer Mask
        if (barImage) {
            _layerBarImage = [CALayer layer];
            _layerBarImage.frame = self.bounds;
            _layerBarImage.contents = (id)barImage.CGImage;
            _layerBarImage.mask = _layerProgress;
            [self.layer addSublayer:_layerBarImage];
        }

        // Knob Path
        knobWidth = 50;
        CGFloat knobCenterX = CGRectGetMidX(self.bounds) + trackRadius * cos(_startAngle);
        CGFloat knobCenterY = CGRectGetMidY(self.bounds) + trackRadius * sin(_startAngle);
        CGPoint knobCenter = CGPointMake(knobCenterX, knobCenterY);
        UIBezierPath *knobPath = [UIBezierPath bezierPathWithArcCenter:knobCenter radius:knobWidth/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];

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

- (void)updateProgressLayerPathToAngle:(CGFloat)angle {
    CGFloat trackRadius = self.frame.size.width/2 - _barWidth/2;
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    UIBezierPath *newPath = [UIBezierPath bezierPathWithArcCenter:center radius:trackRadius startAngle:_startAngle endAngle:angle clockwise:YES];
    _layerProgress.path = newPath.CGPath;
}

#pragma mark - Setters & Getters
- (void)setValue:(CGFloat)value {
    if (value != _value) {
        _value = MIN(_maxValue, MAX(_minValue, value));
        CGFloat angle = [self angleFromValue:_value];
        // Transaction
        [CATransaction new];
        [CATransaction setDisableActions:YES];
        _layerKnob.transform = CATransform3DMakeRotation(angle, 0, 0, 1);
        [self updateProgressLayerPathToAngle:angle];
        [CATransaction commit];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)setTrackColor:(UIColor *)trackColor {
    _trackColor = trackColor;
    _layerTrack.strokeColor = trackColor.CGColor;
}

- (void)setBarColor:(UIColor *)barColor {
    _barColor = barColor;
    _layerProgress.strokeColor = barColor.CGColor;
}

- (void)setKnobColor:(UIColor *)knobColor {
    _knobColor = knobColor;
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
