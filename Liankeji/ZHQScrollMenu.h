//
//  ZHQScrollMenu.h
//  新闻客户端
//
//  Created by zhouqing on 16/4/14.
//  Copyright © 2016年 uplooking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHQScrollMenu : UIScrollView
//添加按钮
-(void)addButton:(UIButton *)btn;
//设置选中按钮
-(void)selected:(UIButton *)btn;
//转屏更新控件
-(void)updateUI;
@end
