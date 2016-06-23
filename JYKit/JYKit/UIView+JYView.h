//
//  UIView+JYView.h
//  JYKit
//
//  Created by Ren Jing on 16/6/23.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYView)

/**
 *  模仿iOS主屏幕上的景深效果
 *
 *  @param value 偏移值
 */
- (void)applyInterpolatingMotionEffectWithRelativeValue:(CGFloat)value;

@end