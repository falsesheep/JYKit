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
                  @"渐变"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CELL_ID = @"example";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        cell.textLabel.text = _examples[indexPath.row];
    }
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
        default:
            NSLog(@"未定义跳转");
            break;
    }
}

@end
