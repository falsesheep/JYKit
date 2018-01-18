//
//  UIView+JYFrame.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYFrame)

/**
 *  改变View的frame
 *
 *  @param x x
 */
- (void)setX:(CGFloat)x;

/**
 *  改变View的frame
 *
 *  @param y y
 */
- (void)setY:(CGFloat)y;

/**
 *  改变View的frame
 *
 *  @param width width
 */
- (void)setWith:(CGFloat)width;

/**
 *  改变View的frame
 *
 *  @param height height
 */
- (void)setHeight:(CGFloat)height;

@end
