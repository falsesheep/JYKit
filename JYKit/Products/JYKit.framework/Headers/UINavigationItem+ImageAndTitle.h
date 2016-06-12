//
//  UINavigationItem+ImageAndTitle.h
//  JYKit
//
//  Created by Ren Jing on 15/10/20.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (ImageAndTitle)

- (void)setBackBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image target:(id)target action:(SEL)action;

@end
