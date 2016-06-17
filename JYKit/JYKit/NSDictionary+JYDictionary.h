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

- (NSInteger)integerForKey:(id)aKey;

- (double)doubleForKey:(id)aKey;

- (NSString *)stringForKey:(id)aKey;

- (NSArray *)arrayForKey:(id)aKey;

@end
