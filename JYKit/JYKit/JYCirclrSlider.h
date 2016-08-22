//
//  JYCirclrSlider.h
//  testKnob
//
//  Created by Ren Jing on 16/8/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYCirclrSlider : UIControl
/// 当前值
@property (nonatomic, assign) CGFloat value;
/// 轨道颜色
@property (nonatomic, strong) UIColor *trackColor;
/// 滚动条颜色(注意: 设定barImage后不起作用)
@property (nonatomic, strong) UIColor *barColor;
/// 滑块颜色
@property (nonatomic, strong) UIColor *knobColor;
/**
 *  初始化
 *
 *  @param frame      frame
 *  @param maxValue   最大值
 *  @param minValue   最小值
 *  @param startAngle 最小值所在位置
 *  @param barWidth   滚动条宽度
 *  @param knobWidth  滑块宽度
 *  @param barImage  滚动条背景图片
 *
 *  @return JYCirclrSlider实例
 */
- (instancetype)initWithFrame:(CGRect)frame
                     maxValue:(CGFloat)maxValue
                     minValue:(CGFloat)minValue
                   startAngle:(CGFloat)startAngle
                     barWidth:(CGFloat)barWidth
                    knobWidth:(CGFloat)knobWidth
                     barImage:(UIImage *)barImage;

@end
