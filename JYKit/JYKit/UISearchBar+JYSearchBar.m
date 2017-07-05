//
//  UISearchBar+JYSearchBar.m
//  JYKit
//
//  Created by Ren Jing on 2017/7/5.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "UISearchBar+JYSearchBar.h"

@implementation UISearchBar (JYSearchBar)

- (UITextField *)searchBarTextField {
    return self.subviews.firstObject.subviews.lastObject;
}

@end
