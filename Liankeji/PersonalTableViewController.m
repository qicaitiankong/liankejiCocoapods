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

#import <UIImageView+WebCache.h>
#import "GetCellHeight.h"

@interface PersonalTableViewController ()
@property (strong,nonatomic)NSMutableArray *newsArr,*urlArr;
@end

@implementation PersonalTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    GetCellHeight *h1 =  [GetCellHeight ShareCellHeight];
    GetCellHeight *h2 =  [GetCellHeight ShareCellHeight];
    NSLog(@"h1=%p,h2=%p",h1,h2);
    self.view.backgroundColor = [UIColor whiteColor];
   
    NSString *url1 = @"http://img.mp.itc.cn/upload/20161204/a5c2b6b31f0d49ff8833d58169266002_th.jpg";
    NSString *url2 = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=671277887,1474810111&fm=80&w=179&h=119&img.JPEG";
    self.urlArr = [[NSMutableArray alloc]initWithObjects:url1,url2, nil];
    self.newsArr = [[NSMutableArray alloc]init];
    [self SDWebImageTest];
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//SDWebImage异步下载图片
- (void)SDWebImageTest{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    for(NSInteger i = 0 ;i < self.urlArr.count; i ++){
        NSURL *url = [NSURL URLWithString:self.urlArr[i]];
    
         [manager downloadImageWithURL:url options:SDWebImageDelayPlaceholder progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if(nil == error && image){
                [self.newsArr addObject:image];
                NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:1];
                PersonalTableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
                cell.newsImageView.image = image;
            }
            if(self.newsArr.count == 2){
                [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
            }
        }];
    }
}

//内存警告
- (void)dealWithMemoryWarning{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    //取消正在下载的工作
    [manager cancelAll];
    //清除内存缓存
    [manager.imageCache clearMemory];
    //清除硬盘缓存
    [manager.imageCache cleanDisk];
    
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
    [self dealWithMemoryWarning];
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
        //NewsTestModel *model = self.newsArr[indexPath.row];
        //NSLog(@"%@",model.imageData);
        cell.newsImageView.image = _newsArr[indexPath.row];
        //[cell.newsImageView setImage:[UIImage imageWithData:model.imageData]];
        
       // [cell.newsTitleLable setText:model.title];
    }else{
        cell.newsImageView.image = [UIImage imageNamed:@"1.jpg"]; 
    }
    //[cell.newsImageView setImageWithURL:[NSURL URLWithString:self.newsArr[indexPath.row]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
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
