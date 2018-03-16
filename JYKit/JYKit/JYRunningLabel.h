//
//  JYRunningLabel.h
//  JYKit
//
//  Created by Jia Yang on 2018/3/16.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYRunningLabel : UIView

/**
 生成跑马灯Label

 @param frame frame
 @param content 文字内容
 @param speed 移动速度（单位为pt）
 @return 跑马灯Label
 */
- (instancetype)initWithFrame:(CGRect)frame content:(NSAttributedString *)content speed:(CGFloat)speed;

@end
