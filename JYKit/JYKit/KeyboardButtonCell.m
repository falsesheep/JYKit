//
//  KeyboardButtonCell.m
//  JYKit
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "KeyboardButtonCell.h"
#import "UIImage+JYEffects.h"

@interface KeyboardButtonCell ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation KeyboardButtonModel

@end

@implementation KeyboardButtonCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

/// 配置UI
- (void)setup {
    CGRect buttonFrame = CGRectMake(0, 0, self.bounds.size.width, JYKB_BTN_HEIGHT);
    _btn = [[UIButton alloc] initWithFrame:buttonFrame];
    [KeyboardButtonCell customizeButtonAppearance:_btn];
    [_btn addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_btn];
}

+ (void)customizeButtonAppearance:(UIButton *)button {
    button.layer.cornerRadius = 3;
    button.layer.shadowRadius = 0;
    button.layer.shadowColor = UIColor.blackColor.CGColor;
    button.layer.shadowOpacity = 0.8;
    button.layer.shadowOffset = CGSizeMake(0, JYKB_BTN_SHADOW);
    
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:UIColor.grayColor size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:20];
}

- (void)setModel:(KeyboardButtonModel *)model {
    _model = model;
    int asciiCode = model.key.UTF8String[0];
    // 41~90为A~Z的ASCII码
    if (asciiCode > 40 && asciiCode < 91 && !model.isUP) { // 大小写转换
        [_btn setTitle:model.key.lowercaseString forState:UIControlStateNormal];
    }else {
        [_btn setTitle:model.key forState:UIControlStateNormal];
    }
}

#pragma mark - Events
- (IBAction)onClickButton:(id)sender {
    if (self.delegate && [(NSObject *)self.delegate respondsToSelector:@selector(didClickedButtonCellWithValue:)]) {
        [self.delegate didClickedButtonCellWithValue:_btn.titleLabel.text];
    }
}

@end
