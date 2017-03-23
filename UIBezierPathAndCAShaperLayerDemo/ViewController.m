//
//  ViewController.m
//  UIBezierPathAndCAShaperLayerDemo
//
//  Created by KOLee on 2017/3/23.
//  Copyright © 2017年 menglong. All rights reserved.
//

#import "ViewController.h"

#define SCREENHEIGHT                [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH                 [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) CAShapeLayer *shapeLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self drawCircle];
}


#pragma mark - 画正方形

- (void)drawSquare{
    UIBezierPath *path      = [UIBezierPath bezierPathWithRect:CGRectMake(SCREENWIDTH/2.0-100, SCREENHEIGHT/2.0-100, 200.f, 200.f)];
    _shapeLayer             = [CAShapeLayer layer];
    _shapeLayer.path        = path.CGPath;
    _shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_shapeLayer];

}

#pragma mark - 画圆角

- (void)drawOval{
    UIBezierPath *path      = [UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointMake(SCREENWIDTH/2.0-100, SCREENHEIGHT/2.0-100),CGSizeMake(200, 200)} cornerRadius:50];
    _shapeLayer             = [CAShapeLayer layer];
    _shapeLayer.path        = path.CGPath;
    _shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_shapeLayer];
    
}

#pragma make - 画圆

- (void)drawCircle{
    
    CGFloat radius     = 60.f;
    CGFloat startAngle = 0.f;
    CGFloat endAngle   = (CGFloat)(M_PI*2);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center
                                                        radius:radius
                                                    startAngle:startAngle
                                                      endAngle:endAngle
                                                     clockwise:YES];
    _shapeLayer             = [CAShapeLayer layer];
    _shapeLayer.path        = path.CGPath;
    _shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;

    [self animation1];
   
    
    
}

- (void)animation1{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue         = 0;
    animation.toValue           = [NSNumber numberWithInt:1];
    animation.duration          = 2.f;
    [_shapeLayer addAnimation:animation forKey:@""];
    [self.view.layer addSublayer:_shapeLayer];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
