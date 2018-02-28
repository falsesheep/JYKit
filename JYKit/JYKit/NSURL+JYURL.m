//
//  NSURL+JYURL.m
//  JYKit
//
//  Created by Jia Yang on 2018/2/28.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "NSURL+JYURL.h"

@implementation NSURL (JYURL)

- (NSDictionary *)parameters {
    NSMutableDictionary *ret = [NSMutableDictionary dictionary];
    NSArray *components = [self.query componentsSeparatedByString:@"&"];
    for (NSString *component in components) {
        NSArray *keyValue = [component componentsSeparatedByString:@"="];
        if (keyValue.count != 2) {
            continue;
        }
        ret[keyValue[0]] = keyValue[1];
    }
    return ret;
}

@end
