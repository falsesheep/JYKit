//
//  UINavigationItem+ImageAndTitle.m
//  JYKit
//
//  Created by Ren Jing on 15/10/20.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import "UINavigationItem+ImageAndTitle.h"
#import "UIBarButtonItem+JYBarButtonItem.h"

@implementation UINavigationItem (ImageAndTitle)

- (void)setBarButtonItemForRightSide:(BOOL)isRightSide title:(NSAttributedString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
    UIBarButtonItem *barItem = [UIBarButtonItem itemWithTitle:title image:image target:target action:action];
    UIBarButtonItem *fixedSpacer = UIBarButtonItem.fixedSpacer;
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
