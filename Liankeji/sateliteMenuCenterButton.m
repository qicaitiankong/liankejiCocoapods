//
//  sateliteMenuCenterButton.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/18.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "sateliteMenuCenterButton.h"
#import "SateliteMenu.h"

@implementation sateliteMenuCenterButton
UIButton *centerButton = nil;

-(instancetype)initWithFrame:(CGRect)frame _delegate:(id<clickSubButtonDelegate>)_deleagte{
    self = [super initWithFrame:frame];
    if(self){
        self.clickdelegate = _deleagte;
        self.backgroundColor = [UIColor whiteColor];
        //self.alpha = 0.75;
        self.layer.cornerRadius = frame.size.width / 2;
        centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        centerButton.backgroundColor = [UIColor grayColor];
        centerButton.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        centerButton.layer.cornerRadius = self.layer.cornerRadius;
        [centerButton addTarget:self action:@selector(centerButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerButton];
    }
    return  self;
}
//点击中心按钮事件
- (void)centerButtonHandler:(UIButton*)_b{
        //创建并展开动画 注意self与menu是同级关系，他们分别加到了window,互不包含
    SateliteMenu *menu = [[SateliteMenu alloc]initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width +300, self.frame.size.height + 300) targetCenter:self.center  centerButtonSize:CGSizeMake(centerButton.frame.size.width, centerButton.frame.size.height) delegeteTarget:self.clickdelegate];
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:menu];
    //创建卫星子安扭的view
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
