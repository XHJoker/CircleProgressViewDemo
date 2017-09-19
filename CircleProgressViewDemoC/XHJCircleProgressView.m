//
//  XHJCircleProgressView.m
//  CircleProgressViewDemoC
//
//  Created by SiYugui on 2017/9/18.
//  Copyright © 2017年 SiYugui. All rights reserved.
//

#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define kFont(size) [UIFont systemFontOfSize:size]
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

#import "XHJCircleProgressView.h"

@interface XHJCircleProgressView ()

//前面圆环
@property (nonatomic, strong) CAShapeLayer *foreCircleLayer;
//view 标题
@property (nonatomic, strong) UILabel * titleLab;
//valueLabel
@property (nonatomic, strong) UILabel * valueLab;

@end

@implementation XHJCircleProgressView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI{
    
    //1.添加背景
    [self.layer addSublayer:[self createShapeLayerWithSize:self.frame.size.width/2.0 lineWith:self.frame.size.width/2.0 color:[UIColor whiteColor]]];
    //2.添加背景圆环
    CAShapeLayer *backgroundlayer = [self createShapeLayerWithSize:(self.frame.size.width/2.0)-15 lineWith:10 color:RGBAColor(213, 214, 217, 1)];
    [self.layer addSublayer:backgroundlayer];
    
    //3.添加前面圆环
    CAShapeLayer *forelayer = [self createShapeLayerWithSize:(self.frame.size.width/2.0)-20 lineWith:20 color:[UIColor redColor]];
    
    forelayer.path = [UIBezierPath bezierPathWithArcCenter:
                      CGPointMake(self.frame.size.width/2.0-20 , self.frame.size.width/2.0-20 )
                                                    radius:(self.frame.size.width/2.0 - 20)
                                                startAngle:-M_PI/2
                                                  endAngle:M_PI*1.5
                                                 clockwise:YES].CGPath;
    forelayer.strokeStart = 0;
    forelayer.strokeEnd = 0;
    
    forelayer.strokeColor = RGBAColor(81, 146, 254, 1).CGColor;
    [self.layer addSublayer:forelayer];
    self.foreCircleLayer = forelayer;
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.5, self.frame.size.height*0.15)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"同步通讯录";
    lab.font = kFont(15);
    [lab setTextColor:[UIColor blackColor]];
    lab.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.width/2.0);
    [self addSubview:lab];
    self.titleLab = lab;
    
    UIImageView *cloudImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height*0.15, self.frame.size.width*0.15)];
    [cloudImgView setImage:[UIImage imageNamed:@"backUpcloud"]];
    [self addSubview:cloudImgView];
    cloudImgView.center = CGPointMake(self.frame.size.width/2.0, self.frame.size.width*0.32);
    
    UILabel *progressLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*0.4, self.frame.size.width*0.25)];
    progressLab.text = @"0%";
    progressLab.font = kBoldFont(25);
    progressLab.textAlignment = NSTextAlignmentCenter;
    [progressLab setTextColor:RGBAColor(81, 146, 254, 1)];
    [self addSubview:progressLab];
    progressLab.center = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.65);
    self.valueLab = progressLab;
}

-(CAShapeLayer *)createShapeLayerWithSize:(CGFloat)radius lineWith:(CGFloat)lineWidth color:(UIColor *)color{
    CGRect foreCircle_frame = CGRectMake(self.bounds.size.width/2-radius,
                                         self.bounds.size.height/2-radius,
                                         radius*2,
                                         radius*2);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = foreCircle_frame;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                        radius:radius-lineWidth/2
                                                    startAngle:0
                                                      endAngle:M_PI*2
                                                     clockwise:YES];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = lineWidth;
    
    return layer;
}

-(void)setProgressValue:(CGFloat)progressValue{
    if (self.foreCircleLayer) {
        self.foreCircleLayer.strokeEnd = progressValue;
        
        int x = (int)(progressValue*100);
        NSString *showStr = [NSString stringWithFormat:@"%d％",x];
        _valueLab.text = showStr;
    }
}

-(void)setTypeTitle:(NSString *)typeTitle{
    if (typeTitle) {
        _titleLab.text = typeTitle;
    }
}

@end
