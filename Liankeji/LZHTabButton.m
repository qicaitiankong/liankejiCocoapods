//
//  LZHTabButton.m
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LZHTabButton.h"

#define OWN_IMAGEVIEW_WIDTH 30
#define OWN_IMAGEVIEW_HEIGHT 30

@interface LZHTabButton ()

@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)UILabel *ownLable;

@end

@implementation LZHTabButton


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.imageView.hidden = YES;
        self.titleLabel.hidden = YES;
        self.ownTitleColor = [UIColor grayColor];
        
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 20, 20)];
        //self.ownImageView.backgroundColor = [UIColor redColor];
        UIImage *image = [_ownImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.ownImageView setImage:image];
        [self addSubview:self.ownImageView];
        
        
        self.ownLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        self.ownLable.textAlignment = NSTextAlignmentCenter;
        [self.ownLable setText:self.ownLableTitle];
        self.ownLable.font = [UIFont systemFontOfSize:10];
        self.ownLable.textColor = self.ownTitleColor;
        //[self.ownLable setTextColor:[UIColor yellowColor]];
        [self addSubview:self.ownLable];
        
        
        
       // self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
   // NSLog(@"layoutSubviews");
    //调整imageView位置
    CGFloat image_width = self.width * 0.45;
    CGFloat image_height = self.height * 0.55;
    
    self.ownImageView.width = image_width;
    self.ownImageView.height = image_height;
    self.ownImageView.center = CGPointMake(self.width / 2, self.ownImageView.center.y);
    
    
    CGFloat lable_width = self.width;
    CGFloat lable_height = self.height - self.ownImageView.height - self.ownImageView.y;
    
    self.ownLable.y = self.ownImageView.y + self.ownImageView.height;
    self.ownLable.width = lable_width;
    self.ownLable.height = lable_height;
    
    self.ownImageView.image = self.ownImage;
    self.ownLable.text = self.ownLableTitle;
    self.ownLable.textColor = self.ownTitleColor;
    
    
}
-(void)setItem:(UITabBarItem *)item{
    _item = item;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
