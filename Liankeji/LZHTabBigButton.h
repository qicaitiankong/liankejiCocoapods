//
//  LZHTabBigButton.h
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"


@interface LZHTabBigButton : UIButton
//自定义iamgeView图片
@property (strong,nonatomic)UIImage *ownBigImage;
//lable标题
@property (strong,nonatomic)NSString *ownBigTitle;
//TITLE颜色
@property (strong,nonatomic)UIColor *ownTitleColor;

@end
