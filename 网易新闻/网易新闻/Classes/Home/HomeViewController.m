//
//  HomeViewController.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
@interface HomeViewController ()

//数据数组
@property (nonatomic,strong)NSArray *channelList;
@property (weak, nonatomic) IBOutlet UIView *channelView;

@end

@implementation HomeViewController
#pragma mark
#pragma mark -懒加载
- (NSArray *)channelList{
    if (_channelList == nil) {
        _channelList = [Channel channelList];
    }
    return _channelList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChannel];
}
- (void)setUpChannel{
    //取消scrollview的自动缩进
//    self.automaticallyAdjustsScrollViewInsets = NO;
    //遍历频道数组,添加label
    for (Channel *channel in self.channelList) {
        UILabel *channelLabel = [[UILabel alloc]init];
        channelLabel.text = channel.tname;
        [channelLabel sizeToFit];
        [self.channelView addSubview:channelLabel];
        
        
    }
}

@end





































