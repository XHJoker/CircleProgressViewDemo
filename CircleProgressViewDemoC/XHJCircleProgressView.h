//
//  XHJCircleProgressView.h
//  CircleProgressViewDemoC
//
//  Created by SiYugui on 2017/9/18.
//  Copyright © 2017年 SiYugui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHJCircleProgressView : UIView

/*
 * circle 进度 flaot Value
 * 取值范围: 0 ~ 1
 */

@property (nonatomic ,assign) CGFloat progressValue;

/*
 * 类型 当前进程简介
 */
@property (nonatomic ,copy) NSString *typeTitle;

@end
