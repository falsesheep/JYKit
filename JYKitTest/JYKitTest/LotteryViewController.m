//
//  LotteryViewController.m
//  JYKitTest
//  注意:
//      1. 奖项之间需要留出4度的空白，避免指针指向中间，发生争议
//      2. 指针的初始位置为0度，奖项的区域是根据指针的初始位置而言的
//  原理:
//      1. 设置各奖项中奖几率
//      2. 取随机数，算出中的是哪个奖项
//      3. 取该奖项区域中的随机角度，做Rotate动画
//
//  Created by Ren Jing on 2018/1/17.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "LotteryViewController.h"

CGFloat CurveValue = (360*5); /// 多转的圈数

@interface LotteryViewController () <CAAnimationDelegate>
@property (nonatomic, weak) IBOutlet UIImageView *pointer;
@property (nonatomic, weak) IBOutlet UIButton *btnStart;
@property (nonatomic, strong) NSDictionary *awards; // 中奖区域
@property (nonatomic, strong) NSArray *miss; // 未中奖区域
@property (nonatomic, strong) NSArray *data; // 奖项名称
@property (nonatomic, strong) NSArray *rate; // 每个奖项的中奖几率（0~100分配）
@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) float startValue;
@property (nonatomic, assign) float endValue;
@end

@implementation LotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _data = @[@"一等奖",@"二等奖",@"三等奖",@"再接再厉"];
    _rate = @[
              @{@"min": @-1,
                @"max":@-1
                },
              @{@"min": @0,
                @"max":@9
                },
              @{@"min": @10,
                @"max":@39
                },
              @{@"min": @40,
                @"max":@99
                }
              ];

    _miss = @[
              @{@"min": @47,
                @"max":@89
                },
              @{@"min": @90,
                @"max":@133
                },
              @{@"min": @182,
                @"max":@223
                },
              @{@"min": @272,
                @"max":@314
                },
              @{@"min": @315,
                @"max":@358
                }
              ];

    _awards = @{
                @"一等奖": @[
                        @{
                            @"min": @137,
                            @"max":@178
                            }
                        ],
                @"二等奖": @[
                        @{
                            @"min": @227,
                            @"max":@268
                            }
                        ],
                @"三等奖": @[
                        @{
                            @"min": @2,
                            @"max":@43
                            }
                        ]
                };
}

- (IBAction)start:(id)sender {
    if (!_btnStart.enabled) {
        NSLog(@"已经在抽奖中不能再抽奖");
        return;
    }
    _btnStart.enabled = NO;

    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _endValue = [self fetchResult];
    rotationAnimation.delegate = self;
    rotationAnimation.fromValue = @(_startValue);
    rotationAnimation.toValue = @(_endValue);
    rotationAnimation.duration = 2;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.fillMode = kCAFillModeBoth;
    [_pointer.layer addAnimation:rotationAnimation forKey:@"whereToPoint"];
}

- (float)fetchResult {
    srand((unsigned)time(NULL));
    int random = rand() % 100;

    // 奖项
    for (int i=0; i<_rate.count; i++) {
        NSDictionary *range = _rate[i];
        int min = [range[@"min"] intValue];
        int max = [range[@"max"] intValue];
        if (random >= min && random <= max) {
            _result = _data[i];
            break;
        }
    }

    // 中奖区域
    for (NSString *str in _awards.allKeys) {
        if ([str isEqualToString:_result]) {
            NSDictionary *content = _awards[str][0];
            int min = [content[@"min"] intValue];
            int max = [content[@"max"] intValue];

            srand((unsigned)time(NULL));
            random = rand() % (max - min) + min;
            return radians(random + CurveValue); // 多转几圈
        }
    }

    // 未中奖区域
    random = rand() % _miss.count;
    NSDictionary *content = _miss[random];
    int min = [content[@"min"] intValue];
    int max = [content[@"max"] intValue];

    srand((unsigned)time(NULL));
    random = rand() % (max - min) + min;
    return radians(random + CurveValue); // 多转几圈
}

#pragma mark - Utils
//角度转弧度
double radians(float degrees) {
    return degrees*M_PI/180;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    _startValue = _endValue - radians(CurveValue); // 更新起始位置，并减去之前多转几的圈数
    _btnStart.enabled = YES;
    NSLog(@"%@", _result);
    [_result alert];
}

@end
