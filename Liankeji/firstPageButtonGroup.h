//
//  firstPageButtonGroup.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CenterSmallView.h"

@interface firstPageButtonGroup : UIView

-(UIView*)initWithFrame:(CGRect)frame titleArray:(NSMutableArray*)_titleArray imageArr:(NSMutableArray*)_imageArr groupDelegate:(id<groupButtonDelegate>)_groupDelegate;

@end
