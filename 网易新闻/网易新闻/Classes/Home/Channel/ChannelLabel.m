//
//  ChannelLabel.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel
#define CWNormalFontSize 14.0
#define CWSelectedFontSize 18.0

+ (instancetype)channelLabelWithTitle:(NSString *)title{
    ChannelLabel *l = [[ChannelLabel alloc]init];
    
    l.text = title;
    //1.设置文本对齐方式
    l.textAlignment = NSTextAlignmentCenter;
    //2.设置大字体,预留出左右间距
    l.font = [UIFont systemFontOfSize:CWSelectedFontSize];
    //3.根据大字体设置大小
    [l sizeToFit];
    //4.设置小字体
    l.font = [UIFont systemFontOfSize:CWNormalFontSize];
    //设置用户交互
    l.userInteractionEnabled = YES;
    
    return l;
}
#pragma mark
#pragma mark -点击label
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    //实现代理方法
    if ([self.delegate respondsToSelector:@selector(channelLabelDidSelected:)]) {
        [self.delegate channelLabelDidSelected:self];
    }
    
    
}




- (void)setScale:(float)scale{
    
    _scale = scale;
    float percent = (CWSelectedFontSize - CWNormalFontSize)/CWNormalFontSize;
    //scale = 0  percent = 1;
    //scale = 1  percent = 18/14 = (18 -14)/14 + 1 = 4/14 + 1;
    percent = percent * scale + 1;
    
    //通过transform设置大小
    self.transform = CGAffineTransformMakeScale(percent, percent);
    //设置颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];
}
@end







