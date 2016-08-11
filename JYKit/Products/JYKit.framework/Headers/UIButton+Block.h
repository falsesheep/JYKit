//
//  UIButton+Block.h
//  ganqishi
//
//  Created by jijeMac2 on 14-5-13.
//  Copyright (c) 2014年 colin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)
@property (readonly) NSMutableDictionary *event;
/**
 *  用block处理button的事件
 *
 *  @param controlEvent 事件
 *  @param action       处理事件的block
 */
- (void)handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;
@end
