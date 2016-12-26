//
//  ZHQScrollMenu.m
//  新闻客户端
//
//  Created by zhouqing on 16/4/14.
//  Copyright © 2016年 uplooking. All rights reserved.
//

#import "ZHQScrollMenu.h"

@implementation ZHQScrollMenu
{
    NSMutableArray * buttons;
    UIView * lineView;
}
//设置横竖屏的，用不到
-(void)updateUI
{
    self.frame=CGRectMake(0, self.frame.origin.y, self.superview.frame.size.width, self.frame.size.height);
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        buttons=[[NSMutableArray alloc]init];
        self.showsHorizontalScrollIndicator=NO;
    }
    return self;
}
-(void)addButton:(UIButton *)btn
{
    //调整按钮位置
    btn.frame=CGRectMake(5*(buttons.count+1)+100*buttons.count, 0, 100, 40);
    btn.center = CGPointMake(btn.center.x, self.bounds.size.height / 2);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //线
    if(buttons.count==0)//第一个按钮
    {
        [btn setTitleColor:[UIColor redColor]  forState:UIControlStateNormal];
        lineView=[[UIView alloc]initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y + btn.frame.size.height + 3, 100, 1)];
        lineView.backgroundColor=[UIColor redColor];
        [self addSubview:lineView];
    }
    //保存到数组中
    [buttons addObject:btn];
    //添加到界面
    [self addSubview:btn];
    if(btn.frame.origin.x+btn.frame.size.width>self.frame.size.width)//内容超出滚动视图范围
    {
        self.contentSize=CGSizeMake(btn.frame.origin.x+btn.frame.size.width, self.frame.size.height);
    }
}
//修改变化状态
-(void)selected:(UIButton *)btn
{
    for(UIButton * b in buttons)
    {
        //清除文本改为黑色
        [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    //点亮当前按钮 文本改为红色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //动画
    [UIView animateWithDuration:0.2 animations:^{
        //把线移动到当前选中按钮下
        lineView.frame=CGRectMake(btn.frame.origin.x, lineView.frame.origin.y, lineView.frame.size.width, lineView.frame.size.height);
    }];
}
@end
