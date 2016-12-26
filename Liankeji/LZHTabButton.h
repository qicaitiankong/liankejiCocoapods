//
//  LZHTabButton.h
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"


@interface LZHTabButton : UIButton
//自定义imageView图片
@property (strong,nonatomic)UIImage *ownImage;
//自定义lable标题
@property (strong,nonatomic)NSString *ownLableTitle;

@property (strong,nonatomic)UIColor *ownTitleColor;


//BarItem
@property (nonatomic,strong)UITabBarItem *item;



@end
