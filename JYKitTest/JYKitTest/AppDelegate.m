//
//  AppDelegate.m
//  JYKitTest
//
//  Created by Ren Jing on 15/10/19.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [JYExceptionHandle writeCrashLogWhenNecessary]; // 记录Crash
    
    // 进入后台时，触发Blur效果
    BackgroundBlurTrigger.sharedTrigger.shouldTriggerBlur = YES;
    
    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    NSLog(@"设备唯一标识:%@", [UIDevice currentDevice].UID);
    NSLog(@"设备型号:%@", [UIDevice platformString]);
    NSLog(@"User-Agent:%@", NSURL.userAgent);
    
    return YES;
}

#pragma mark - 进入后台时，触发Blur效果
- (void)applicationDidEnterBackground:(UIApplication *)application {
    [BackgroundBlurTrigger.sharedTrigger addBlur];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [BackgroundBlurTrigger.sharedTrigger removeBlur];
}

@end
