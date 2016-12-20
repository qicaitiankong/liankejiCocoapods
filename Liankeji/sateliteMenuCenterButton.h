//
//  sateliteMenuCenterButton.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/18.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SateliteMenu.h"

@interface sateliteMenuCenterButton : UIView
//卫星菜单是否打开
@property (assign,nonatomic)BOOL isOpen;
//指定代理
@property (assign,nonatomic) id <clickSubButtonDelegate>clickdelegate;

-(instancetype)initWithFrame:(CGRect)frame _delegate:(id<clickSubButtonDelegate>)_deleagte;
@end
