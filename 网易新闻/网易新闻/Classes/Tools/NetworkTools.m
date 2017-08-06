//
//  NetworkTools.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools
+ (instancetype)sharedNetworkTools{
    static NetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"];
        instance = [[self alloc]initWithBaseURL:url];
    });
    return instance;
}
@end
