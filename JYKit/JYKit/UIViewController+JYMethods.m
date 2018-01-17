//
//  UIViewController+JYMethods.m
//  JYKit
//
//  Created by Ren Jing on 2017/4/18.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "UIViewController+JYMethods.h"
#import "NSString+JYString.h"
#import "NSDictionary+JYDictionary.h"

@implementation UIViewController (JYMethods)

- (void)checkForUpgradeWithAppID:(NSString *)appID {
    NSString *api = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", appID];
    NSURL *url = [NSURL URLWithString:api];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // 接口报错
            [error.localizedDescription alert];
            return;
        }
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *results = [dic arrayForKey:@"results"];
        if (results.count == 0) {
            NSLog(@"App Store无版本记录，App可能是第一版，或者App被下架");
            return;
        }
        NSDictionary *dicLastVerInfo = results.firstObject;
        NSString *latestVer = [dicLastVerInfo stringForKey:@"version"];
        NSString *currentVer = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        if ([latestVer compare:currentVer options:NSNumericSearch] <= 0) {
            // 程序已是最新版本，不需要更新
            return;
        }
        NSString *releaseNotes = [dicLastVerInfo stringForKey:@"releaseNotes"];
        NSString *trackViewURL = [dicLastVerInfo stringForKey:@"trackViewUrl"];
        // 弹出更新提示框
        NSString *alertTitle = [NSString stringWithFormat:@"有新版本(%@)", latestVer];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertTitle message:releaseNotes preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *upgradeAct = [UIAlertAction actionWithTitle:@"升级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *updateURL = [NSURL URLWithString:trackViewURL];
            [[UIApplication sharedApplication] openURL:updateURL];
        }];
        [alert addAction:cancelAct];
        [alert addAction:upgradeAct];
        // 调整message为左对其
        UILabel *lbMsg = (UILabel *)alert.view.subviews.firstObject.subviews.firstObject.subviews.firstObject.subviews.firstObject.subviews.firstObject.subviews[1];
        lbMsg.textAlignment = NSTextAlignmentLeft;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:alert animated:YES completion:nil];
        });
    }];
    [task resume];
}

#pragma mark - Alert
- (void)alertMessage:(NSString *)message handler:(void(^)())handler twoButtonMode:(BOOL)isTwoButtonMode title:(NSString *)title {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAct = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAct = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler];
    [alert addAction:cancelAct];
    [alert addAction:confirmAct];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
}

- (void)alertMessage:(NSString *)message handler:(void(^)())handler twoButtonMode:(BOOL)isTwoButtonMode {
    [self alertMessage:message handler:handler twoButtonMode:isTwoButtonMode title:@"提示"];
}

- (void)alertMessage:(NSString *)message handler:(void(^)())handler {
    [self alertMessage:message handler:handler twoButtonMode:NO];
}

- (void)alertMessage:(NSString *)message {
    [self alertMessage:message handler:nil];
}

@end
