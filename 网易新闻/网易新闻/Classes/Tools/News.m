//
//  News.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/6.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
#import <objc/runtime.h>
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
//动态加载类的属性

const char *KPopertisKey = "propertisKey";
+ (NSArray *)loadPropertis{
    //利用关联对象给'类'添加属性,OC中的类本省就是一个特殊对象
    /*
     获取关联对象
     1.对象,属性关联到的对象
     2.key,属性的key
     */
    NSArray *plist = objc_getAssociatedObject(self, KPopertisKey);
    if (plist != nil) {
        return plist;
    }
    //1.第一个参数:类
    //2.第二个参数:属性计数指针
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    //定义一个可变数组
    NSMutableArray *nmArray = [NSMutableArray arrayWithCapacity:count];
    //遍历数组
    for (unsigned int i = 0; i<count; i++) {
        objc_property_t pty = list[i];
        //属性名称
        const char *cname = property_getName(pty);
        [nmArray addObject:[NSString stringWithUTF8String:cname]];
        
    }
    NSLog(@"属性数量 %u",count);
    //释放对象
    free(list);
    
    //设置关联对象属性,在运行时中关联对象使用率最高,主要就是set和get两个方法
    /*
     1.属性关联的对象
     2.key
     3.值
     4.引用关系
     */
    objc_setAssociatedObject(self, KPopertisKey, nmArray, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
    return objc_getAssociatedObject(self, KPopertisKey);
}
- (NSString *)description{
    
    NSArray *propertis = [self.class loadPropertis];
    
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    return [NSString stringWithFormat:@"<%@: %p> %@",self.class,self,dict];
}
//加载指定URL的新闻数组
+ (void)loadNewsListWithURLString:(NSString *)urlString finished:(void (^)(NSArray *))finished{
    //断言
    NSAssert(finished != nil, @"传入必须完成回调");
    
    
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
        //回调,AFN的回调是在主线程
        finished(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
































