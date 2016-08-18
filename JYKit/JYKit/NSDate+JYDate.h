//
//  NSDate+JYDate.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JYDate)

/**
 *  根据出生年月算出年龄
 *
 *  @return 年龄
 */
- (NSInteger)age;

/**
 *  论坛时间格式
 *
 *  @return 论坛时间格式
 */
- (NSString *)prettyFormat;

/**
 *  返回“yyyy-MM-dd HH:mm”格式的时间
 *
 *  @return 返回“yyyy-MM-dd HH:mm”格式的时间
 */
- (NSString *)normalFormat;

/**
 *  计算这个月有多少天
 *
 *  @return 天数
 */
- (NSUInteger)numberOfDaysInCurrentMonth;

/**
 *  计算这是礼拜几
 *
 *  @return 礼拜几
 */
- (NSUInteger)weeklyOrdinality;

@end
