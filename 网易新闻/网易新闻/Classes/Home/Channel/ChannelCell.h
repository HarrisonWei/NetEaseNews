//
//  ChannelCell.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/24.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsTableViewController;
@interface ChannelCell : UICollectionViewCell
@property (nonatomic,strong)NSString *urlString;
@property (nonatomic,strong)NewsTableViewController *newsVC;
@end
