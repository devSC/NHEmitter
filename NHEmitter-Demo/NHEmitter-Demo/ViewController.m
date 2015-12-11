//
//  ViewController.m
//  NHEmitter-Demo
//
//  Created by Wilson-Yuan on 15/12/10.
//  Copyright © 2015年 Wilson-Yuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property
@end

@implementation ViewController {
    CAEmitterCell *emitterCell;
    CAEmitterLayer *layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)show:(id)sender {
    UIButton *button = sender;
    if (!layer) {
        layer = [self emitterLayerWithPosition:button.center];
        [self.view.layer addSublayer:layer];
    }
    
    layer.birthRate = 0.5;
    emitterCell.birthRate = 0.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //        [self.effectDesignerView.emitter setBirthRate:0];
        emitterCell.birthRate = 0.01;
        layer.birthRate = 0.01;
    });
    
}

/*
 - (void)showPraiseHeartGif{
 
 float orignalX = SCREEN_SIZE.width - POPHEART_RIGHT - POPHEART_W_H;
 float orignalY = _praiseBtn.frame.origin.y;
 
 UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(orignalX, orignalY - POPHEART_W_H * 6, POPHEART_W_H, POPHEART_W_H)];
 iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Video_Praise_%d",_praiseIndex]];
 [self.view insertSubview:iconImgView belowSubview:_praiseBtn];
 
 
 CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
 
 CGMutablePathRef aPath = CGPathCreateMutable();//初始化路径
 CGPathMoveToPoint(aPath, nil, orignalX + POPHEART_W_H/2 , orignalY + POPHEART_W_H/4);//动画起始点
 
 
 if (_praiseIndex % 3 == 0) {
 
 CGPathAddCurveToPoint(aPath, nil,
 orignalX - POPHEART_W_H, orignalY - POPHEART_W_H*2,
 orignalX + POPHEART_W_H*2, orignalY - POPHEART_W_H*4,
 orignalX + POPHEART_W_H/2, orignalY - POPHEART_W_H*5
 );//控制点
 }else if (_praiseIndex % 2  == 0){
 
 CGPathAddCurveToPoint(aPath, nil,
 orignalX - POPHEART_W_H*2, orignalY - POPHEART_W_H*2,
 orignalX , orignalY - POPHEART_W_H*4,
 orignalX - POPHEART_W_H/2 , orignalY - POPHEART_W_H*5
 );//控制点
 
 }else{
 
 CGPathAddCurveToPoint(aPath, nil,
 orignalX + POPHEART_W_H, orignalY - POPHEART_W_H*2,
 orignalX + POPHEART_W_H/2, orignalY - POPHEART_W_H*4,
 orignalX - POPHEART_W_H , orignalY - POPHEART_W_H*6
 );//控制点
 }
 
 
 _praiseIndex ++ ;
 if (_praiseIndex > 9) {
 _praiseIndex = 0;
 }
 
 
 animation.path = aPath;
 animation.duration = 1.5f;
 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//设置为渐出
 
 [iconImgView.layer addAnimation:animation forKey:@"position"];
 
 [self performSelector:@selector(changeGifImageViewAlpha:) withObject:iconImgView afterDelay:1.0f];
 
 }
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self.fireView setEmitterPositionFromTouch:[touches anyObject]];
    //[self.fireView setIsEmitting:YES];
    //[self.fireView burnDownLine];
    layer.emitterPosition = [[touches anyObject] locationInView:self.view];
    layer.birthRate = 1;
    emitterCell.birthRate = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //        [self.effectDesignerView.emitter setBirthRate:0];
        emitterCell.birthRate = 0.01;
        layer.birthRate = 0.01;
    });
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.fireView setIsEmitting:NO];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    // [self.fireView setIsEmitting:NO];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self.fireView setEmitterPositionFromTouch:[touches anyObject]];
}



- (CAEmitterLayer *)emitterLayerWithPosition:(CGPoint)position {
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    //例子发射位置
    emitter.emitterPosition = position;
    //发射源的尺寸大小
    emitter.emitterSize = CGSizeMake(20, 20);
    //发射模式
    emitter.emitterMode = kCAEmitterLayerVolume;
    //发射源的形状
    emitter.emitterShape = kCAEmitterLayerPoint;
    emitter.shadowOpacity = 1.0;
    emitter.shadowRadius = 0.0;
    emitter.shadowOffset = CGSizeMake(0.0, 1.0);
    emitter.birthRate = 0.0001;
    //粒子边缘的颜色
    //    emitter.shadowColor = [[UIColor yellowColor] CGColor];
    
//    CAEmitterCell *cell1 = [self emitterCellWithImage:[UIImage imageNamed:@"colorheart_2"]];
//    CAEmitterCell *cell2 = [self emitterCellWithImage:[UIImage imageNamed:@"colorheart_8"]];
//    CAEmitterCell *cell3 = [self emitterCellWithImage:[UIImage imageNamed:@"colorheart_12"]];
    emitterCell = [self emitterCellWithImage:[UIImage imageNamed:@"colorheart_2"]];
//    emitter.emitterCells = @[cell1,cell2, cell3];
    emitter.emitterCells = @[emitterCell];
    
    return emitter;
    //    [self.layer insertSublayer:snowEmitter atIndex:0];
    
}


- (CAEmitterCell *)emitterCellWithImage:(UIImage *)image {
    //创建雪花类型的粒子
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    //粒子的名字
    cell.name = @"snow";
    //粒子参数的速度乘数因子
//    cell.birthRate = 0.0000000001;
    cell.lifetime = 120.0;
    //粒子速度
    cell.velocity = 40;
    //粒子的速度范围
    cell.velocityRange = 40;
    //粒子y方向的加速度分量
//    cell.yAcceleration = 2;
    //周围发射角度
    //    snowflake.emissionRange = 0.5 * M_PI;
    //子旋转角度范围
    cell.spinRange = 0.25 * M_PI;
    cell.contents = (id)[image CGImage];
    //设置雪花形状的粒子的颜色
    //    snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
