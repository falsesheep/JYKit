//
//  UIDevice+JYUID.h
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (JYUID)

/**
 *  创建并获取设备的唯一标识，该标识存储在keychain中
 *
 *  @return 设备的唯一标识
 */
- (NSString *)UID;

@end
