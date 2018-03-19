//
//  UIDevice+JYDevice.h
//  JYKit
//
//  Created by Ren Jing on 2017/4/28.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (JYDevice)


/**
 获取手机版本号, 例如: iPhone8,1

 @return 手机版本号
 */
+ (NSString *)platformType;


/**
 获取手机型号, 例如: iPhone 6s

 @return 手机型号
 */
+ (NSString *)platformString;


/**
 获取系统启动时的Unix时间

 @return 系统启动时的Unix时间
 */
+ (long)systemBootTime;


/**
 获取系统当前的Unix时间

 @return 系统当前的Unix时间
 */
+ (long)systemNowTime;


/**
 获取系统运行时长(不受‘用户修改系统时间’影响)
 
 @discussion 系统运行时长 = 系统当前时间 - 系统启动时间
 @return 系统运行时长
 */
+ (long)systemRunningDuration;

@end
