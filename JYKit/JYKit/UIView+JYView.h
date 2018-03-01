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

/**
 *  使View显示出图片的形状
 *
 *  @param maskImage Mask图片
 *  @param scaled    按原图片大小显示，还是按View大小显示
 */
- (void)viewWithMaskImage:(UIImage *)maskImage scaled:(BOOL)scaled;

/**
 设置部分圆角

 @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 @param radii 需要设置的圆角大小
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;

@end
