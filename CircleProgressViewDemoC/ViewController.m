//
//  ViewController.m
//  CircleProgressViewDemoC
//
//  Created by SiYugui on 2017/9/18.
//  Copyright © 2017年 SiYugui. All rights reserved.
//

#import "ViewController.h"

#import "XHJCircleProgressView.h"

@interface ViewController ()
@property (nonatomic,weak) XHJCircleProgressView *progressView;
@end

@implementation ViewController

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"更改了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XHJCircleProgressView *progress = [[XHJCircleProgressView alloc] initWithFrame:CGRectMake(60, 100,[UIScreen mainScreen].bounds.size.width-120 , [UIScreen mainScreen].bounds.size.width-120)];
    [self.view addSubview:progress];
    progress.layer.shadowColor = [UIColor blackColor].CGColor;
    progress.layer.shadowOpacity = 0.1;
    progress.layer.shadowOffset = CGSizeMake(0, 0);
    progress.layer.cornerRadius = 4.0;
    progress.layer.shadowRadius = 4.0;
    progress.progressValue = 0.0;
    self.progressView = progress;
    
    [self performSelector:@selector(action1) withObject:nil afterDelay:2];
    [self performSelector:@selector(action2) withObject:nil afterDelay:4];
}

-(void)action1{
    self.progressView.progressValue = 0.45f;
}

-(void)action2{
    self.progressView.progressValue = 1.0f;
    self.progressView.typeTitle = @"上传完成";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
