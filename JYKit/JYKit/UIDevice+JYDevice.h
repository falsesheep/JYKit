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

@end
