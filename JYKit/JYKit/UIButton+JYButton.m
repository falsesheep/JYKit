//
//  UIButton+JYButton.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UIButton+JYButton.h"

@implementation UIButton (JYButton)

- (void)setImageToRight {
    UIImageView *img = self.imageView;
    UILabel *label = self.titleLabel;
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -img.frame.size.width, 0, img.frame.size.width);
    self.imageEdgeInsets = UIEdgeInsetsMake(0, label.frame.size.width, 0, -label.frame.size.width);
}

- (void)setImageToTop {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGFloat totalHeight = imageSize.height + titleSize.height + 5;
    self.imageEdgeInsets = UIEdgeInsetsMake(imageSize.height-totalHeight, 0, 0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, titleSize.height-totalHeight, 0);
}

@end
