//
//  ChannelLabel.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

+ (instancetype)channelLabelWithTitle:(NSString *)title{
    ChannelLabel *l = [[ChannelLabel alloc]init];
    l.text = title;
    [l sizeToFit];
    return l;
}

@end
