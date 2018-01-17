//
//  UINavigationItem+ImageAndTitle.m
//  JYKit
//
//  Created by Ren Jing on 15/10/20.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import "UINavigationItem+ImageAndTitle.h"

@implementation UINavigationItem (ImageAndTitle)

- (void)setBarButtonItemForRightSide:(BOOL)isRightSide title:(NSAttributedString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
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
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    // 左移10像素
    UIBarButtonItem *fixedSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpacer.width = -10;

    // 居左or居右
    if (isRightSide) {
        self.rightBarButtonItems = @[fixedSpacer, barItem];
    }else {
        self.leftBarButtonItems = @[fixedSpacer, barItem];
    }
}

- (void)hideLeftItems {
    self.leftBarButtonItems = nil;
    self.hidesBackButton = YES;
}

@end
