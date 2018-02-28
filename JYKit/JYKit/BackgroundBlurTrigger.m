//
//  BackgroundBlurTrigger.m
//  JYKit
//
//  Created by Jia Yang on 2018/2/28.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "BackgroundBlurTrigger.h"

@interface BackgroundBlurTrigger ()
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@end

@implementation BackgroundBlurTrigger

static BackgroundBlurTrigger *_instance = nil;
+ (instancetype)sharedTrigger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [BackgroundBlurTrigger new];
    });
    return _instance;
}

- (void)setShouldTriggerBlur:(BOOL)shouldTriggerBlur {
    _shouldTriggerBlur = shouldTriggerBlur;
}

- (void)addBlur {
    // 移除之前的Blur效果
    if (_visualEffectView) {
        [_visualEffectView removeFromSuperview];
    }
    
    if (_shouldTriggerBlur) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _visualEffectView.alpha = 1;
        UIWindow *window = UIApplication.sharedApplication.delegate.window;
        _visualEffectView.frame = window.bounds;
        [window addSubview:_visualEffectView];
    }
}

- (void)removeBlur {
    if (_visualEffectView) {
        [UIView animateWithDuration:0.33 animations:^{
            _visualEffectView.alpha = 0;
        } completion:^(BOOL finished) {
            [_visualEffectView removeFromSuperview];
        }];
    }
}

@end
