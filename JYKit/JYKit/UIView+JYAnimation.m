//
//  UIView+JYAnimation.m
//  JYKit
//
//  Created by Jia Yang on 2019/6/23.
//  Copyright © 2019 FALSESHEEP. All rights reserved.
//

#import "UIView+JYAnimation.h"
#import <objc/runtime.h>

@implementation UIView (JYAnimation)

static NSString *kDeltaTime;

#pragma mark - Private Property暂停时间间隔
- (CFTimeInterval)deltaTime {
    return [objc_getAssociatedObject(self, &kDeltaTime) doubleValue];
}

- (void)setDeltaTime:(CFTimeInterval)deltaTime {
    objc_setAssociatedObject(self, &kDeltaTime, @(deltaTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)pauseAnim {
    self.layer.speed = 0;
    self.layer.timeOffset = CACurrentMediaTime() - self.deltaTime; // 设置layer动画的起始位置
}

- (void)continueAnim {
    self.layer.speed = 1;
    self.layer.beginTime = CACurrentMediaTime(); // 设置layer动画的延迟时间
    self.deltaTime = self.layer.beginTime - self.layer.timeOffset;
}

@end
