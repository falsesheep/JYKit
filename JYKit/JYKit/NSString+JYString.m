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

@end
