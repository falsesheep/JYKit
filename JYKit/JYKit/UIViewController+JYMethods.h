//
//  UIViewController+JYMethods.h
//  JYKit
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JYMethods)

/// 检查程序是否有更新
- (void)checkForUpgradeWithAppID:(NSString *)appID;

@end
