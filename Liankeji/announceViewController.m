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

//6个按钮组的tag基数
#define BUTTON_TAG 100

@interface announceViewController ()<announceButtonClickDelegate>{
    //主窗口
    UIWindow *rootWindow;
    //基视图
    UIView *baseView;
    //logo的视图
    UIImageView *animationImageView;
    //按钮组的视图
    UIView *buttonAnimationView;
    //取消按钮
    UIButton *cancelButton;
    
}

@end

@implementation announceViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"发布首页");
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [self addBaseBackgroundView];
    [self addAnimationImageView];
    [self addGroupButton];
    [self addCancelButton];
    [self animationLogoViewPopIn];
    NSLog(@"将要出现");
}
//主窗口添加基view
- (void)addBaseBackgroundView{
   rootWindow = [UIApplication sharedApplication].windows[0];
    baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rootWindow.bounds.size.width, rootWindow.bounds.size.height)];
    baseView.backgroundColor =[UIColor whiteColor];
    [rootWindow addSubview:baseView];
}

//添加logo
- (void)addAnimationImageView{
    CGFloat orginX = 0.1 * SCREEN_WIDTH;
    CGFloat orignY = SCREEN_HEIGHT + 20;
    animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(orginX, orignY, SCREEN_WIDTH - orginX * 2, 200)];
    //animationImageView.backgroundColor = [UIColor grayColor];
    [animationImageView setImage:[UIImage imageNamed:@"anounce_logo@3x"]];
    [baseView addSubview:animationImageView];
}
//添加按钮组
- (void)addGroupButton{
    
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 120;
    
    //距离屏幕左边距离
    CGFloat leftSpace = 50;
    //按钮之间水平距离
    CGFloat buttonHorizontalSpace = (SCREEN_WIDTH - leftSpace * 2 - buttonWidth * 3) * 0.5;
    //垂直方向开始位置
    CGFloat buttonOrignY = -400;
    
    NSLog(@"垂直开始位置:%lf",buttonOrignY);
    //按钮之间的垂直距离
    CGFloat buttonVerticalSpace = 20;
    for(NSInteger index = 0; index < 6; index ++){
        
        if(index != 0 && index % 3 == 0 ){
            buttonOrignY =buttonOrignY + buttonHeight + buttonVerticalSpace;
        }
        NSLog(@"垂直开始位置2:%lf",buttonOrignY);
        
        CGRect ButtonViewFrame = CGRectMake(leftSpace + (buttonWidth + buttonHorizontalSpace) * (index % 3), buttonOrignY, buttonWidth, buttonHeight);
        
        AnounceButtonView *button = [[AnounceButtonView alloc]initWithFrame:ButtonViewFrame delegate:self buttonTag:index];
        button.tag = BUTTON_TAG + index;
        NSString *imageNameStr = [NSString stringWithFormat:@"anounce1_%li",index];
        [button.ownImageView setImage:[UIImage imageNamed:imageNameStr]];
        [baseView addSubview:button];
    }
}
//添加取消按钮
- (void)addCancelButton{
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(0, SCREEN_HEIGHT - 80, SCREEN_WIDTH, 80);
    cancelButton.backgroundColor = [UIColor whiteColor];
    
    [cancelButton setImage:[UIImage imageNamed:@"anounce1_cancel.@3x"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelHandler:) forControlEvents:UIControlEventTouchUpInside];
    [baseView addSubview:cancelButton];
    //起初影藏
    cancelButton.userInteractionEnabled = NO;
    cancelButton.alpha = 0;
}



//logo弹入动画
- (void)animationLogoViewPopIn{
    //__weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        animationImageView.transform  = CGAffineTransformMakeTranslation(0, -(SCREEN_HEIGHT - 0.12 * SCREEN_HEIGHT));
    } completion:^(BOOL finished) {
        //按钮组随后进入
        [self buttonGroupPopIn];
    }];
    
}
//logo弹出动画

- (void)animationLogoViewPopOut{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        animationImageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if(finished){
            //还没完善出场逻辑，
            [UIView animateWithDuration:0.8 animations:^{
                baseView.alpha = 0;
                baseView.userInteractionEnabled = NO;
            } completion:^(BOOL finished) {
                if(baseView){
                   //[baseView removeFromSuperview];
                }
            }];
            NSLog(@"弹出logo");
        }
        
    }];
}

//按钮组弹进动画
- (void)buttonGroupPopIn{
    CGFloat targetTranslationY = 400 + animationImageView.frame.origin.y + animationImageView.bounds.size.height + 10;
    //CGFloat targetTranslationY = 300;
    for(NSInteger i = 0 ; i < 6; i ++){
        AnounceButtonView *buttonView = [baseView viewWithTag:BUTTON_TAG + i];
        //NSLog(@"tag=%li",buttonView.tag);
        
        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.45 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            buttonView.transform = CGAffineTransformMakeTranslation(0, targetTranslationY);
            
        } completion:^(BOOL finished) {
            //取消按钮跟着显示
            [UIView animateWithDuration:0.5 animations:^{
                cancelButton.alpha = 1;
                cancelButton.userInteractionEnabled = YES;
            }];
        }];
    }
}


//按钮组弹出动画
- (void)buttonGroupPopOut{
     CGFloat targetTranslationY = SCREEN_HEIGHT;
    for(NSInteger i = 0 ; i < 6; i ++){
        AnounceButtonView *buttonView = [baseView viewWithTag:BUTTON_TAG + i];
        NSLog(@"tag=%li",buttonView.tag);
        
        [UIView animateWithDuration:0.6 animations:^{
            //取消按钮退出动画
            cancelButton.transform = CGAffineTransformMakeTranslation(0, cancelButton.bounds.size.height);
            //按钮组退出
            buttonView.transform = CGAffineTransformTranslate(buttonView.transform, 0, targetTranslationY);
            
        } completion:^(BOOL finished) {
            //logo随后弹出
            [self animationLogoViewPopOut];
        }];
    }
}



//按钮组点击代理方法
-(void)announceButtonClick:(NSInteger)index{
    NSLog(@"你在点击按钮:tag = %li",index);
}

//取消按钮
- (void)cancelHandler:(UIButton*)_b{
    [self buttonGroupPopOut];
    
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
