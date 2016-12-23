//
//  LZHTabBar.h
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LZHTabBar;

@protocol LZHTabBarDelegate <NSObject>

@optional

- (void)tabBar:(LZHTabBar*)tabBar didClickBtn:(NSInteger)index;

@end

@interface LZHTabBar : UIView
//模型数组
@property (nonatomic,strong)NSArray *items;
//选中的索引
@property (assign,nonatomic)NSInteger selectIndex;

@property (nonatomic,weak) id<LZHTabBarDelegate> delegate;

@end
