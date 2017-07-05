//
//  JYLabelScroller.m
//  JYKit
//
//  Created by Ren Jing on 2017/7/5.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "JYLabelScroller.h"
#import "UIView+JYFrame.h"

@interface JYLabelScroller ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray<NSAttributedString *> *labels;
@property (nonatomic, strong) UIScrollView *pageCurrent;
@property (nonatomic, strong) UIScrollView *pageNext;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) float minDuration;
@property (nonatomic, assign) float dismissDelay;
@end

@implementation JYLabelScroller

- (instancetype)initWithFrame:(CGRect)frame
                       labels:(NSArray<NSAttributedString *> *)labels
                  minDuration:(float)minDuration
                 dismissDelay:(float)dismissDelay {
    self = [super initWithFrame:frame];
    if (self) {
        _labels = labels;
        _minDuration = minDuration;
        _dismissDelay = dismissDelay;
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
        // Labels
        float labelHeight = frame.size.height;
        if (_labels.count == 0) {
            return self;
        }else {
            // Current
            _pageCurrent = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, labelHeight)];
            [_scrollView addSubview:_pageCurrent];
            // Next
            _pageNext = [[UIScrollView alloc] initWithFrame:CGRectMake(0, labelHeight, frame.size.width, labelHeight)];
            [_scrollView addSubview:_pageNext];

            // 初始化Label
            [self loadDataAtIndex:0 onPage:1];
            if (_labels.count == 1) {
                [self loadDataAtIndex:0 onPage:2];
            }else {
                [self loadDataAtIndex:1 onPage:2];
            }

            // 开始横向滚动
            [self scrollHorizontally];
        }
    }
    return self;
}

- (void)scrollVertically {
    NSInteger nextIndex = 0;
    if (_currentIndex == _labels.count - 1) {
        _currentIndex = 0;
        nextIndex = 1;
    }else if (_currentIndex == _labels.count - 2) {
        _currentIndex ++;
        nextIndex = 0;
    }else {
        _currentIndex ++;
        nextIndex = _currentIndex + 1;
    }
    [UIView animateWithDuration:0.33 animations:^{
        _scrollView.contentOffset = CGPointMake(0, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self loadDataAtIndex:_currentIndex onPage:1];
        [self loadDataAtIndex:nextIndex onPage:2];
        _scrollView.contentOffset = CGPointZero;
        [self scrollHorizontally];
    }];
}

- (void)scrollHorizontally {
    // 横向滚动显示内容，内容滚动到底后，切换下一条Label
    UIButton *btnLabel;
    for (UIView *view in _pageCurrent.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            btnLabel = (UIButton *)view;
            break;
        }
    }
    // 内容可以显示下，不需要横向滚动
    float labelWidth = btnLabel.bounds.size.width;
    float pageWidth = _pageCurrent.bounds.size.width;
    if (labelWidth <= pageWidth) {
        [self performSelector:@selector(scrollVertically) withObject:nil afterDelay:_minDuration];
    }else {
        float offsetX = labelWidth - pageWidth;
        float duration = offsetX * 0.02;
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _pageCurrent.contentOffset = CGPointMake(offsetX, 0);
        } completion:^(BOOL finished) {
            float timeLeft = _minDuration - duration;
            if (timeLeft >= _dismissDelay) {
                [self performSelector:@selector(scrollVertically) withObject:nil afterDelay:timeLeft];
            }else {
                [self performSelector:@selector(scrollVertically) withObject:nil afterDelay:_dismissDelay];
            }
        }];
    }
}

- (void)loadDataAtIndex:(NSInteger)index onPage:(NSInteger)page {
    UIButton *btnLabel = [[UIButton alloc] init];
    btnLabel.tag = index;
    [btnLabel setAttributedTitle:_labels[index] forState:UIControlStateNormal];
    [btnLabel sizeToFit];
    [btnLabel setY:self.frame.size.height/2 - btnLabel.bounds.size.height/2];
    [btnLabel addTarget:self action:@selector(onClickLabel:) forControlEvents:UIControlEventTouchUpInside];
    UIScrollView *targetPage = _pageCurrent;
    if (page == 2) {
        targetPage = _pageNext;
    }
    // 移除之前的
    for (UIView *view in targetPage.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
            break;
        }
    }
    // 添加新的
    [targetPage addSubview:btnLabel];
    targetPage.contentOffset = CGPointZero;
}

- (void)onClickLabel:(UIButton *)btnLabel {
    if (self.delegate && [self.delegate respondsToSelector:@selector(JYLabelScroller:didClickedIndex:)]) {
        [self.delegate JYLabelScroller:self didClickedIndex:btnLabel.tag];
    }
}

@end
