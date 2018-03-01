//
//  UINavigationBar+JYNavigationBar.m
//  JYKit
//
//  Created by Ren Jing on 16/6/14.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UINavigationBar+JYNavigationBar.h"
#import "JRSwizzle.h"

@implementation UINavigationBar (JYNavigationBar)

+ (void)load {
    [UINavigationBar jr_swizzleMethod:@selector(layoutSubviews) withMethod:@selector(jy_layoutSubviews) error:nil];
}

- (void)jy_layoutSubviews {
    [self jy_layoutSubviews];
    // iOS 11去除NavBar左右空白
    if (UIDevice.currentDevice.systemVersion.doubleValue >= 11.0) {
        //        self.layoutMargins = UIEdgeInsetsZero;
        for (UIView *subview in self.subviews) {
            if ([NSStringFromClass(subview.class) containsString:@"ContentView"]) {
                subview.layoutMargins = UIEdgeInsetsMake(0, 8, 0, 8);
            }
        }
    }
}

- (UIImageView *)bottomLine {
    return [self findHairlineImageViewUnder:self];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
