//
//  ChannelLabel.h
//  网易新闻
//
//  Created by 曹魏 on 2017/8/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChannelLabel;
@protocol ChannelLabelDelegate <NSObject>
//代理方法
- (void)channelLabelDidSelected:(ChannelLabel *)label;

@end

@interface ChannelLabel : UILabel
+ (instancetype)channelLabelWithTitle:(NSString *)title;
/*
 从0-1
 0: 14号字
 1: 18号字
 
 */

@property (nonatomic,assign)float scale;

@property (nonatomic,weak) id <ChannelLabelDelegate>delegate;

@end
