//
//  ItemDragViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/19.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "ItemDragViewController.h"
#import "ItemDragCell.h"

@interface ItemDragViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ItemDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_collectionView registerNib:[UINib nibWithNibName:@"ItemDragCell" bundle:nil] forCellWithReuseIdentifier:CellID_ItemDrag];
    // 添加拖拽手势
    UILongPressGestureRecognizer *longPress = [UILongPressGestureRecognizer.alloc initWithTarget:self action:@selector(onLongPressed:)];
    [self.collectionView addGestureRecognizer:longPress];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithObjects:@"娱乐", @"财政", @"体育", @"段子", @"要闻", @"本地", @"科技", @"汽车", @"房产", @"军事", @"时尚", nil];
    }
    return _dataSource;
}

#pragma mark - Events
- (void)onLongPressed:(UILongPressGestureRecognizer *)longPress {
    CGPoint point = [longPress locationInView:longPress.view];
    NSIndexPath *indexPath = [_collectionView indexPathForItemAtPoint:point];
    
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
            if (indexPath) {
                [_collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
            }
            break;
        case UIGestureRecognizerStateChanged:
            [_collectionView updateInteractiveMovementTargetPosition:point];
            break;
        case UIGestureRecognizerStateEnded:
            [_collectionView endInteractiveMovement];
            break;
        default:
            [_collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ItemDragCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID_ItemDrag forIndexPath:indexPath];
    cell.lbTitle.text = self.dataSource[indexPath.item];
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    // 调整数据源顺序
    [_dataSource exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (UIScreen.mainScreen.bounds.size.width - 10*5) / 4;
    return CGSizeMake(width, 30);
}

@end
