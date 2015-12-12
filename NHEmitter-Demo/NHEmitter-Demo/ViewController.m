//
//  ViewController.m
//  NHEmitter-Demo
//
//  Created by Wilson-Yuan on 15/12/10.
//  Copyright © 2015年 Wilson-Yuan. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
//@property
@end


static CGFloat kNHImageViewAniationDuration = 10;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)show:(id)sender {
    UIButton *button = sender;
    NSArray *images = @[@"colorheart_4",
                        @"colorheart_1",
                        @"colorheart_2",
                        @"colorheart_3",
                        @"colorheart_5",
                        @"colorheart_6",
                        @"colorheart_7",
                        @"colorheart_8",
                        @"colorheart_9",
                        @"colorheart_10",
                        @"colorheart_11",
                        @"colorheart_12",
                        @"colorheart_13",
                        @"colorheart_14",
                        @"colorheart_15",
                        @"colorheart_16",
                        @"colorheart_17",
                        @"colorheart_18",
                        @"colorheart_19",
                        @"colorheart_20",
                        @"colorheart_21",
                        @"colorheart_22",
                        @"colorheart_23",
                        @"colorheart_24",
                        @"colorheart_25",
                        @"colorheart_26",
                        @"colorheart_27",
                        ];
    
    
    {
        NSInteger index = arc4random() % images.count;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:images[index]]];
        imageView.center = button.center;
        [self.view addSubview:imageView];
        
        CGPoint startPoint = button.center;
        CGMutablePathRef curvedPath = CGPathCreateMutable();
        
        NSInteger offset = arc4random() % 50;
        if ((offset % 2) == 1) {
            offset = - offset; //左右摇摆
        }
        
        
        CGPathMoveToPoint(curvedPath, NULL, startPoint.x, startPoint.y);
        
        CGPathAddQuadCurveToPoint(curvedPath, NULL, startPoint.x - offset, startPoint.y/ 4 * 3, startPoint.x, startPoint.y / 2);
        CGPathAddQuadCurveToPoint(curvedPath, NULL, startPoint.x + offset, startPoint.y/4, startPoint.x, - 20);
        
        CGFloat scaleAnimationDuration = 0.3;
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
        scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1)];
        scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        scaleAnimation.duration = scaleAnimationDuration;
        [imageView.layer addAnimation:scaleAnimation forKey:nil];
        
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        animation.keyPath = @"position";
        animation.path = curvedPath;
        animation.duration = kNHImageViewAniationDuration;
        animation.removedOnCompletion = YES;
        animation.delegate = self;
        [imageView.layer addAnimation:animation forKey:nil];
        
        
        NSInteger delayTime = arc4random() % 3 + 5;
        [self performSelector:@selector(performAlphaAnimationForView:) withObject:imageView afterDelay:delayTime];
        CFRelease(curvedPath);
        
    }
    
}
- (void)performAlphaAnimationForView:(UIView *)view {
    [UIView animateWithDuration:2 animations:^{
        view.alpha = 0;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
