//
//  UIDevice+JYUID.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UIDevice+JYUID.h"

@implementation UIDevice (JYUID)

- (NSString *)UID {
    NSString *uuid = [NSUUID UUID].UUIDString;
    NSString *key = @"deviceUID";
    NSString *service = key;
    if (![[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if (![self valueForKeychainKey:key service:service]) {
        [self setValue:uuid forKeychainKey:key inService:key];
    }
    return [self valueForKeychainKey:key service:service];
}

#pragma mark - Keychain methods
// 添加Keychain Value
- (OSStatus)setValue:(NSString *)value forKeychainKey:(NSString *)key inService:(NSString *)service {
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAlways;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecValueData] = [value dataUsingEncoding:NSUTF8StringEncoding];
    return SecItemAdd((__bridge CFDictionaryRef)keychainItem, NULL);
}

// 获取Keychain Value
- (NSString *)valueForKeychainKey:(NSString *)key service:(NSString *)service {
    OSStatus status;
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAlways;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecReturnData] = (__bridge id)kCFBooleanTrue;
    keychainItem[(__bridge id)kSecReturnAttributes] = (__bridge id)kCFBooleanTrue;
    CFDictionaryRef result = nil;
    status = SecItemCopyMatching((__bridge CFDictionaryRef)keychainItem, (CFTypeRef *)&result);
    if (status != noErr) {
        return nil;
    }
    NSDictionary *resultDict = (__bridge_transfer NSDictionary *)result;
    NSData *data = resultDict[(__bridge id)kSecValueData];
    if (!data) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
