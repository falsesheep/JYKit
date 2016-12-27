//
//  UITableView+DataLoad.m
//  JYKit
//
//  Created by Ren Jing on 2016/11/29.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "UITableView+DataLoad.h"

@implementation UITableView (DataLoad)

- (void)tableViewDisplayWithMsg:(NSString *)message ifNecessaryForDataCount:(NSUInteger)count {
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
