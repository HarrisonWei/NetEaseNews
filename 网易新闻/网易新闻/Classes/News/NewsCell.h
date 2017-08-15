//
//  NewsCell.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/11.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell
@property (nonatomic,strong)News *news;
//可重用标识符
+ (NSString *)cellIdentifier:(News *)news;
@end
