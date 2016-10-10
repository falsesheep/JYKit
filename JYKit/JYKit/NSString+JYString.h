//
//  NSString+JYString.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/// The alignment for drawing an NSString inside a bounding rectangle.
typedef NS_ENUM(NSUInteger, NCStringAlignment) {
    NCStringAlignmentLeftTop,
    NCStringAlignmentCenterTop,
    NCStringAlignmentRightTop,
    NCStringAlignmentLeftCenter,
    NCStringAlignmentCenter,
    NCStringAlignmentRightCenter,
    NCStringAlignmentLeftBottom,
    NCStringAlignmentCenterBottom,
    NCStringAlignmentRightBottom
};

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

#pragma mark - double转NSString
/**
 *  double转NSString(条件:保留2位小数, 允许四舍五入, 不隐藏末尾的0), 例如:1.201 显示为 1.20
 *
 *  @param value double Value
 *
 *  @return NSString Value
 */
+ (NSString *)stringFromDouble:(double)value;

/**
 *  double转NSString(条件:保留2位小数, 允许四舍五入, 隐藏末尾的0), 例如:1.201 显示为 1.2
 *
 *  @param value double Value
 *
 *  @return NSString Value
 */
+ (NSString *)prettyStringFromDouble:(double)value;

/**
 *  double转NSString
 *
 *  @param value      double Value
 *  @param count      最多显示小数点的位数
 *  @param allowRound 是否四舍五入
 *  @param pretty     是否隐藏末尾的0, 例如:1.20 显示为 1.2
 *
 *  @return NSString Value
 */
+ (NSString *)stringFromDouble:(double)value
                  decimalCount:(NSUInteger)count
                    allowRound:(BOOL)allowRound
                  prettyFormat:(BOOL)pretty;

/**
 *  判断是否是合法的手机号
 *
 *  @return 是否是合法的手机号
 */
- (BOOL)isMobileNumber;

/**
 *  转换为md5
 *
 *  @return md5加密后的值
 */
- (NSString *)encryptWithMD5;

/**
 *  生成字符串的二维码
 *
 *  @param sideWidth 二维码宽度
 *
 *  @return 二维码图片
 */
- (UIImage *)generateQRCodeWithSideWidth:(CGFloat)sideWidth;

/// Draw the `NSString` inside the bounding rectangle with a given alignment.
- (void)drawAtPointInRect:(CGRect)rect withAttributes:(NSDictionary<NSString *,id> *)attrs andAlignment:(NCStringAlignment)alignment;
@end
