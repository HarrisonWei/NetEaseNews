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
#import "ChannelCell.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

//数据数组
@property (nonatomic,strong)NSArray *channelList;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;


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
    //取消滚动条
    self.channelView.showsHorizontalScrollIndicator = NO;
}

// 子视图布局完成调用
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.collectionView.frame));
    [self setupLayout];
}
#pragma mark -- 设置layout
- (void)setupLayout{
    //1.设置layout的大小
    self.layout.itemSize = self.collectionView.bounds.size;
    //2.指定最小的行间距和item间距都为0
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    //3.设置滚动方向
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //4.取消滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //5.允许分页
    self.collectionView.pagingEnabled = YES;
    
}

#pragma mark
#pragma mark -实现代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChannelCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0];
    
    return cell;
}
@end





































