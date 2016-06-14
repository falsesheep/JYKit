//
//  UINavigationBar+JYNavigationBar.m
//  JYKit
//
//  Created by Ren Jing on 16/6/14.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UINavigationBar+JYNavigationBar.h"

@implementation UINavigationBar (JYNavigationBar)

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
