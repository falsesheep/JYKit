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
    CGRect screenRect = view.bounds;
    UIGraphicsBeginImageContext(screenRect.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
