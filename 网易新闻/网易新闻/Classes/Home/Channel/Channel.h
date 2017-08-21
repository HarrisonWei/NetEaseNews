//
//  Channel.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/15.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject
@property (nonatomic,copy)NSString *tname;
@property (nonatomic,copy)NSString *tid;

//加载所有频道的数组
+ (NSArray *)channelList;
@end
