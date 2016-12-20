//
//  SateliteMenu.h
//  SateliteMenuTest
//
//  Created by 李自豪 on 16/12/14.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import "sateliteMenuProtocol.h"


@interface SateliteMenu : UIView
//5个子按钮，是最好效果，所以尽量不要添加，若需调节角度，请自己修改menuButtonHandler方法
@property (strong,nonatomic)UIButton *button1;
@property (strong,nonatomic)UIButton *button2;
@property (strong,nonatomic)UIButton *button3;
@property (strong,nonatomic)UIButton *button4;
@property (strong,nonatomic)UIButton *button5;
@property (strong,nonatomic)UIButton *button6;
@property (strong,nonatomic)UIButton *button7;

//中心遮罩BUTTON
@property (strong,nonatomic)UIButton *centerButton;

//子安扭存放数组
@property (strong,nonatomic)NSMutableArray *subButtonArr;
//子安扭与中心按钮的距离
@property (assign,nonatomic) CGFloat distance;
//中心按钮的大小
@property (assign,nonatomic) CGSize centerButtonSize;
//背景按钮baseButton是正方形
@property (strong,nonatomic)UIButton *baseButton ;

@property (assign,nonatomic)BOOL isOpen;

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame targetCenter:(CGPoint)_targetCenter  centerButtonSize:(CGSize)_cenButtonSize delegeteTarget:(id<clickSubButtonDelegate>) _delegete;


//处理点击事件代理
@property (assign,nonatomic) id<clickSubButtonDelegate>sateliteDelegate;
@end
