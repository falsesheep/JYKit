//
//  UIView+JYView.m
//  JYKit
//
//  Created by Ren Jing on 16/6/23.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UIView+JYView.h"

@implementation UIView (JYView)

- (void)applyInterpolatingMotionEffectWithRelativeValue:(CGFloat)value {
    // 移除之前的motion effect, 避免重复添加
    for (UIMotionEffect *motionEffect in self.motionEffects) {
        [self removeMotionEffect:motionEffect];
    }

    UIInterpolatingMotionEffect *interpolationHorizontal = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    interpolationHorizontal.minimumRelativeValue = @(-value);
    interpolationHorizontal.maximumRelativeValue = @(value);

    UIInterpolatingMotionEffect *interpolationVertical = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    interpolationVertical.minimumRelativeValue = @(-value);
    interpolationVertical.maximumRelativeValue = @(value);

    [self addMotionEffect:interpolationHorizontal];
    [self addMotionEffect:interpolationVertical];
}

@end
