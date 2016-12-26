//
//  announceViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/23.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announceViewController.h"
#import "appCommonAttributes.h"
#import "AnounceButtonView.h"



@interface announceViewController (){
    UIWindow *rootWindow;
    UIView *baseView;
    UIImageView *animationImageView;
    UIView *buttonAnimationView;
}

@end

@implementation announceViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBaseBackgroundView];
    [self addAnimationImageView];
    [self addGroupButton];
    NSLog(@"发布首页");
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    
    NSLog(@"将要出现");
}

- (void)addBaseBackgroundView{
   rootWindow = [UIApplication sharedApplication].windows[0];
    baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rootWindow.bounds.size.width, rootWindow.bounds.size.height)];
    baseView.backgroundColor =[UIColor whiteColor];
    [rootWindow addSubview:baseView];
}
- (void)addAnimationImageView{
    
    CGFloat orginX = 0.1 * SCREEN_WIDTH;
    
    CGFloat orignY = 0.12 * SCREEN_HEIGHT;
    
    animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(orginX, orignY, SCREEN_WIDTH - orginX * 2, 200)];
    //animationImageView.backgroundColor = [UIColor grayColor];
    [animationImageView setImage:[UIImage imageNamed:@"anounce_logo@3x"]];
    
    
    [baseView addSubview:animationImageView];
    
}

- (void)addGroupButton{
    AnounceButtonView *views = [[AnounceButtonView alloc]initWithFrame:CGRectMake(50, animationImageView.frame.origin.y + animationImageView.bounds.size.height, 100, 120)];
    [baseView addSubview:views];
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
