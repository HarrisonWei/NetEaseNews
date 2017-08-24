//
//  ChannelCell.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/24.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"

@interface ChannelCell ()

@property (nonatomic,strong)NewsTableViewController *newsVC;

@end

@implementation ChannelCell
//加载xib/sb时,一加载就会执行
- (void)awakeFromNib{
    [super awakeFromNib];
    //不能设置大小,但可以设置界面元素
    //1.加载sb
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    self.newsVC = sb.instantiateInitialViewController;
    
    [self addSubview:self.newsVC.view];
    
}
//设置大小
- (void)layoutSubviews{
    [super layoutSubviews];
    self.newsVC.view.frame = self.bounds;
}

@end
























