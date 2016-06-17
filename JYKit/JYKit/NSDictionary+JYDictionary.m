//
//  NSDictionary+JYDictionary.m
//  JYKit
//
//  Created by Ren Jing on 16/6/17.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "NSDictionary+JYDictionary.h"

@implementation NSDictionary (JYDictionary)

- (id)objectForKeyCheckNull:(id)aKey {
    id value = [self objectForKey:aKey];
    if ([value isEqual:[NSNull null]]) {
        return nil;
    }
    return value;
}

- (NSInteger)integerForKey:(id)aKey {
    id value = [self objectForKeyCheckNull:aKey];
    return [value integerValue];
}

- (double)doubleForKey:(id)aKey {
    id value = [self objectForKeyCheckNull:aKey];
    return [value doubleValue];
}

- (NSString *)stringForKey:(id)aKey {
    id value = [self objectForKeyCheckNull:aKey];
    if (value) {
        return [NSString stringWithFormat:@"%@", value];
    }
    return @"";
}

- (NSArray *)arrayForKey:(id)aKey {
    id value = [self objectForKeyCheckNull:aKey];
    if (value && [value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return [NSArray array];
}

@end
