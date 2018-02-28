//
//  NSURL+JYURL.h
//  JYKit
//
//  Created by Jia Yang on 2018/2/28.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (JYURL)

/**
 获取url路径中的参数对象

 @return url路径中的参数对象
 */
- (NSDictionary *)parameters;

@end
