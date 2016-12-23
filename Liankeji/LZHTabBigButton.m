//
//  LZHTabBigButton.m
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LZHTabBigButton.h"

@interface LZHTabBigButton()
//背景(没有用到)
@property (nonatomic,weak)UIView *bgView;
//按钮中的自定义imageView
@property (strong,nonatomic)UIImageView *ownImageView;
//按钮中的自定义lable
@property (strong,nonatomic)UILabel *ownLable;

@end


@implementation LZHTabBigButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        //self.backgroundColor = [UIColor grayColor];
        //
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat imageView_width = self.width * 0.5;
    CGFloat imageView_height = imageView_width;
    
    //设置ownimageView
    self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageView_width, imageView_height)];
    [self.ownImageView setImage:_ownBigImage];
    [self addSubview:self.ownImageView];
    self.ownImageView.layer.cornerRadius = imageView_width / 2;
    self.ownImageView.center = CGPointMake(self.width / 2, self.ownImageView.center.y);
    
    //self.ownImageView.backgroundColor = [UIColor redColor];
    //根据上面的imageView调整ownLable
    
    CGFloat ownLable_width = self.ownImageView.width;
    CGFloat ownLable_height = self.height - self.ownImageView.y - self.ownImageView.height;
   // self.ownLable.backgroundColor = [UIColor yellowColor];
    
    self.ownLable = [[UILabel alloc]initWithFrame:CGRectMake(self.ownImageView.x, self.ownImageView.y + self.ownImageView.height, ownLable_width, ownLable_height)];
    self.ownLable.text = _ownBigTitle;
    self.ownLable.textAlignment = NSTextAlignmentCenter;
    self.ownLable.textColor = [UIColor lightGrayColor];
    self.ownLable.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.ownLable];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
