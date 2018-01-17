//
//  UINavigationItem+ImageAndTitle.h
//  JYKit
//
//  Created by Ren Jing on 15/10/20.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (ImageAndTitle)

/**
 *  导航栏上的操作按钮
 *
 *  @param isRightSide 居左or居右
 *  @param title  返回键文字(NSAttributedString)
 *  @param image  返回键图片
 *  @param target target
 *  @param action 点击返回键触发的操作
 */
- (void)setBarButtonItemForRightSide:(BOOL)isRightSide title:(NSAttributedString *)title image:(UIImage *)image target:(id)target action:(SEL)action;


/**
 隐藏返回按钮
 */
- (void)hideLeftItems;

@end
