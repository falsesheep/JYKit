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
@property (nonatomic, strong) NSArray *dashPatterns;
@property (nonatomic, strong) IBInspectable UIColor *lineColor;
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;
@property (nonatomic, assign) IBInspectable CGPoint startPoint;
@property (nonatomic, assign) IBInspectable CGPoint endPoint;
@end
