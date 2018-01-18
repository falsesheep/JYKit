//
//  JYDashLineView.h
//  JYKit
//
//  Created by Ren Jing on 16/5/26.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>
// 虚线View
IB_DESIGNABLE
@interface JYDashLineView : UIView

/// 虚线颜色
@property (nonatomic, strong) IBInspectable UIColor *lineColor;

/// 虚线宽度
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

/// 虚线长度
@property (nonatomic, assign) IBInspectable CGFloat patternShow;

/// 虚线间隔
@property (nonatomic, assign) IBInspectable CGFloat patternHide;

/// 起点
@property (nonatomic, assign) IBInspectable CGPoint startPoint;

/// 终点
@property (nonatomic, assign) IBInspectable CGPoint endPoint;
@end
