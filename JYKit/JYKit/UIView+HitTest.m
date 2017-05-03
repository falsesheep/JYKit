//
//  UIView+HitTest.m
//  YJD-Pro
//
//  Created by Ren Jing on 2017/5/3.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "UIView+HitTest.h"

@implementation UIView (HitTest)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                hitTestView.layer.borderWidth = 3;
                hitTestView.layer.borderColor = [UIColor redColor].CGColor;
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

@end
