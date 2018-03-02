//
//  JYIntroView.h
//  TEST
//
//  Created by Ren Jing on 15/3/17.
//  Copyright (c) 2015年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYIntroView : UIView

/**
 生成程序引导页

 @param images 引导页图片
 @param enterBtn 引导页最后一页的按钮
 @param enterBlock 引导页最后一页按钮的动作
 @return 引导页
 */
- (instancetype)initWithImages:(NSArray *)images enterButton:(UIButton *)enterBtn clickedEnterCallBackBlock:(void(^)(void))enterBlock;
@end
