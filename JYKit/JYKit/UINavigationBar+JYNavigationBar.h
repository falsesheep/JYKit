//
//  UINavigationBar+JYNavigationBar.h
//  JYKit
//
//  Created by Ren Jing on 16/6/14.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JYNavigationBar)

/**
 *  获得 Navigation Bar 下方分割线
 *
 *  @return 分割线
 */
- (UIImageView *)bottomLine;

/**
 设置背景图片颜色

 @param color 背景颜色
 */
- (void)JY_setBackgroundColor:(UIColor *)color;

@end
