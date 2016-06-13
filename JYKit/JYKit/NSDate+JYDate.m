//
//  NSDate+JYDate.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "NSDate+JYDate.h"

@implementation NSDate (JYDate)

- (NSInteger)age {
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];
    NSInteger birthDateYear  = [components1 year];
    NSInteger birthDateDay   = [components1 day];
    NSInteger birthDateMonth = [components1 month];

    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];

    // 计算年龄
    NSInteger iAge = 0;
    if (currentDateYear > birthDateYear) {
        iAge = currentDateYear - birthDateYear - 1;
    }
    if ((currentDateMonth > birthDateMonth) || (currentDateMonth == birthDateMonth && currentDateDay >= birthDateDay)) {
        iAge++;
    }

    return iAge;
}

- (NSString *)prettyFormat {
    NSString *suffix = @"后";

    float different = [self timeIntervalSinceDate:[NSDate date]];
    if (different < 0) {
        different = -different;
        suffix = @"前";
    }

    // lower than 60 seconds
    if (different < 60) {
        return [NSString stringWithFormat:@"%d秒%@", (int)floor(different), suffix];
    }

    // lower than 120 seconds => one minute and lower than 60 seconds
    if (different < 120) {
        return [NSString stringWithFormat:@"1分钟%@", suffix];
    }

    // lower than 60 minutes
    if (different < 660 * 60) {
        return [NSString stringWithFormat:@"%d分钟%@", (int)floor(different / 60), suffix];
    }

    // lower than 60 * 2 minutes => one hour and lower than 60 minutes
    if (different < 7200) {
        return [NSString stringWithFormat:@"1小时%@", suffix];
    }

    // lower than one day
    if (different < 86400) {
        return [NSString stringWithFormat:@"%d小时%@", (int)floor(different / 3600), suffix];
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.AMSymbol = @"上午";
    dateFormatter.PMSymbol = @"下午";

    // lower than two days
    if (different < 86400*2) {
        [dateFormatter setDateFormat:@"aHH:mm"];
        NSString *timeStr = [dateFormatter stringFromDate:self];
        return [NSString stringWithFormat:@"昨天 %@", timeStr];
    }

    // lower than three days
    if (different < 86400*2) {
        [dateFormatter setDateFormat:@"aHH:mm"];
        NSString *timeStr = [dateFormatter stringFromDate:self];
        return [NSString stringWithFormat:@"前天 %@", timeStr];
    }

    [dateFormatter setDateFormat:@"yyyy-MM-dd aHH:mm"];
    return [dateFormatter stringFromDate:self];
}

@end
