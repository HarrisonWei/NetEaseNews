//
//  NewsTableViewController.m
//  网易新闻
//
//  Created by 曹魏 on 2017/8/2.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"
@interface NewsTableViewController ()
@property (nonatomic,strong)NSArray *newsList;
@end

@implementation NewsTableViewController

- (void)setUrlString:(NSString *)urlString{
    _urlString = urlString;
    //测试加载新闻
    //为了避免循环引用
    __weak typeof(self) weakSelf = self;
    
    [News loadNewsListWithURLString:urlString finished:^(NSArray *newsList) {
        
        weakSelf.newsList = newsList;
        
    }];
}


//重写set方法
- (void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置预估行高
    self.tableView.estimatedRowHeight = 125;
//    //设置行高--自动计算行高
//    //注意点:
//    /*
//     1.必须设置有向下的约束
//     2.向下的约束不能为负值
//    */
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News *n = self.newsList[indexPath.row];
    
    NSString *cellID = [NewsCell cellIdentifier:n];
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.news = n;
    
    return cell;
}

#pragma mark -- 状态栏隐藏
- (BOOL)prefersStatusBarHidden{
    return YES;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
