//
//  NewsCell.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/11.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end
@implementation NewsCell

- (void)setNews:(News *)news{
    _news = news;
    self.titleLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d跟帖",news.replyCount];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
