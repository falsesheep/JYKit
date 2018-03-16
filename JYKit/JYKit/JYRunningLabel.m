//
//  JYRunningLabel.m
//  JYKit
//
//  Created by Jia Yang on 2018/3/16.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "JYRunningLabel.h"
#import "UIView+JYFrame.h"

#define RunningLabelSpacing 50

@interface JYRunningLabel ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *lb0;
@property (nonatomic, strong) UILabel *lb1;
@property (nonatomic, assign) BOOL labelNeedScroll; // 文字长度是否超过frame
@property (nonatomic, assign) CGFloat speed;
@end

@implementation JYRunningLabel

- (instancetype)initWithFrame:(CGRect)frame content:(NSAttributedString *)content speed:(CGFloat)speed {
    self = [super initWithFrame:frame];
    if (self) {
        _speed = speed;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
        self.clipsToBounds = YES;
        // 添加第一个label
        _lb0 = [self labelWithContent:content];
        [_scrollView addSubview:_lb0];
        // 判断文字是否需要滚动
        _labelNeedScroll = (_lb0.bounds.size.width > frame.size.width);
        if (_labelNeedScroll) { // 添加另一个label
            _lb1 = [self labelWithContent:content];
            [_lb1 setX:CGRectGetMaxX(_lb0.frame) + RunningLabelSpacing];
            [_scrollView addSubview:_lb1];
            [_scrollView setWith:CGRectGetMaxX(_lb1.frame)];
        }
        [self beginRunning];
    }
    return self;
}

/// 根据content生成Label
- (UILabel *)labelWithContent:(NSAttributedString *)content {
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectZero];
    lb.backgroundColor = [UIColor clearColor];
    lb.attributedText = content;
    [lb sizeToFit];
    [lb setHeight:self.frame.size.height];
    return lb;
}

/// 开始滚动
- (void)beginRunning {
    // 移动ScrollView
    CGFloat duration = self.frame.size.width / _speed;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [_scrollView setX:0];
    } completion:^(BOOL finished) {
        if (_labelNeedScroll) {
            [self movingLabel];
        }
    }];
}

/// 反复滚动显示标签
- (void)movingLabel {
    // 移动Label
    CGFloat movingLength = _lb0.frame.size.width + RunningLabelSpacing;
    CGFloat duration = movingLength / _speed;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue = @(-movingLength);
    animation.duration = duration;
    animation.repeatCount = 10000;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_scrollView.layer addAnimation:animation forKey:@"moving label"];
}

@end
