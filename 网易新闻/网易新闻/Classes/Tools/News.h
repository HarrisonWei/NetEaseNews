//
//  News.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
//新闻标题
@property (nonatomic,copy)NSString *title;
//新闻摘要
@property (nonatomic,copy)NSString *digest;
//跟帖数量
@property (nonatomic,assign)int replyCount;
//配图地址
@property (nonatomic,copy)NSString *imgsrc;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)newsWithDict:(NSDictionary *)dict;

//加载指定URL的新闻数组
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void(^)(NSArray *newsList))finished; 
@end
