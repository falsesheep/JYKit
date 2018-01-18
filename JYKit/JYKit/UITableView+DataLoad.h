//
//  UITableView+DataLoad.h
//  JYKit
//
//  Created by Ren Jing on 2016/11/29.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (DataLoad)

/**
tableView无数据时，显示的文字提示

@param message 无数据时显示的文字
@param count 数据个数
*/
- (void)tableViewDisplayWithMsg:(NSString *)message ifNecessaryForDataCount:(NSUInteger)count;

@end
