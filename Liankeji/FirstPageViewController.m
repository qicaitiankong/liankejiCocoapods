//
//  FirstPageViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "FirstPageViewController.h"
#import "ShareNetWorkState.h"
#import "ShareUrlString.h"
#import "ShareHomePath.h"
#import "ShareDataBase.h"
#import "NewsTestModel.h"
#import "GetCellHeight.h"
#import "FFScrollView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface FirstPageViewController ()<FFScrollViewDelegate>
@property (strong,nonatomic)NSMutableArray *newsArr;
@property (strong,nonatomic)UIScrollView *scoView;
@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.newsArr = [[NSMutableArray alloc]initWithCapacity:2];
    self.view.backgroundColor = [UIColor redColor];
    NSArray *imageSources = @[@"1.jpg",@"2.jpg",@"3.jpg"];
    FFScrollView *scrollView = [[FFScrollView alloc]initPageViewWithFrame:CGRectMake(0, 64, WIDTH, 200) views:imageSources];
    scrollView.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:scrollView];
    
    scrollView.pageViewDelegate = self;
    //[self testScrollView];
    //NSLog(@"%@",[[ShareHomePath GetShareHome] getDocumentsPath]);
   // NSInteger numState = [[ShareNetWorkState ShareNetState]getNetState:nil unknownStateHandler:nil WifeHandler:@selector(wifeHandler) wanHandler:nil target:self];
   
    
      // Do any additional setup after loading the view.
}
-(void)scrollViewDidClickedAtPage:(NSInteger)pageNumber{
    NSLog(@"点击了%li",pageNumber);
}
//测试滚动视图
- (void)testScrollView{
    self.scoView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 150)];
    self.scoView.contentSize = CGSizeMake(WIDTH * 3, 0);
    //self.scoView.contentOffset = CGPointMake(WIDTH, 0);
    self.scoView.showsHorizontalScrollIndicator = NO;
    self.scoView.bounces = YES;
    self.scoView.pagingEnabled = NO;
    //self.scoView.delegate = self;
    [self.view addSubview:self.scoView];
    for(NSInteger i = 0 ; i < 3; i ++){
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *WIDTH, 0, WIDTH, 150)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSString *imageName = [[NSString alloc]initWithFormat:@"%li.jpg",i +1];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageView setImage:image];
        [self.scoView addSubview:imageView];
    }
}
- (void)getLableHeight{
    NSString *contentStr = @"点击本页面左上方“立即出价”链接，进入域名出价页面，登陆易名中国网站后再打开域名页面点“立即出价”，出价成功后域名立刻进入买方账号并自动过户完成交易(只有一次出价机会,先出价者先得)；如果左上方未显示价格和出价链接可进入“千百度一号店”搜索到域名后再出价。注：需要先注册成为易名中国(www.ename.cn)会员[注册帮助]并充值相应金额；企业购买如要发票须提前联系并另加6%税点[充值流程]。如果您对域名交易流程";
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, self.view.bounds.size.height)];
    [self.view addSubview:lable];
    lable.backgroundColor = [UIColor grayColor];
    lable.numberOfLines = 0;
    lable.textAlignment = NSTextAlignmentLeft;
    lable.font = [UIFont systemFontOfSize:17];
    
    
    CGFloat lableHeight = [[GetCellHeight ShareCellHeight]cellHeight:lable content:contentStr Cellwidth:300];
    lable.frame = CGRectMake(0, 64, 300, lableHeight);
    
    NSLog(@"检测高度：%lf",lable.frame.size.height);
    lable.text = contentStr;
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"将要拖动");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   // NSLog(@"发生滚动");
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"将要结束拖动");
    static short index = 0;
    if(index > 2){
        index = 0;
    }
    CGPoint point = CGPointMake(WIDTH * index, 0);
    targetContentOffset = &point;
    index ++;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"已经结束拖动");
}
-(void)wifeHandler{
    ShareUrlString *shareUrl = [ShareUrlString ShareUrlString];
    [[ShareNetWorkState ShareNetState] getDataWithUrl:shareUrl.testUrlStr parameters:nil sucess:^(id reponseObject) {
       // NSLog(@"%@",reponseObject);
    } failuer:^(NSError *err) {
        NSLog(@"%@",err);
    }];
//    [[ShareNetWorkState ShareNetState]postDataWithUrl:shareUrl.postUrlStr parameters:@{@"content":@"国内"} sucess:^(id reponseObject) {
//        NSLog(@"%@",reponseObject);
//    } failuer:^(NSError *err) {
//        NSLog(@"ERROR:%@",err);
//    }];
    NSLog(@"wife quzuo");
}
- (void)noNet{
    NSLog(@"no net quzuo");
}
//数据库操作
- (void)operateDataBase{
    ShareDataBase *dataBaseClass = [ShareDataBase shareDataBase];
    [dataBaseClass getDataBase:@"db.sqlite"];
    BOOL dataBaseSuc = [dataBaseClass openDataBase ];
    BOOL tableCreateSuc = NO;
    BOOL dataInsertTableSuc = NO;
    if(dataBaseSuc){
        //建立News1表
        //NSString *createTabelSql = @"create table if not exists News(flag integer not null primary key autoincrement, title text not null,click integer not null,image blob not null)";
        //建立News2表
        NSString *createTabelSql = @"create table if not exists News2(flag integer not null primary key autoincrement, title2 text not null,click2 integer not null,image2 blob not null)";
        tableCreateSuc = [dataBaseClass createTable:createTabelSql];
    }
    if(tableCreateSuc){
        NSLog(@"成功");
        // 插入测试
        //        UIImage *image = [UIImage imageNamed:@"tab1"];
        //        NSData *imageData =   UIImagePNGRepresentation(image);
        //        NSArray *insertDataArray = @[@"新闻7",@3,imageData];
        //        //NSString *insertStr = @"insert into News1(title,click,image) values(?,?,?)";
        //        NSString *insertStr = @"insert into News2(title2,click2,image2) values(?,?,?)";
        //        NSError *err = nil;
        //        dataInsertTableSuc = [dataBaseClass insertDataIntoTable:insertStr insertDataArray:insertDataArray error:err];
        //        if(dataInsertTableSuc){
        //            NSLog(@"插入成功");
        //        }
        //更新测试
        //        NSString *updateStr = @"update News1 set title =?,click=? where flag >= 1";
        //        NSArray *updateArr = @[@"新闻5",@3];
        //        NSError *updateErr = nil;
        //        BOOL updateSuc = [dataBaseClass updateDataBase:updateStr updateContentArray:updateArr error:updateErr];
        //        if(updateSuc){
        //            NSLog(@"success");
        //        }else{
        //            NSLog(@"updateError:%@",updateErr);
        //        }
        //查询测试
        //    NSString *searchSql = @"select * from News1 where flag >= ?";
        //    NSArray *arr = [[NSArray alloc]initWithObjects:@1, nil];
        //    NSError *searchError = nil;
        //    FMResultSet *result = [dataBaseClass searchTable:searchSql searchValues:arr error:searchError];
        //    NewsTestModel *newsModel = [[NewsTestModel alloc]init];
        //    while ([result next]) {
        //        newsModel.title = [result objectForColumnName:@"title"];
        //        newsModel.click = [[result objectForColumnName:@"click"] integerValue];
        //        newsModel.imageData = [result objectForColumnName:@"image"];
        //        [self.newsArr addObject:newsModel];
        //删除测试
        //        NSError *deleteError = nil;
        //        NSString *deleteStr = @"delete from News2 where flag = ?";
        //        NSArray *deleteArr = @[@3];
        //        BOOL deleteSuc = [dataBaseClass deleteRecordFromTable:deleteStr valuesArray:deleteArr deleteError:deleteError];
        //        if(deleteSuc){
        //            NSLog(@"delete success");
        //        }else{
        //            NSLog(@"deleteEror:%@",deleteError);
        //        }
    }

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
