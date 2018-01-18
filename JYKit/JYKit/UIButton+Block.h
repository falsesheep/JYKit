//
//  UIButton+Block.h
//  ganqishi
//
//  Created by jijeMac2 on 14-5-13.
//  Copyright (c) 2014年 colin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按键操作Block
 */
typedef void (^ActionBlock)();

@interface UIButton (Block)

/**
 *  用block处理button的事件
 *
 *  @param controlEvent 事件
 *  @param action       处理事件的block
 *
 *  @see ActionBlock
 */
- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end
