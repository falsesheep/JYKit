//
//  JYDashLineView.h
//  JYKit
//
//  Created by Ren Jing on 16/5/26.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

// 虚线View
@interface JYDashLineView : UIView
@property (nonatomic, strong) NSArray *dashPatterns;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@end
