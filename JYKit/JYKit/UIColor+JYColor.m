//
//  UIColor+JYColor.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UIColor+JYColor.h"

@implementation UIColor (JYColor)

+ (UIColor *)colorWithRGBA:(NSArray *)rgba {
    UIColor *color = nil;
    if (rgba.count == 4) {
        color = [UIColor colorWithRed:[rgba[0] floatValue]/255.f  green:[rgba[1] floatValue]/255.f blue:[rgba[2] floatValue]/255.f alpha:[rgba[3] floatValue]];
    }else if (rgba.count == 3) {
        color = [UIColor colorWithRed:[rgba[0] floatValue]/255.f  green:[rgba[1] floatValue]/255.f blue:[rgba[2] floatValue]/255.f alpha:1];
    }else {
        color = [UIColor clearColor];
    }
    return color;
}

+ (UIColor *)colorWithHexValue:(NSString *)hex {
    UIColor *color = nil;
    if (hex.length >= 6) {
        hex = [hex componentsSeparatedByString:@"#"].lastObject;
        NSString *rHex = [hex substringWithRange:NSMakeRange(0, 2)];
        NSString *gHex = [hex substringWithRange:NSMakeRange(2, 2)];
        NSString *bHex = [hex substringWithRange:NSMakeRange(4, 2)];
        int red = strtoul(rHex.UTF8String, 0, 16);
        int green = strtoul(gHex.UTF8String, 0, 16);
        int blue = strtoul(bHex.UTF8String, 0, 16);
        color = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1];
    }else {
        color = [UIColor clearColor];
    }
    return color;
}

@end
