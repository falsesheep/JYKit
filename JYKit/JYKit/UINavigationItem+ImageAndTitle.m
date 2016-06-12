//
//  UINavigationItem+ImageAndTitle.m
//  JYKit
//
//  Created by Ren Jing on 15/10/20.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import "UINavigationItem+ImageAndTitle.h"

@implementation UINavigationItem (ImageAndTitle)

- (void)setBackBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action {
    // 计算出button的frame
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17],
                                 NSForegroundColorAttributeName: [UIColor whiteColor]};
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:title attributes:attributes];
    CGSize titleSize = attrStr.size;
    CGSize imageSize = image.size;
    CGFloat buttonSpacing = 3;
    CGFloat buttonWidth = ceilf(titleSize.width) + ceilf(imageSize.width) + buttonSpacing;
    CGRect buttonFrame = CGRectMake(0, 0, buttonWidth, 44);
    
    // 配置button
    UIButton *backButton = [[UIButton alloc] initWithFrame:buttonFrame];
    [backButton setAttributedTitle:attrStr forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    // 左移10像素
    UIBarButtonItem *fixedSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpacer.width = -10;
    
    self.leftBarButtonItems = @[fixedSpacer, backItem];
}

@end
