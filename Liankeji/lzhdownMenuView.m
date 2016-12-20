//
//  downMenuView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhdownMenuView.h"
#import "sideMenuButton.h"

@implementation lzhdownMenuView
@synthesize backgroundbutton;
@synthesize baseView;

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
            
            
            
            //创建盛放按钮组的button
            baseView = [UIButton buttonWithType:UIButtonTypeCustom];
            baseView.frame = CGRectMake(-_menuSize.width,  64, _menuSize.width, _menuSize.height);
            baseView.backgroundColor = [UIColor redColor];
            
            //baseView.alpha = 0;
            //baseView.backgroundColor = [UIColor greenColor];
            [baseView setImage:[UIImage imageNamed:@"sidemenu_362"] forState:UIControlStateNormal];
            [baseView addTarget:self action:@selector(backbuttonHandler:) forControlEvents:UIControlEventTouchUpInside];
            [backgroundbutton addSubview:baseView];
            
            
            
            //往baseView上添加用户头像按钮
            UIButton *userButton = [UIButton buttonWithType:UIButtonTypeCustom];
            userButton.tag = 0;
            userButton.frame = CGRectMake(2, baseView.bounds.size.height * 0.2, baseView.bounds.size.width / 2, baseView.bounds.size.width / 2);
            userButton.layer.cornerRadius = userButton.bounds.size.width / 2;
            userButton.backgroundColor = [UIColor yellowColor];
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
                [baseView addSubview:sideButton];
                [sideButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
//                UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//               // CGFloat imageButtonBegin_y = userButton.frame.origin.y + userButton.bounds.size.height + 10 + i * imageButtonHeight;
//                
//                
//                CGFloat imageButtonBegin_y = 200 + i * imageButtonHeight;
//                
//                imageButton.frame = CGRectMake(0, imageButtonBegin_y, imageButtonWidth, imageButtonHeight);
//                imageButton.backgroundColor = [UIColor greenColor];
//                [baseView addSubview:imageButton];
//                
//                
//                UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//                titleButton.tag = i + 1;
//                titleButton.backgroundColor = [UIColor clearColor];
//                [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                titleButton.frame = CGRectMake(imageButton.frame.origin.x + imageButton.bounds.size.width,imageButtonBegin_y, titleButtonWidth, titleButtonHeight);
//                
//                titleButton.backgroundColor = [UIColor yellowColor];
//                [titleButton setTitle:_titleArr[i] forState:UIControlStateNormal];
//                [titleButton addTarget:self action:@selector(menuButtonHandler:) forControlEvents:UIControlEventTouchDown];
               
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
        baseView.transform = CGAffineTransformMakeTranslation(baseView.bounds.size.width, 0);
        baseView.alpha = 0.8;
    } completion:^(BOOL finished) {
        
    }];
}

//弹回动画
- (void)popBackAnimation{
    [UIView animateWithDuration:0.3 animations:^{
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
