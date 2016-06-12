//
//  UIColor+JYColor.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JYColor)

/**
 *  根据 RGBA 10进制生成颜色
 *
 *  @param rgba 10进制RGBA数组或RGB数组, 例如:@[@255,@0,@0,@1]
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithRGBA:(NSArray *)rgba;

/**
 *  根据 RGB 16进制生成颜色
 *
 *  @param hex 16进制RGB字符串, 例如:@"#DCDCDC"
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHexValue:(NSString *)hex;

@end
