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
 *  导航栏上的返回键
 *
 *  @param title  返回键文字
 *  @param image  返回键图片
 *  @param target target
 *  @param action 点击返回键触发的操作
 */
- (void)setBackBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

@end
