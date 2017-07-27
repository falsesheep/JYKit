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
    NSString *service = [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"];
    NSString *ret = [self valueForKeychainKey:key service:service];
    if (!ret) {
        OSStatus status = [self setValue:uuid forKeychainKey:key inService:service];
        if (status == errSecSuccess) {
            ret = uuid;
        }
    }
    return ret;
}

#pragma mark - Keychain methods
// 添加Keychain Value
- (OSStatus)setValue:(NSString *)value forKeychainKey:(NSString *)key inService:(NSString *)service {
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleWhenUnlocked;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecValueData] = [value dataUsingEncoding:NSUTF8StringEncoding];
    return SecItemAdd((__bridge CFDictionaryRef)keychainItem, NULL);
}

// 获取Keychain Value
- (NSString *)valueForKeychainKey:(NSString *)key service:(NSString *)service {
    NSMutableDictionary *keychainItem = [[NSMutableDictionary alloc] init];
    keychainItem[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    keychainItem[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleWhenUnlocked;
    keychainItem[(__bridge id)kSecAttrAccount] = key;
    keychainItem[(__bridge id)kSecAttrService] = service;
    keychainItem[(__bridge id)kSecReturnData] = @YES;
    CFTypeRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)keychainItem, &result);
    if (status != errSecSuccess) {
        return nil;
    }
    if (!result) {
        return nil;
    }
    return [NSString stringWithUTF8String:[(__bridge NSData *)result bytes]];
}

@end
