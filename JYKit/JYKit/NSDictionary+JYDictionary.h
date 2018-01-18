//
//  NSDictionary+JYDictionary.h
//  JYKit
//
//  Created by Ren Jing on 16/6/17.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JYDictionary)

#pragma mark - 网络请求取值前，先判断Null，避免闪退

/**
 字典里取Int类型

 @param aKey key
 @return value
 */
- (NSInteger)integerForKey:(id)aKey;

/**
 字典里取double类型

 @param aKey key
 @return value
 */
- (double)doubleForKey:(id)aKey;

/**
 字典里取String类型

 @param aKey key
 @return value
 */
- (NSString *)stringForKey:(id)aKey;

/**
 字典里取array类型

 @param aKey key
 @return value
 */
- (NSArray *)arrayForKey:(id)aKey;

/**
 字典里取对象类型

 @param aKey key
 @return value
 */
- (NSDictionary *)dictionaryForKey:(id)aKey;

@end
