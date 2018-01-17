//
//  ViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 15/10/19.
//  Copyright © 2015年 FALSESHEEP. All rights reserved.
//

#import "ViewController.h"
#import "NavBackItemViewController.h"
#import "ButtonBlockViewController.h"
#import "DashLineViewController.h"
#import "CropViewController.h"
#import "ColorViewController.h"
#import "ImageColorViewController.h"
#import "ImageSizeViewController.h"
#import "FlexContentViewController.h"
#import "ButtonImagePositionViewController.h"
#import "HideNavLineViewController.h"
#import "GradientViewController.h"
#import "PopPresentingViewController.h"
#import "JDMenuViewController.h"
#import "ControlLoadingViewController.h"
#import "ShapeViewViewController.h"
#import "CircleSliderViewController.h"
#import "AdjustingTextViewController.h"
#import "QRCodeViewController.h"
#import "DeepCopyViewController.h"
#import "UpgradeViewController.h"
#import "CrashViewController.h"
#import "LabelScrollerViewController.h"
#import "LotteryViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *examples;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"例子";
    _examples = @[@"Nav返回按钮",
                  @"Button事件Block处理",
                  @"虚线",
                  @"截图",
                  @"颜色",
                  @"改变图片填充色",
                  @"改变图片大小",
                  @"容纳文字所需要的大小",
                  @"Button图片位置",
                  @"隐藏Navigation Bar下方分割线",
                  @"渐变",
                  @"PopOver On Iphone",
                  @"模仿京东菜单分类",
                  @"页面加载动画",
                  @"View只显示出来一部分",
                  @"环形Slider",
                  @"高度可变的输入框",
                  @"生成二维码",
                  @"深拷贝",
                  @"更新检测",
                  @"Crash记录",
                  @"滚动Label",
                  @"抽奖"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CELL_ID = @"example";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    cell.textLabel.text = _examples[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            NavBackItemViewController *vc = [NavBackItemViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 1:{
            ButtonBlockViewController *vc = [ButtonBlockViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 2:{
            DashLineViewController *vc = [DashLineViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 3:{
            CropViewController *vc = [CropViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 4:{
            ColorViewController *vc = [ColorViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 5:{
            ImageColorViewController *vc = [ImageColorViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 6:{
            ImageSizeViewController *vc = [ImageSizeViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 7:{
            FlexContentViewController *vc = [FlexContentViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 8:{
            ButtonImagePositionViewController *vc = [ButtonImagePositionViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 9:{
            HideNavLineViewController *vc = [HideNavLineViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 10:{
            GradientViewController *vc = [GradientViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 11:{
            PopPresentingViewController *vc = [PopPresentingViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 12:{
            JDMenuViewController *vc = [JDMenuViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 13:{
            ControlLoadingViewController *vc = [ControlLoadingViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 14:{
            ShapeViewViewController *vc = [ShapeViewViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 15:{
            CircleSliderViewController *vc = [CircleSliderViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 16:{
            AdjustingTextViewController *vc = [AdjustingTextViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 17:{
            QRCodeViewController *vc = [QRCodeViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 18:{
            DeepCopyViewController *vc = [DeepCopyViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 19:{
            UpgradeViewController *vc = [UpgradeViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 20:{
            CrashViewController *vc = [CrashViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 21:{
            LabelScrollerViewController *vc = [LabelScrollerViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        case 22:{
            LotteryViewController *vc = [LotteryViewController new];
            vc.title = _examples[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
            break;}
        default:
            NSLog(@"未定义跳转");
            break;
    }
}

@end
