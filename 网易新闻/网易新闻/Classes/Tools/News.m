//
//  News.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
@implementation News
- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)newsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (NSString *)description{
    NSArray *propertis = @[@"title",@"digest",@"replyCount",@"imgsrc"];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    return [NSString stringWithFormat:@"<%@: %p> %@",self.class,self,dict];
}
+ (void)loadNewsListWithURLString:(NSString *)urlString{
    [[NetworkTools sharedNetworkTools]GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //根据key拿到第一个数组
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSLog(@"%@",array);
        //字典转模型
        //Capacity:容量  假设是10 这种创建数组的方式就会一次性分配10 存储空间
        //当添加第11个元素的时候,又会开辟10个存储空间
        //[NSMutableArray array]先申请空间,如果添加对象又会临时申请空间,效率慢
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self newsWithDict:obj]];
        }
        NSLog(@"%@",arrayM);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
