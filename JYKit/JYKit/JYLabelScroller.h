//
//  JYLabelScroller.h
//  JYKit
//
//  滚动Label
//
//  Created by Ren Jing on 2017/7/5.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYLabelScroller;
@protocol JYLabelScrollerDelegate <NSObject>
/**
 点击某个Label的回调

 @param labelScroller labelScroller
 @param index 点击的index
 */
- (void)JYLabelScroller:(JYLabelScroller *)labelScroller didClickedIndex:(NSInteger)index;
@end


@interface JYLabelScroller : UIView
@property (nonatomic, weak) id <JYLabelScrollerDelegate>delegate;

/**
 初始化JYLabelScroller

 @param frame frame
 @param labels 滚动显示的Label数组
 @param minDuration 单个最短显示时间
 @param dismissDelay 每个Label滚动结束后延迟多久消失
 @return JYLabelScroller
 */
- (instancetype)initWithFrame:(CGRect)frame
                       labels:(NSArray<NSAttributedString *> *)labels
                  minDuration:(float)minDuration
                 dismissDelay:(float)dismissDelay;
@end
