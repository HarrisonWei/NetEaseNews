//
//  HomeViewController.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HomeViewController.h"

#import "Channel.h"

#import "ChannelLabel.h"
@interface HomeViewController ()

//数据数组
@property (nonatomic,strong)NSArray *channelList;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;



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
    CGFloat margin = 8.0;
    CGFloat x = margin;
    CGFloat h = self.channelView.bounds.size.height;
    
    NSLog(@"================%.f",h);
    
    
    //取消scrollview的自动缩进
    self.automaticallyAdjustsScrollViewInsets = NO;
    //遍历频道数组,添加label
    for (Channel *channel in self.channelList) {
        //已经计算好了width
        ChannelLabel *l = [ChannelLabel channelLabelWithTitle:channel.tname];
        
        //设置label的frame
        l.frame = CGRectMake(x, 0, l.bounds.size.width, h);
//        //递增x
        x += l.bounds.size.width;
//
        [self.channelView addSubview:l];

    }
    
    //设置contentSize
    self.channelView.contentSize = CGSizeMake(x + margin, h);
}

@end





































