//
//  JYGradientView.h
//  JYKit
//
//  Created by Ren Jing on 16/6/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>
// 渐变色View
IB_DESIGNABLE
@interface JYGradientView : UIView
/// 渐变起始颜色
@property (nonatomic, strong) IBInspectable UIColor *startColor;
/// 渐变截止颜色
@property (nonatomic, strong) IBInspectable UIColor *endColor;
/// 渐变中间过渡颜色
@property (nonatomic, strong) IBInspectable UIColor *middleColor;
/// 从哪里（控制渐变色方向，0~1）
@property (nonatomic, assign) IBInspectable CGPoint startPoint;
/// 到哪里（控制渐变色方向，0~1）
@property (nonatomic, assign) IBInspectable CGPoint endPoint;
@end
