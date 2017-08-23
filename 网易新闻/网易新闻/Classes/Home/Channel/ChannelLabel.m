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
    
    return l;
}

@end
