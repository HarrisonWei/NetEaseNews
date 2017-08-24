//
//  Channel.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/15.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "Channel.h"
#import "NSObject+Extension.h"
@implementation Channel

- (void)setTid:(NSString *)tid{
    _tid = tid.copy;
    _urlString = [NSString stringWithFormat:@"%@/0-40.html",_tid];
}




//加载所有频道的数组
+ (NSArray *)channelList{
    //1.加载json的二进制数据
     //1.1路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
     //1.2加载
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //2.反序列化:把data数据转换成字典
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //3.从字典中得到数组
    NSArray *array = dict[dict.keyEnumerator.nextObject];
    
    //4.遍历数组,字典转模型
    NSMutableArray *nmArray = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *obj in array) {
        
        [nmArray addObject:[self objectWithDict:obj]];
    }
    return nmArray.copy;
}
#pragma mark
#pragma mark - description方法不要抽取,放到各自类中,写不好会死循环
- (NSString *)description{
    
    NSArray *propertis = [self.class loadPropertis];
    
    NSDictionary *dict = [self dictionaryWithValuesForKeys:propertis];
    return [NSString stringWithFormat:@"<%@: %p> %@",self.class,self,dict];
}
@end




























