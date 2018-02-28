//
//  BackgroundBlurTrigger.h
//  JYKit
//
//  Created by Jia Yang on 2018/2/28.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundBlurTrigger : NSObject
/// 控制程序进入后台时，是否触发Blur效果
@property (nonatomic, assign) BOOL shouldTriggerBlur;

/**
 单例创建Trigger

 @return Trigger
 */
+ (instancetype)sharedTrigger;

/**
 添加blur层
 */
- (void)addBlur;

/**
 删除blur层
 */
- (void)removeBlur;

@end
