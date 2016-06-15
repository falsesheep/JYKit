//
//  PopPresentingViewController.m
//  JYKitTest
//
//  Created by Ren Jing on 16/6/15.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "PopPresentingViewController.h"
#import "PopPresentedViewController.h"

@interface PopPresentingViewController () <UIPopoverPresentationControllerDelegate>
@property (nonatomic, weak) IBOutlet UIButton *btnPop;
@end

@implementation PopPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRGBA:@[@165, @214, @63]];
}

- (IBAction)onClickPop:(id)sender {
    PopPresentedViewController *vc = [PopPresentedViewController new];
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.preferredContentSize = CGSizeMake(200, 100);
    vc.popoverPresentationController.delegate = self;
    vc.popoverPresentationController.sourceView = _btnPop;
    vc.popoverPresentationController.sourceRect = CGRectMake(0, 0, _btnPop.bounds.size.width, 0);
    vc.popoverPresentationController.backgroundColor = [UIColor whiteColor]; // 箭头颜色
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

@end
