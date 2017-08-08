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
        //添加响应解析的数据格式--AFN为了避免出错,默认只支持三种数据类型的JSON反序列化
        //如果需要添加,请按以下格式进行添加,以下添加方式是'官方'推荐的方法
//        还有民间的方法,就是在pod里面找到Serialization文件,然后找到AFURLResponseSerialization.m方法里的type方法unlock直接改,但不推荐
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return instance;
}
@end
