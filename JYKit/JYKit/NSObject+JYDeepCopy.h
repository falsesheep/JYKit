//
//  NSObject+JYDeepCopy.h
//  JYKit
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JYDeepCopy) <NSCoding>

/// 深拷贝
- (instancetype)deepCopy;

@end
