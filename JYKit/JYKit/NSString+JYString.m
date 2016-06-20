//
//  NSString+JYString.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "NSString+JYString.h"

@implementation NSString (JYString)

- (void)alert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:self delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (CGSize)acceptableSizeWithFont:(UIFont *)font
                         maxWith:(CGFloat)maxWidth
                       maxHeight:(CGFloat)maxHeight {
    CGSize ret = CGSizeZero;

    CGSize maxSize = CGSizeZero;
    if (maxWidth > 0 && maxHeight == 0) {
        maxSize = CGSizeMake(maxWidth, 3000);
    }else if (maxHeight > 0 && maxWidth == 0) {
        maxSize = CGSizeMake(3000, maxHeight);
    }else {
        maxSize = CGSizeMake(maxWidth, maxHeight);
    }
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSDictionary *attributes = @{NSFontAttributeName: font};
        ret = [self boundingRectWithSize:maxSize
                                 options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                              attributes:attributes context:nil].size;
    }else {
        NSLog(@"没有确认Size的方法");
    }
    return ret;
}

+ (NSString *)stringFromDouble:(double)value {
    return [NSString stringFromDouble:value decimalCount:2 allowRound:YES prettyFormat:NO];
}

+ (NSString *)prettyStringFromDouble:(double)value {
    return [NSString stringFromDouble:value decimalCount:2 allowRound:YES prettyFormat:YES];
}

+ (NSString *)stringFromDouble:(double)value
                  decimalCount:(NSUInteger)count
                    allowRound:(BOOL)allowRound
                  prettyFormat:(BOOL)pretty {
    double multiply = pow(10, count);
    double rounded = round(value * multiply);
    double devided = rounded / multiply;
    NSString *formatter = [NSString stringWithFormat:@"%%.%df", count];
    NSString *ret = [NSString stringWithFormat:formatter, devided];
    if (pretty) {
        while ([[ret substringFromIndex:ret.length-1] isEqualToString:@"0"]) {
            ret = [ret substringToIndex:ret.length-1];
        }
    }
    return ret;
}

@end
