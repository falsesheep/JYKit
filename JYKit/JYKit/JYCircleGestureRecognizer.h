//
//  JYCircleGestureRecognizer.h
//  testKnob
//
//  Created by Ren Jing on 16/8/16.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  单指转动动作
 */
@interface JYCircleGestureRecognizer : UIPanGestureRecognizer

/// 当前旋转角度
@property (nonatomic, assign) CGFloat touchAngle;

@end
