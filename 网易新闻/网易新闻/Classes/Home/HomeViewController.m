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

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"--------------------%@",[Channel channelList]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
