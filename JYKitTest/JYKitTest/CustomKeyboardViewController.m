//
//  CustomKeyboardViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2018/3/1.
//  Copyright © 2018年 FALSESHEEP. All rights reserved.
//

#import "CustomKeyboardViewController.h"

@interface CustomKeyboardViewController ()
@property (nonatomic, weak) IBOutlet UITextField *tf;
@end

@implementation CustomKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tf.inputView = [[JYABC123Keyboard alloc] initWithSourceView:_tf];
}

@end
