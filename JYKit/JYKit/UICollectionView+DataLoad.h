//
//  UICollectionView+DataLoad.h
//  JYKit
//
//  Created by Ren Jing on 2018/1/17.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (DataLoad)

/**
 collectionView无数据时，显示的文字提示

 @param message 无数据时显示的文字
 @param count 数据个数
 */
- (void)collectionViewDisplayWithMsg:(NSString *)message ifNecessaryForDataCount:(NSUInteger)count;

@end
