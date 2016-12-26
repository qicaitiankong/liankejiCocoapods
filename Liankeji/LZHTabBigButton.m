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
        NSLog(@"2017width=%lf",self.width);
        self.ownTitleColor = [UIColor grayColor];
        self.titleLabel.hidden = YES;
        //self.backgroundColor = [UIColor grayColor];
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 1, 20, 20)];
        [self.ownImageView setImage:_ownBigImage];
        //self.ownImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.ownImageView];
        
        self.ownLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.ownLable.text = _ownBigTitle;
        self.ownLable.textAlignment = NSTextAlignmentCenter;
        self.ownLable.textColor = self.ownTitleColor;
        self.ownLable.font = [UIFont systemFontOfSize:10];
        
        [self addSubview:self.ownLable];
        
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat imageView_width = self.width * 0.85;
    CGFloat imageView_height = imageView_width;
    
    //调整ownimageView
    self.ownImageView.width = imageView_width;
    self.ownImageView.height = imageView_height;
    
    
    self.ownImageView.layer.cornerRadius = imageView_width / 2;
    self.ownImageView.center = CGPointMake(self.width / 2, self.ownImageView.center.y);
    
   // self.ownImageView.backgroundColor = [UIColor redColor];
    //根据上面的imageView调整ownLable
    
    CGFloat ownLable_width = self.width;
    CGFloat ownLable_height = self.height - self.ownImageView.y - self.ownImageView.height  - 4;
    
    self.ownLable.y = self.ownImageView.y + self.ownImageView.height + 4;
    self.ownLable.width = ownLable_width;
    self.ownLable.height = ownLable_height;
    self.ownImageView.image = self.ownBigImage;
    self.ownLable.text = self.ownBigTitle;
    self.ownLable.textColor = self.ownTitleColor;
 }

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
