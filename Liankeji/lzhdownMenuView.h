//
//  downMenuView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
//协议
@protocol pullDownMenuDelegate <NSObject>
- (void)downMenuSelect:(NSInteger)_index;
@end

@interface lzhdownMenuView : UIView
//代理属性
@property (assign,nonatomic) id <pullDownMenuDelegate> downMenuDelegate;
//遮罩按钮（整个屏幕）
@property (strong,nonatomic)UIButton *backgroundbutton;
//
@property (strong,nonatomic)UIButton *baseView;
//记录下拉菜单高度
@property (assign,nonatomic)CGFloat menuHeight;
//创建下拉菜单方法
-(instancetype)initWithFrame:(CGRect)frame menuSize:(CGSize)_menuSize titleArray:(NSArray*)_titleArr delegate:(id <pullDownMenuDelegate>) _delegate;

@end
