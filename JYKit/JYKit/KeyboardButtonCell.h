//
//  KeyboardButtonCell.h
//  JYKit
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYKeyboardConfig.h"

@interface KeyboardButtonModel : NSObject
@property (nonatomic, strong) NSString *key; // 1~9, A~Z
@property (nonatomic, assign) BOOL isUP; // 是否大写
@end


@class KeyboardButtonCell;
@protocol KeyboardButtonCellDelegate

/**
 点击键盘上某个按钮的回调

 @param value 该按钮对应的值
 */
- (void)didClickedButtonCellWithValue:(NSString *)value;
@end


@interface KeyboardButtonCell : UICollectionViewCell
@property (nonatomic, strong) KeyboardButtonModel *model;
@property (nonatomic, weak) id<KeyboardButtonCellDelegate> delegate;

/**
 自定义按钮显示样式，包括阴影、圆角等

 @param button 需要设置的button
 */
+ (void)customizeButtonAppearance:(UIButton *)button;
@end
