//
//  UIImage+JYEffects.h
//  JYKit
//
//  Created by Ren Jing on 16/3/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JYEffects)

/**
 *  截屏
 *
 *  @param view 所需要截取的View
 *
 *  @return 截屏图片
 */
+ (UIImage *)captureImageFromView:(UIView *)view;

/**
 *  生成纯色的image
 *
 *  @param color 图片颜色
 *  @param size  图片大小
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
