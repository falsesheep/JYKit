//
//  ItemDragCell.h
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/19.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *CellID_ItemDrag = @"ItemDrag";

@interface ItemDragCell : UICollectionViewCell
@property (nonatomic, weak) IBOutlet UILabel *lbTitle;
@end
