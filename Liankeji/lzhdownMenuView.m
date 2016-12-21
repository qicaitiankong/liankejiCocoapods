//
//  downMenuView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhdownMenuView.h"
#import "sideMenuButton.h"
//弧形效果的宽度
#define SIDEIMAGEVIEW_WIDTH 150
//盛放按钮组的baseView的宽度
#define BASEVIEWWIDTH SIDEIMAGEVIEW_WIDTH * 0.7

@implementation lzhdownMenuView
@synthesize backgroundbutton;
//盛放按钮组的button
@synthesize baseView;
//弧形效果
UIImageView *sideImageView;

-(instancetype)initWithFrame:(CGRect)frame menuSize:(CGSize)_menuSize titleArray:(NSArray*)_titleArr delegate:(id <pullDownMenuDelegate>) _delegate{
    self = [super initWithFrame:frame];
    if(self){
        if( nil == backgroundbutton){
            //指定代理
            self.downMenuDelegate = _delegate;
            //创建背景遮罩按钮
           backgroundbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            backgroundbutton.frame = self.frame;
            backgroundbutton.backgroundColor = [UIColor clearColor];
            [backgroundbutton addTarget:self action:@selector(backbuttonHandler:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:backgroundbutton];
            
            //添加弧形效果
            sideImageView= [[UIImageView alloc]initWithFrame:CGRectMake(-SIDEIMAGEVIEW_WIDTH, 64, SIDEIMAGEVIEW_WIDTH, backgroundbutton.bounds.size.height - 64 - 49)];
            sideImageView.backgroundColor = [UIColor clearColor];
            sideImageView.alpha = 0.8;
            [sideImageView setImage:[UIImage imageNamed:@"sidemenu_362"]];
            //sideImageView.alpha = 0.3;
            [backgroundbutton addSubview:sideImageView];
            
            
            
            //创建盛放按钮组的button
            baseView = [UIButton buttonWithType:UIButtonTypeCustom];
            baseView.frame = CGRectMake(-BASEVIEWWIDTH , 64, BASEVIEWWIDTH, backgroundbutton.bounds.size.height - 64 - 49);
            baseView.backgroundColor = [UIColor clearColor];
            
            
            //baseView.alpha = 0;
            //baseView.backgroundColor = [UIColor greenColor];
            //[baseView setImage:[UIImage imageNamed:@"sidemenu_362"] forState:UIControlStateNormal];
            [baseView addTarget:self action:@selector(backbuttonHandler:) forControlEvents:UIControlEventTouchUpInside];
            [backgroundbutton addSubview:baseView];
            
            
            
            //往baseView上添加用户头像按钮
            UIButton *userButton = [UIButton buttonWithType:UIButtonTypeCustom];
            userButton.tag = 0;
            userButton.frame = CGRectMake(2, baseView.bounds.size.height * 0.2, baseView.bounds.size.width / 2, baseView.bounds.size.width / 2);
            userButton.layer.cornerRadius = userButton.bounds.size.width / 2;
            userButton.backgroundColor = [UIColor whiteColor];
            [userButton setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];

            [userButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
            [baseView addSubview:userButton];
        
            //下拉菜单高度
            _menuHeight = _menuSize.height;
            
           

            
            
            //添加按钮
            
            CGFloat imageButtonWidth = baseView.bounds.size.width * 0.25;
            CGFloat imageButtonHeight = 50;
            CGFloat titleButtonWidth = baseView.bounds.size.width * 0.75;
            CGFloat titleButtonHeight = imageButtonHeight;
            
            for(NSInteger i = 0; i <_titleArr.count; i ++ ){
                sideMenuButton *sideButton = [[sideMenuButton alloc]initWithFrame:CGRectMake(0, 200 + i *60, baseView.bounds.size.width, 60)];
                sideButton.tag = i + 1;
                [baseView addSubview:sideButton];
                [sideButton.ownImageView setImage:[UIImage imageNamed:@"test"]];
                sideButton.ownTitleLable.text = _titleArr[i];
                [sideButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
        
        //弹出动画
        [self popDownAnimation];
    }
    return self;
}
//代理事件
- (void)menuButtonHandler:(UIButton*)_b{
    if(self.downMenuDelegate){
        [self.downMenuDelegate downMenuSelect:_b.tag];
        //[self removeFromSuperview];
    }
}
//遮罩按钮点击
- (void)backbuttonHandler:(UIButton*)_b{
    [self popBackAnimation];
}
//下拉动画
- (void)popDownAnimation{
    [UIView animateWithDuration:0.5 animations:^{
        sideImageView.transform = CGAffineTransformMakeTranslation(sideImageView.bounds.size.width, 0);
        baseView.transform = CGAffineTransformMakeTranslation(baseView.bounds.size.width, 0);
        baseView.alpha = 0.8;
    } completion:^(BOOL finished) {
        
    }];
}

//弹回动画
- (void)popBackAnimation{
    [UIView animateWithDuration:0.3 animations:^{
        sideImageView.transform = CGAffineTransformIdentity;
        baseView.alpha = 0;
        baseView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        NSLog(@"移除");
        //动画完成从父视图window移除
        [self removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
