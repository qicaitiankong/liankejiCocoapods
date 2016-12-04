//
//  PersonalTableViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonalTableViewController.h"
#import "PersonalTableViewCell.h"
#import "ShareNetWorkState.h"
#import "ShareUrlString.h"
#import "NewsTestModel.h"

@interface PersonalTableViewController ()
@property (strong,nonatomic)NSMutableArray *newsArr;
@end

@implementation PersonalTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"个人中心");
    self.view.backgroundColor = [UIColor whiteColor];
    self.newsArr = [[NSMutableArray alloc]init];
    //self.clearsSelectionOnViewWillAppear = NO;
    [[ShareNetWorkState ShareNetState]getDataWithUrl:[ShareUrlString ShareUrlString].testUrlStr parameters:nil sucess:^(id reponseObject) {
        [self jsonData:reponseObject];
    } failuer:^(NSError *err) {
         NSLog(@"下载错误：%@",err);
    }];
    
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)jsonData:(id)_object{
    NSArray *arr = _object;
    for(NSDictionary *dict in arr){
        NewsTestModel *news = [[NewsTestModel alloc]init];
        news.title = [[dict objectForKey:@"title"] copy];
        news.imageData = [UIImagePNGRepresentation([UIImage imageNamed:@"tab2"]) copy];
        news.content = [[dict objectForKey:@"content"] copy];
        [self.newsArr addObject:news];
    }
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"image1" ];
    if(nil == cell){
        //cell = [[PersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"image1"];
        cell = [[PersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"image1" _tableviewWidth:self.tableView];
    }
    if(nil != _newsArr){
        NewsTestModel *model = self.newsArr[indexPath.row];
        NSLog(@"%@",model.imageData);
        [cell.newsImageView setImage:[UIImage imageWithData:model.imageData]];
        [cell.newsTitleLable setText:model.title];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
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
