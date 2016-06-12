//
//  NSString+JYString.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JYString)

/**
 *  弹框提示
 */
- (void)alert;

/**
 *  限制宽度确认文字高度，或限制高度确认文字宽度
 *
 *  @param font 文字字体
 *  @param maxWidth  限宽(不需要限宽时设为0)
 *  @param maxHeight 限高(不需要限高时设为0)
 *
 *  @return 容纳所有文字所需要的大小
 */
- (CGSize)acceptableSizeWithFont:(UIFont *)font
                         maxWith:(CGFloat)maxWidth
                       maxHeight:(CGFloat)maxHeight;

@end
