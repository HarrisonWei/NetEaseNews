//
//  NSObject+Extension.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
#import "News.h"
@implementation NSObject (Extension)
#pragma mark
#pragma mark -字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict{
    //封装的不好,局限性太大
//    News *news = [[News alloc]init];
//    [news setValuesForKeysWithDictionary:dict];
//    
//    return news;
    id obj = [[self alloc]init];
//    NSArray *propertis = [self loadPropertis];
//    for (NSString *key in propertis) {
//        //判断dict是否存在key
//        if (dict[key] != nil) {
//            [obj setValue:dict[key] forKey:key];
//        }
//    }
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
#pragma mark
#pragma mark -运行时方法
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

@end
