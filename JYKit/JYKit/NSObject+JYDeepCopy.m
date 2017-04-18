//
//  NSObject+JYDeepCopy.m
//  JYKit
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "NSObject+JYDeepCopy.h"
#import <objc/message.h>

@implementation NSObject (JYDeepCopy)

/// 深拷贝
- (instancetype)deepCopy {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [self init];
    if (!self) {
        return nil;
    }

    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

@end
