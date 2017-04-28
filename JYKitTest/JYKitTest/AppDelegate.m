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
    [[JYTest new] testFramework];
    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    NSLog(@"设备唯一标识:%@", [UIDevice currentDevice].UID);
    NSLog(@"设备型号:%@", [UIDevice platformString]);
    return YES;
}

@end
