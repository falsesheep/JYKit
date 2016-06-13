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

@end
