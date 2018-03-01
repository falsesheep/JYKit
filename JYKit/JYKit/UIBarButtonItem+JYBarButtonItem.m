//
//  UIBarButtonItem+JYBarButtonItem.m
//  JYKit
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "UIBarButtonItem+JYBarButtonItem.h"

@implementation UIBarButtonItem (JYBarButtonItem)

+ (UIBarButtonItem *)itemWithTitle:(NSAttributedString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
    NSAssert(title || image, @"标题和图片不能都为nil");
    // 计算出button的frame
    CGSize titleSize = title.size;
    CGSize imageSize = image.size;
    CGFloat buttonSpacing = !title || !image ? 0 : 3;
    CGFloat buttonWidth = ceilf(titleSize.width) + ceilf(imageSize.width) + buttonSpacing;
    CGRect buttonFrame = CGRectMake(0, 0, buttonWidth, 44);
    
    // 配置button
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    if (title) {
        [button setAttributedTitle:title forState:UIControlStateNormal];
    }
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)fixedSpacer NS_DEPRECATED_IOS(2_0, 10_0) {
    UIBarButtonItem *fixedSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpacer.width = -10;
    return fixedSpacer;
}

@end
