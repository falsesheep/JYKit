//
//  UIImage+JYEffects.m
//  JYKit
//
//  Created by Ren Jing on 16/3/20.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UIImage+JYEffects.h"

@implementation UIImage (JYEffects)

+ (UIImage *)captureImageFromView:(UIView *)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    [view.layer renderInContext:ctx];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    [color setFill];
    CGContextFillRect(ctx, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(ctx, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(ctx, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end