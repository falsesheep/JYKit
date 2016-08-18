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

- (void)viewWithMaskImage:(UIImage *)maskImage scaled:(BOOL)scaled {
    CALayer *mask = [CALayer layer];
    mask.contents = (id)(maskImage.CGImage);
    if (scaled) {
        mask.frame = self.bounds;
    }else {
        mask.frame = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height);
    }
    self.layer.mask = mask;
    self.layer.masksToBounds = YES;
}

@end
