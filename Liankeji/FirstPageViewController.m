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
#import <UIViewController+MMDrawerController.h>
#import "sateliteMenuCenterButton.h"
#import "firstPageButtonGroup.h"
#import "CenterSmallView.h"
#import "firstPageHeaderCell.h"
#import "lzhdownMenuView.h"
#import "newAnnouncementView.h"
#import "scinenceHeaderView.h"
#import "UINavigationBar+NavigationBarBackground.h"

//滚动视图高度
#define SCROLLVIEW_HEIGHT 200
//中间按钮组整体的高度 这个指定只是在创建时有用，显示时是按屏幕的宽度来计算高度，所以该指定只是预指定，并非实际高度
#define BUTTON_GROUP_HEIGHT 250
//首页滚动多高时导航栏发生渐变

#define NAVBAR_CHANGE_POINT 64


@interface FirstPageViewController ()<FFScrollViewDelegate,clickSubButtonDelegate,pullDownMenuDelegate,groupButtonDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSMutableArray *newsArr;


//表视图
@property (strong,nonatomic)UITableView *tableView;
//科技头条
@property (strong,nonatomic)scinenceHeaderView*scinenceView;
//表头
@property (strong,nonatomic)UIView *tableHeaderView;
//中间按钮组
@property (strong,nonatomic)firstPageButtonGroup *groupButton;
//滚动视图
@property (strong,nonatomic)UIView *scoView;
//公告VIEW
@property (strong,nonatomic)newAnnouncementView* anounceView;

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationControlerrTransparent];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.newsArr = [[NSMutableArray alloc]initWithCapacity:2];
    self.view.backgroundColor = [UIColor blackColor];
    [self setNavigationButton];
    
    [self addSateliteMenu];
    [self initTableView];
}
//设置导航栏透明
- (void)setNavigationControlerrTransparent{
    self.navigationItem.title = @"链科技";
    
    [self.navigationController.navigationBar hy_setBackgroundViewWithColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar hy_setBackgroundViewWithAlpha:0];
}
//处理上滑导航栏的渐变
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 64) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        if(alpha > 0.8){
            alpha = 0.8;
        }
        [self.navigationController.navigationBar hy_setBackgroundViewWithAlpha:alpha];
    } else {
        [self.navigationController.navigationBar hy_setBackgroundViewWithAlpha:0];
    }

}

//设置导航栏的左右按钮
- (void)setNavigationButton{
    //导航栏左按钮点击事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav1"] style:UIBarButtonItemStyleDone target:self action:@selector(leftNavBarHandler:)];
    
    UIImage *searchImage = [UIImage imageNamed:@"nav2"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:searchImage style:UIBarButtonItemStyleDone target:self action:@selector(rightSearchHandler:)];
}
//点击左侧navgationBAR
- (void)leftNavBarHandler:(UIBarButtonItem*)_u{
    //下拉菜单
    lzhdownMenuView *menuView = [[lzhdownMenuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) menuSize:CGSizeMake(SCREEN_WIDTH / 4, SCREEN_HEIGHT - 64 - 49) titleArray:@[@"菜单1",@"菜单2",@"菜单3",@"菜单4"] delegate:self];
   UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:menuView];
}
//侧拉菜单点击代理方法
-(void)downMenuSelect:(NSInteger)_index{
    NSLog(@"你点击了下拉菜单中的%li",_index);
}
//导航栏右侧搜索按钮
- (void)rightSearchHandler:(UIBarButtonItem*)_u{
    
}
//滚动视图
- (UIView*)addScrollView{
    NSArray *imageSources = @[@"1",@"2"];
    FFScrollView *scrollView = [[FFScrollView alloc]initPageViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCROLLVIEW_HEIGHT) views:imageSources];
    scrollView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView.pageViewDelegate = self;
    return scrollView;
}
//轮播点击
-(void)scrollViewDidClickedAtPage:(NSInteger)pageNumber{
    NSLog(@"点击了%li",pageNumber);
}
//创建最新公告
- (newAnnouncementView*)createAnounmentView{
    newAnnouncementView *anounmentView = [[newAnnouncementView alloc]initWithFrame:CGRectMake(0, self.scoView.bounds.size.height, SCREEN_WIDTH, 60)];
    return anounmentView;
}

//中间button按钮组
- (firstPageButtonGroup*)testButtonGroup{
    NSMutableArray *buttonImageArr = [[NSMutableArray alloc]init];
    NSMutableArray *lableTitleArr = [[NSMutableArray alloc]initWithObjects:@"企业",@"专家",@"技术人才",@"高校",@"第三方",@"更多",nil];
    for(NSInteger i = 0 ; i < 6; i ++){
        UIImage *image = [UIImage imageNamed:@"a1"];
        [buttonImageArr addObject:image];
    }
    firstPageButtonGroup *buttonGroup = [[firstPageButtonGroup alloc]initWithFrame:CGRectMake(0, self.scoView.bounds.size.height + self.anounceView.bounds.size.height, SCREEN_WIDTH,BUTTON_GROUP_HEIGHT) titleArray:lableTitleArr imageArr:buttonImageArr groupDelegate:self];
    return buttonGroup;
}
//中间按钮点击事件
-(void)groupButtonClickHandler:(NSInteger)buttonIndex{
    NSLog(@"buttonGroup:%li",buttonIndex);
}

//科技头条
- (scinenceHeaderView*)createScientHeaderView{
    scinenceHeaderView *scienceView = [[scinenceHeaderView alloc]initWithFrame:CGRectMake(0, self.scoView.bounds.size.height + self.anounceView.bounds.size.height + self.groupButton.bounds.size.height, SCREEN_WIDTH, 60)];
    
    return scienceView;
}


//添加卫星菜单
- (void)addSateliteMenu{
    NSArray *windowArr = [UIApplication sharedApplication].windows;
    UIWindow *window = windowArr[0];
    UIView *sateliteView =  [[sateliteMenuCenterButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 60, SCREEN_HEIGHT  - 64 - 49, 60, 60) _delegate:self];
    [window addSubview:sateliteView];
}
//卫星菜单点击事件
-(void)dealClickHandler:(NSInteger)buttonIndex{
    NSLog(@"点击了卫星菜单中的：%li",buttonIndex);
}

////添加表头
- (UIView*)crateTableHeaderView{
   self.scoView = [self addScrollView];
   self.anounceView = [self createAnounmentView];
   self.groupButton = [self testButtonGroup];
   self.scinenceView = [self createScientHeaderView];
    
   self.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, -(self.scoView.bounds.size.height + self.groupButton.bounds.size.height + self.anounceView.bounds.size.height + self.scinenceView.bounds.size.height), SCREEN_WIDTH, self.scoView.bounds.size.height + self.anounceView.bounds.size.height + self.groupButton.bounds.size.height + self.scinenceView.bounds.size.height)];
    
    [self.tableHeaderView addSubview:self.scoView];
    [self.tableHeaderView addSubview:self.anounceView];
    [self.tableHeaderView addSubview:self.groupButton];
    [self.tableHeaderView addSubview:self.scinenceView];
    NSLog(@"科技头条高度：%lf",self.scinenceView.bounds.size.height);
    return self.tableHeaderView;
}

//初始化tableView
- (void)initTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  0  , SCREEN_WIDTH, 1000) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    }

//没有数据，先写死了
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    firstPageHeaderCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if(nil == cell){
        cell = [[firstPageHeaderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1" targetView:_tableView];
    }
    cell.firstTitleLable.text = @"你好，我是链科技期待你的加入";
    cell.secondTitleLable.text = @"目的是中国做大的技术对接";
    [cell.ownImageView setImage:[UIImage imageNamed:@"1"]];
    return cell;
}

//设置表头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSLog(@"返回表头");
       return self.tableHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSLog(@"表头高度%lf",self.tableHeaderView.bounds.size.height);
    [self crateTableHeaderView];
    return self.tableHeaderView.bounds.size.height;
}
//cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"科技头条";
//}
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
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
