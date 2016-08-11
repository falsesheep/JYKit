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
 *  @param x,y,width.height
 */
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWith:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

@end
