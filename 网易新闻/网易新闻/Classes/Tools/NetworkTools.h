//
//  NetworkTools.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/3.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTools : AFHTTPSessionManager
//全局访问入口
+ (instancetype)sharedNetworkTools;
@end
