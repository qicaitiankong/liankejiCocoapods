//
//  informationViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/23.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "informationViewController.h"
#import "appCommonAttributes.h"
#import "ZHQScrollMenu.h"
#import "inforMationTableView.h"
#import "informationTableViewCell.h"


@interface informationViewController ()<UITableViewDataSource,UITableViewDelegate>{
    //左右滑动按钮组
    ZHQScrollMenu* scrollViewMenu;
    //当前选择的按钮
    UIButton *scrollViewSelectButton;
    //前一个点击按钮的索引
    NSInteger perfomerButtonIndex;
    //下一个表视图
    inforMationTableView *ownNextTableView;
    //当前表视图
    inforMationTableView *ownCurrentTableView;
}

@end

@implementation informationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createScrollButtonGroup];
    [self createTableView:0];
        
    
    // Do any additional setup after loading the view.
}

- (void)createScrollButtonGroup{
    //NSLog(@"导航栏高度：%lf", self.navigationController.navigationBar.frame.size.height);
    scrollViewMenu = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, self.view.frame.size.width, 60)];
    scrollViewMenu.backgroundColor = [UIColor blueColor];
    [self.view addSubview:scrollViewMenu];
    
    NSArray *buttonTitles = [NSArray arrayWithObjects:@"新闻",@"热门",@"科技",@"技术",@"前沿",@"最新", nil];
    for(NSInteger index = 0; index < buttonTitles.count; index ++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:buttonTitles[index] forState:UIControlStateNormal];
        button.tag = index;
        [button addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        if(button.tag == 0){
            scrollViewSelectButton = button;
        }
        [scrollViewMenu addButton:button];
    }
}
//按钮组点击事件
- (void)buttonHandler:(UIButton*)_b{
    if(scrollViewSelectButton != _b){
        //获取按钮的父亲
        ZHQScrollMenu *menu = (ZHQScrollMenu*)[_b superview];
        //跟新选择变化
        [menu selected:_b];
        scrollViewSelectButton = _b;
        //移除上一个当前表视图
        [self removeCurrentTableView];
        //滑进下一个表视图
        [self createTableView:_b.tag];
        //跟新上一个选择的按钮的索引
        perfomerButtonIndex = _b.tag;
        //重新加载新闻
    }
    NSLog(@"点击按钮%li",_b.tag);
}
//移除当前表视图
-(void)removeCurrentTableView{
    if(nil != ownCurrentTableView){
        ownCurrentTableView.hidden = YES;
        [ownCurrentTableView removeFromSuperview];
        ownCurrentTableView = nil;
    }
}

//创建tableView
- (void)createTableView:(NSInteger)_tag{
    if(nil != scrollViewMenu){
        if( _tag <= perfomerButtonIndex){
           ownNextTableView = [[inforMationTableView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT + scrollViewMenu.bounds.size.height, SCREEN_WIDTH, 500) style:UITableViewStylePlain];
            ownNextTableView.alpha = 0.1;
            [self.view addSubview:ownNextTableView];
            [UIView animateWithDuration:0.2 animations:^{
                ownNextTableView.transform = CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
                ownNextTableView.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
            
        }else{
            ownNextTableView = [[inforMationTableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT + scrollViewMenu.bounds.size.height, SCREEN_WIDTH, 500) style:UITableViewStylePlain];
            ownNextTableView.alpha = 0.1;
            
            [self.view addSubview:ownNextTableView];
            [UIView animateWithDuration:0.2 animations:^{
                ownNextTableView.transform = CGAffineTransformMakeTranslation(-SCREEN_WIDTH, 0);
                ownNextTableView.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];

        }
        
        
        ownNextTableView.delegate = self;
        ownNextTableView.dataSource = self;
        [ownNextTableView reloadData];
        //跟新当前表视图图
        ownCurrentTableView = ownNextTableView;
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    informationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"informationCell01"];
    if(nil == cell){
        //NSLog(@"cell height = %lf",cell.frame.size.height);
        cell = [[informationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"informationCell01" tableView:tableView];
        
    }
    
    [cell.ownImageView setImage:[UIImage imageNamed:@"1"]];
    cell.firstLable.text = @"2016年科技发展";
    cell.secondLable.text = @"科技发展技术对接";
    cell.thirdLable.text = @"快速定位全国技术专家需求";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"设置高度");
    return 100;
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
