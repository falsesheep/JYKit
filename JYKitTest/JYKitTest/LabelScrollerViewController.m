//
//  LabelScrollerViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 2017/7/5.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "LabelScrollerViewController.h"

@interface LabelScrollerViewController () <JYLabelScrollerDelegate>

@end

@implementation LabelScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14],
                                 NSForegroundColorAttributeName: [UIColor colorWithRGBA:@[@50,@50,@50]]};
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"醉美红酒，河北经销商活动圆满举行" attributes:attributes];
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"测试活动1234567890ABCDEFG测试活动" attributes:attributes];
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"一个很长很长的活动，活动人员很多，活动内容很长，测试长消息显示效果" attributes:attributes];
    // container view
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(15, 20, 260, 34)];
    containerView.layer.borderWidth = 0.5;
    [self.view addSubview:containerView];
    // JYLabelScroller
    JYLabelScroller *labelScroller = [[JYLabelScroller alloc] initWithFrame:CGRectMake(5, 0, 250, 34) labels:@[str1,str2,str3] minDuration:3 dismissDelay:0.5];
    labelScroller.delegate = self;
    [containerView addSubview:labelScroller];
}

#pragma mark - JYLabelScrollerDelegate
- (void)JYLabelScroller:(JYLabelScroller *)labelScroller didClickedIndex:(NSInteger)index {
    [[NSString stringWithFormat:@"您点击的是第%ld个Label", index] alert];
}

@end
