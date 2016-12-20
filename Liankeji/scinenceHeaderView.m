//
//  scinenceHeaderView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "scinenceHeaderView.h"
#import "appCommonAttributes.h"

@implementation scinenceHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = RGBA(244, 244, 244, 1);
    if(self){
        UILabel *headerLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width, frame.size.height - 2 * 10)];
        headerLable.backgroundColor = [UIColor whiteColor];
        headerLable.textAlignment = NSTextAlignmentCenter;
        [headerLable setTextColor:[UIColor blueColor]];
        headerLable.text = @"科技头条";
        [self addSubview:headerLable];
    }
    return  self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
