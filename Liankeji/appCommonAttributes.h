//
//  appCommonAttributes.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/17.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#ifndef appCommonAttributes_h
#define appCommonAttributes_h

//自定义颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];

#define RED_COLOR RGBA(255,0,0,1);
#define ORANGE_COLOR RGBA(255,165,0,1);
#define YELLOW_COLOR RGBA(255,255,0,1);
#define GREEN_COLOR RGBA(0,255,0,1);
#define CYAN_COLOR RGBA(0,127,255,1);
#define BLUE_COLOR RGBA(0,0,255,1);
#define PURPER_COLOR RGBA(139,0,255,1);
//屏幕高度、宽度
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define NAVIGATION_HEIGHT self.navigationController.navigationBar.frame.size.height
//电池栏高度
#define STATUSBAR_HEIGHT     [UIApplication sharedApplication].statusBarFrame.size.height



#endif /* appCommonAttributes_h */
