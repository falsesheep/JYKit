//
//  UIBarButtonItem+JYBarButtonItem.h
//  JYKit
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (JYBarButtonItem)

/**
 自定义文字和图片的Item
 
 @param title 文字(NSAttributedString)
 @param image 图片
 @param target target
 @param action SEL
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTitle:(NSAttributedString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

/**
 左右10像素补偿
 
 @return UIBarButtonItem
 */
+ (UIBarButtonItem *)fixedSpacer NS_DEPRECATED_IOS(2_0, 10_0);

@end
