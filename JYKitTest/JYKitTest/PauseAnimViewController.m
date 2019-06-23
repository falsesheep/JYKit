//
//  PauseAnimViewController.m
//  JYKitTest
//
//  Created by Jia Yang on 2019/6/23.
//  Copyright © 2019 FALSESHEEP. All rights reserved.
//

#import "PauseAnimViewController.h"

@interface PauseAnimViewController ()
@property (nonatomic, weak) IBOutlet UIView *line;
@end

@implementation PauseAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.toValue = @(M_PI*2);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = 2;
    anim.repeatCount = CGFLOAT_MAX;
    [self.line.layer addAnimation:anim forKey:@"rotation"];
}

- (IBAction)togglePause:(id)sender {
    if (self.line.layer.speed == 1) {
        [self.line pauseAnim];
    }else {
        [self.line continueAnim];
    }
}

@end
