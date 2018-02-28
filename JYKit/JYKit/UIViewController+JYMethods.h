//
//  UIViewController+JYMethods.h
//  JYKit
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JYMethods)

/**
 检查程序是否有更新

 @param appID App Store的AppID
 */
- (void)checkForUpgradeWithAppID:(NSString *)appID;

/**
 弹出App Store打分框

 @param appID App Store的AppID
 */
- (void)rateOnAppStoreWithAppID:(NSString *)appID;

#pragma mark - Alert
/**
 显示弹出框

 @param message 弹出框内容
 @param handler 弹出框回调
 @param isTwoButtonMode YES:包含"取消"和"确定"2个按钮, NO:只包含"确定"按钮
 @param title 弹出框Title
 */
- (void)alertMessage:(NSString *)message handler:(void(^)())handler twoButtonMode:(BOOL)isTwoButtonMode title:(NSString *)title;

/**
 显示弹出框

 @param message 弹出框内容
 @param handler 弹出框回调
 @param isTwoButtonMode YES:包含"取消"和"确定"2个按钮, NO:只包含"确定"按钮
 */
- (void)alertMessage:(NSString *)message handler:(void(^)())handler twoButtonMode:(BOOL)isTwoButtonMode;

/**
 显示弹出框

 @param message 弹出框内容
 @param handler 弹出框回调
 */
- (void)alertMessage:(NSString *)message handler:(void(^)())handler;

/**
 显示弹出框

 @param message 弹出框内容
 */
- (void)alertMessage:(NSString *)message;

@end
