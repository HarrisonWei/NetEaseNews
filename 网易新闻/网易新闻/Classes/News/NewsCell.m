//
//  NewsCell.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/11.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
//AFN针对UIImageView的分类
#import <UIImageView+AFNetworking.h>
@interface NewsCell()
//配图
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//主题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//来源
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
//跟帖
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
//后两张图片数组(三张图片的时候)
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraImageViews;

@end
@implementation NewsCell

- (void)setNews:(News *)news{
    _news = news;
    self.titleLabel.text = news.title;
    self.sourceLabel.text = news.source;
    self.replyLabel.text = [NSString stringWithFormat:@"%d跟帖",news.replyCount];
    //图像 - AFN的图像不支持GIF,绝大多数还是应该用SDWebImage
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    //判断是否有多图,给两个imageView设置图像
    if (news.imgextra.count == 2) {
        int index = 0;
        for (UIImageView *iv in self.extraImageViews) {
            //数组中存放的字典,取出来的地址字符串
            NSString *urlString = news.imgextra[index][@"imgsrc"];
            NSURL *url = [NSURL URLWithString:urlString];
            //设置图像
            [iv setImageWithURL:url];
            index++;
        }
    }
    
    
    
}
//可重用标识符
+ (NSString *)cellIdentifier:(News *)news{
    if (news.imgextra.count == 2) {
        return @"ImagesCell";
    }else if (news.isBigImage){
        return @"BigImageCell";
    }else{
        return @"NewsCell";
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 设置换行宽度
//    self.titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.titleLabel.frame.origin.x - 16;
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end









