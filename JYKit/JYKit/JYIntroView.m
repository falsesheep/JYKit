//
//  JYIntroView.m
//  TEST
//
//  Created by Ren Jing on 15/3/17.
//  Copyright (c) 2015年 FALSESHEEP. All rights reserved.
//

#import "JYIntroView.h"

@interface JYIntroView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *pagingScrollView;
@property (nonatomic, strong) NSArray *scrollViewPages;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger centerPageIndex;
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, copy) void (^enterCallBackBlock)(void);
@end

@implementation JYIntroView

- (instancetype)initWithImages:(NSArray *)images enterButton:(UIButton *)enterBtn clickedEnterCallBackBlock:(void(^)(void))enterBlock {
    self = [super init];
    if (self) {
        self.imageNames = images;
        self.enterButton = enterBtn;
        self.enterCallBackBlock = enterBlock;
        
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        self.frame = CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height);
        
        // Add Scroll View
        self.pagingScrollView = [[UIScrollView alloc] initWithFrame:screenBounds];
        self.pagingScrollView.delegate = self;
        self.pagingScrollView.pagingEnabled = YES;
        self.pagingScrollView.showsHorizontalScrollIndicator = NO;
        self.pagingScrollView.showsVerticalScrollIndicator = NO;
        self.pagingScrollView.bounces = NO;
        [self addSubview:self.pagingScrollView];
        
        // Add Page Control
        self.pageControl = [[UIPageControl alloc] initWithFrame:[self frameOfPageControl]];
        self.pageControl.userInteractionEnabled = NO;
        [self addSubview:self.pageControl];
        
        // Add Enter Button
        if (!self.enterButton) {
            self.enterButton = [[UIButton alloc] init];
            [self.enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
            self.enterButton.layer.borderWidth = 0.5;
            self.enterButton.layer.borderColor = [UIColor whiteColor].CGColor;
        }
        [self.enterButton addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
        self.enterButton.frame = [self frameOfEnterButton];
        self.enterButton.alpha = 0;
        [self addSubview:self.enterButton];
        
        [self reloadPages];
    }
    return self;
}

- (void)reloadPages {
    self.pageControl.numberOfPages = self.imageNames.count;
    self.pagingScrollView.contentSize = [self contentSizeOfScrollView];
    
    __block CGFloat x = 0;
    [[self scrollViewPages] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        obj.frame = CGRectOffset(obj.frame, x, 0);
        [self.pagingScrollView addSubview:obj];
        
        x += obj.frame.size.width;
    }];
}

- (NSArray *)scrollViewPages {
    if (self.imageNames.count == 0) {
        return nil;
    }
    
    if (_scrollViewPages) {
        return _scrollViewPages;
    }
    
    NSMutableArray *tmpArray = [NSMutableArray array];
    [self.imageNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        v.image = [UIImage imageNamed:obj];
        v.contentMode = UIViewContentModeScaleAspectFill;
        [tmpArray addObject:v];
    }];
    
    _scrollViewPages = tmpArray;
    
    return _scrollViewPages;
}

- (void)enter:(id)object {
    if (self.enterCallBackBlock) {
        self.enterCallBackBlock();
    }
}

- (CGRect)frameOfPageControl {
    if ([[UIDevice currentDevice]systemVersion].floatValue >=7) {
        return CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 30);
    }else {
        return CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 30);
    }
}

- (CGRect)frameOfEnterButton {
    CGSize size = self.enterButton.bounds.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = CGSizeMake(self.frame.size.width * 0.6, 40);
    }
    return CGRectMake(self.frame.size.width / 2 - size.width / 2, self.pageControl.frame.origin.y - size.height, size.width, size.height);
}

- (CGSize)contentSizeOfScrollView {
    UIView *view = [[self scrollViewPages] firstObject];
//    return CGSizeMake(view.frame.size.width * self.imageNames.count, view.frame.size.height);
    return CGSizeMake(view.frame.size.width * self.imageNames.count, 0); // 禁止垂直滚动
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / self.frame.size.width;
    self.pageControl.currentPage = index;
    [self pagingScrollViewDidChangePages:scrollView];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x > 0) {
        if ([self isLast:self.pageControl]) {
            [self enter:nil];
        }
    }
}

#pragma mark - UIPageControlDelegate
- (void)pagingScrollViewDidChangePages:(UIScrollView *)pagingScrollView {
    if ([self isLast:self.pageControl]) {
        if (self.pageControl.alpha == 1) {
            self.enterButton.alpha = 0;
        }
        
        [UIView animateWithDuration:0.4 animations:^{
            self.enterButton.alpha = 1;
            self.pageControl.alpha = 0;
        }];
    }else {
        if (self.pageControl.alpha == 0) {
            [UIView animateWithDuration:0.4 animations:^{
                self.enterButton.alpha = 0;
                self.pageControl.alpha = 1;
            }];
        }
    }
}

- (BOOL)hasNext:(UIPageControl*)pageControl {
    return pageControl.numberOfPages > pageControl.currentPage + 1;
}

- (BOOL)isLast:(UIPageControl*)pageControl {
    return pageControl.numberOfPages == pageControl.currentPage + 1;
}

@end
