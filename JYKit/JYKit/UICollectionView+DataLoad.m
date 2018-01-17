//
//  UICollectionView+DataLoad.m
//  JYKit
//
//  Created by Ren Jing on 2018/1/17.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "UICollectionView+DataLoad.h"

@implementation UICollectionView (DataLoad)

- (void)collectionViewDisplayWithMsg:(NSString *)message ifNecessaryForDataCount:(NSUInteger)count {
    if (count == 0) {
        UILabel *lbMsg = [UILabel new];
        lbMsg.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        lbMsg.text = message;
        lbMsg.textColor = [UIColor lightGrayColor];
        lbMsg.textAlignment = NSTextAlignmentCenter;
        [lbMsg sizeToFit];
        self.backgroundView = lbMsg;
    }else {
        self.backgroundView = nil;
    }
}

@end
