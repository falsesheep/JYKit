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
    [[JYTest new] testFramework];
    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                         NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    NSLog(@"设备唯一标识:%@", [UIDevice currentDevice].UID);
    return YES;
}

@end
