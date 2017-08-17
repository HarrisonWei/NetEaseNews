//
//  NSObject+Extension.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
#pragma mark
#pragma mark -字典转模型
+ (instancetype)objectWithDict:(NSDictionary *)dict;
#pragma mark
#pragma mark -动态加载类的属性
+ (NSArray *)loadPropertis;
@end
