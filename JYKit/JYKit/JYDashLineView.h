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
@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@property (nonatomic, strong) IBInspectable NSNumber *lineWidth;
@property (nonatomic, strong) IBInspectable NSNumber *dashPattern1;
@property (nonatomic, strong) IBInspectable NSNumber *dashPattern2;
@property (nonatomic, assign) IBInspectable CGPoint startPoint;
@property (nonatomic, assign) IBInspectable CGPoint endPoint;
@end
