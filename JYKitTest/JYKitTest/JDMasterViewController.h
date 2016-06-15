//
//  JDMasterViewController.h
//  JYKitTest
//
//  Created by Ren Jing on 16/6/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterViewDelegate <NSObject>

/**
 *  菜单中的某一项被选中
 *
 *  @param indexPath 选中的位置
 */
- (void)masterViewDidSelectIndexPath:(NSIndexPath *)indexPath;

@end

@interface JDMasterViewController : UIViewController
@property (nonatomic, weak) id <MasterViewDelegate> delegate;
@property (nonatomic, strong) NSArray *items; // 菜单内容
@end
