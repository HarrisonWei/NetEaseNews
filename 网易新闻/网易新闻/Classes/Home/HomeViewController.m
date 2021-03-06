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
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ChannelLabelDelegate>

//数据数组
@property (nonatomic,strong)NSArray *channelList;
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
//定义一个当前选中的索引
@property (nonatomic,assign)NSInteger currentIndex;

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
    
    NSInteger index = 0;
    
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
        //设置代理对象
        l.delegate = self;
        //设置tag值--给所有的label设置一个tag值,即一个小标签
        l.tag = index++;
    }
    
    //设置contentSize
    self.channelView.contentSize = CGSizeMake(x + margin, h);
    //取消滚动条
    self.channelView.showsHorizontalScrollIndicator = NO;
    
    //当前选中第0项
    self.currentIndex = 0;
    //初始化的时候设置第0个label的scale
    ChannelLabel *firstLabel = self.channelView.subviews[0];
    firstLabel.scale = 1;
}
#pragma mark
#pragma mark -代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%s",__func__);
    //1.当前选中的标签
    ChannelLabel *currentLabel = self.channelView.subviews[self.currentIndex];
//    NSLog(@"%@",currentLabel.text);
    //2.下一个标签
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
//    NSLog(@"%@",indexPaths);
    //3.遍历数组确定第二个标签
    ChannelLabel *nextLabel = nil;
    for (NSIndexPath *path in indexPaths) {
        if (path.item != self.currentIndex) {
            nextLabel = self.channelView.subviews[path.item];
            break;
        }
    }
    NSLog(@"从%@到%@",currentLabel.text,nextLabel.text);
    //判断下一个标签是否为空
    if (nextLabel == nil) {
        return;
    }
    //4.比例
    float nextScale = ABS((float)self.collectionView.contentOffset.x/self.collectionView.bounds.size.width - self.currentIndex);
    float currentScale = 1 - nextScale;
    //设置比例
    currentLabel.scale = currentScale;
    nextLabel.scale = nextScale;
    
    NSLog(@"%f  %f",currentScale,nextScale);
    //强制更新索引
    self.currentIndex = self.collectionView.contentOffset.x/self.collectionView.bounds.size.width;
  
}

//停止滚动的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //更新索引
    self.currentIndex = scrollView.contentOffset.x/scrollView.bounds.size.width;
}


#pragma mark
#pragma mark -实现label的代理方法
- (void)channelLabelDidSelected:(ChannelLabel *)label{
    NSLog(@"%@",label);
    self.currentIndex = label.tag;
    //滚动到指定位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    
}






// 子视图布局完成调用
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    NSLog(@"%s %@",__FUNCTION__,NSStringFromCGRect(self.collectionView.frame));
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
    
    cell.urlString = [self.channelList[indexPath.item] urlString];
    //判断是否添加了子控制器
//    if (![self.childViewControllers containsObject:cell.newsVC]) {
//        [self addChildViewController:cell.newsVC];
//    }
    if (![self.childViewControllers containsObject:(UIViewController *)cell.newsVC]) {
        [self addChildViewController:(UIViewController *)cell.newsVC];
    }
    return cell;
}
@end





































