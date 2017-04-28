//
//  JYExceptionHandle.h
//  JYKit
//
//  Created by Ren Jing on 2017/4/27.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYExceptionHandle : NSObject

/**
 记录程序的Crash Log
 */
+ (void)writeCrashLogWhenNecessary;

/**
 获取所有的Crash Log

 @return Crash Log的FilePath
 */
+ (NSArray *)crashLogs;

/**
 移除所有的Crash Log

 @return 是否移除成功
 */
+ (BOOL)removeCrashLogs;

@end
