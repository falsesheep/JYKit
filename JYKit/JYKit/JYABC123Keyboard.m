//
//  JYABC123Keyboard.m
//  JYKit
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "JYABC123Keyboard.h"
#import "KeyboardButtonCell.h"
#import "UISearchBar+JYSearchBar.h"

#define CellID @"CellID"

@interface JYABC123Keyboard () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, KeyboardButtonCellDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *datas; // 二维数组结构
@property (nonatomic, strong) UIButton *upBtn;
@property (nonatomic, strong) UIButton *clearBtn;
@property (nonatomic, strong) UIView *sourceView;
@end

@implementation JYABC123Keyboard

- (instancetype)initWithSourceView:(UIView *)sourceView {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _sourceView = sourceView;
        // 设置frame
        CGFloat keyboardHeight = JYKB_KeyboardEdgeInset.top + JYKB_KeyboardEdgeInset.bottom + (JYKB_BTN_HEIGHT+JYKB_BTN_SHADOW)*4 + JYKB_VERTICAL_SPACING*3;
        self.frame = CGRectMake(0, 0, JYKB_SCREEN_WIDTH, keyboardHeight);
        
        // CollectionView
        CGRect frame = UIEdgeInsetsInsetRect(self.frame, JYKB_KeyboardEdgeInset);
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = UIColor.clearColor;
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:KeyboardButtonCell.class forCellWithReuseIdentifier:CellID];
        [self addSubview:_collectionView];
        
        // 特殊操作按钮
        [_collectionView addSubview:self.upBtn];
        [_collectionView addSubview:self.clearBtn];
    }
    return self;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
        NSArray *titleArrays = @[
  @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", @"0"],
  @[@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P"],
  @[@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L"],
  @[@"Z",@"X",@"C",@"V",@"B",@"N",@"M"]];
        for (NSArray *titles in titleArrays) {
            NSMutableArray *modelArray = [NSMutableArray array];
            for (NSString *title in titles) {
                KeyboardButtonModel *model = [KeyboardButtonModel new];
                model.key = title;
                model.isUP = NO;
                [modelArray addObject:model];
            }
            [_datas addObject:modelArray];
        }
    }
    return _datas;
}

- (CGFloat)buttonWidth {
    return (_collectionView.bounds.size.width - ([self maxColumnCount]-1)*JYKB_HORIZONTAL_SPACING) / [self maxColumnCount];
}

- (NSInteger)maxColumnCount {
    NSInteger maxColumnCount = [self.datas[0] count];
    for (NSArray *data in self.datas) {
        maxColumnCount = MAX(maxColumnCount, data.count);
    }
    return maxColumnCount;
}

- (UIButton *)upBtn {
    if (!_upBtn) {
        CGRect frame = CGRectMake(0, _collectionView.bounds.size.height-JYKB_BTN_HEIGHT-JYKB_BTN_SHADOW, JYKB_BTN_HEIGHT, JYKB_BTN_HEIGHT);
        _upBtn = [[UIButton alloc] initWithFrame:frame];
        [KeyboardButtonCell customizeButtonAppearance:_upBtn];
        [_upBtn setTitle:@"大写" forState:UIControlStateNormal];
        [_upBtn setTitle:@"小写" forState:UIControlStateSelected];
        [_upBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [_upBtn addTarget:self action:@selector(onClickUp:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _upBtn;
}

- (UIButton *)clearBtn {
    if (!_clearBtn) {
        CGRect frame = CGRectMake(_collectionView.bounds.size.width-JYKB_BTN_HEIGHT, _collectionView.bounds.size.height-JYKB_BTN_HEIGHT-JYKB_BTN_SHADOW, JYKB_BTN_HEIGHT, JYKB_BTN_HEIGHT);
        _clearBtn = [[UIButton alloc] initWithFrame:frame];
        [KeyboardButtonCell customizeButtonAppearance:_clearBtn];
        [_clearBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_clearBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(onClickClear:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}

/// 获取UITextField或UITextView中选中的Range
+ (NSRange)selectedRange:(id<UITextInput>)textControl {
    UITextPosition *beginning = textControl.beginningOfDocument;
    UITextRange *selectedRange = textControl.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    NSInteger location = [textControl offsetFromPosition:beginning toPosition:selectionStart];
    NSInteger length = [textControl offsetFromPosition:selectionStart toPosition:selectionEnd];
    return NSMakeRange(location, length);
}

#pragma mark - Events
/// 切换大小写
- (IBAction)onClickUp:(id)sender {
    self.upBtn.selected = !self.upBtn.selected;
    for (NSArray *modelArray in _datas) {
        for (KeyboardButtonModel *model in modelArray) {
            model.isUP = self.upBtn.selected;
        }
    }
    [_collectionView reloadData];
}

/// 删除
- (IBAction)onClickClear:(id)sender {
    if ([_sourceView isKindOfClass:UITextField.class]) {
        UITextField *tf = (UITextField *)_sourceView;
        [tf deleteBackward];
    }else if ([_sourceView isKindOfClass:UITextView.class]) {
        UITextView *tv = (UITextView *)_sourceView;
        [tv deleteBackward];
    }else if ([_sourceView isKindOfClass:UISearchBar.class]) {
        UITextField *tf = [(UISearchBar *)_sourceView searchBarTextField];
        [tf deleteBackward];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.datas.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.datas[section] count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KeyboardButtonCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.delegate = self;
    cell.model = self.datas[indexPath.section][indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    NSInteger columnCount = [self collectionView:collectionView numberOfItemsInSection:section];
    CGFloat horizonOffset = (collectionView.bounds.size.width - columnCount * [self buttonWidth] - (columnCount-1) * JYKB_HORIZONTAL_SPACING) / 2;
    if (section == self.datas.count - 1) {
        return UIEdgeInsetsMake(0, horizonOffset, 0, horizonOffset);
    }else {
        return UIEdgeInsetsMake(0, horizonOffset, JYKB_VERTICAL_SPACING, horizonOffset);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([self buttonWidth], JYKB_BTN_HEIGHT+JYKB_BTN_SHADOW);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JYKB_VERTICAL_SPACING;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return JYKB_HORIZONTAL_SPACING;
}

#pragma mark - KeyboardButtonCellDelegate
- (void)didClickedButtonCellWithValue:(NSString *)value {
    if ([_sourceView isKindOfClass:UITextField.class]) {
        UITextField *tf = (UITextField *)_sourceView;
        if (tf.delegate && [tf.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            NSRange range = [JYABC123Keyboard selectedRange:tf];
            if ([tf.delegate textField:tf shouldChangeCharactersInRange:range replacementString:value]) {
                [tf insertText:value];
            }
        }else {
           [tf insertText:value];
        }
    }else if ([_sourceView isKindOfClass:UITextView.class]) {
        UITextView *tv = (UITextView *)_sourceView;
        if (tv.delegate && [tv.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
            NSRange range = [JYABC123Keyboard selectedRange:tv];
            if ([tv.delegate textView:tv shouldChangeTextInRange:range replacementText:value]) {
                [tv insertText:value];
            }
        }else {
           [tv insertText:value];
        }
    }else if ([_sourceView isKindOfClass:UISearchBar.class]) {
        UISearchBar *searchBar = (UISearchBar *)_sourceView;
        UITextField *tf = searchBar.searchBarTextField;
        if (searchBar.delegate && [searchBar.delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)]) {
            NSRange range = [JYABC123Keyboard selectedRange:tf];
            if ([searchBar.delegate searchBar:searchBar shouldChangeTextInRange:range replacementText:value]) {
                [tf insertText:value];
            }
        }else {
           [tf insertText:value];
        }
    }
}

@end
