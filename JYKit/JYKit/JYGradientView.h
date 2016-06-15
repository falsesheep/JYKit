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
@property (nonatomic, strong) IBInspectable UIColor *startColor;
@property (nonatomic, strong) IBInspectable UIColor *endColor;
@property (nonatomic, strong) IBInspectable UIColor *middleColor;
@property (nonatomic, assign) IBInspectable CGPoint startPoint;
@property (nonatomic, assign) IBInspectable CGPoint endPoint;
@end
