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
        //self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
    //自定义
    CGFloat image_width = self.width * 0.3;
    CGFloat image_height = self.height * 0.4;
    
    //
    self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, image_width, image_height)];
    [self.ownImageView setImage:_ownImage];
    
    [self addSubview:self.ownImageView];
    //self.ownImageView.backgroundColor = [UIColor greenColor];
    self.ownImageView.center = CGPointMake(self.width / 2, self.ownImageView.center.y);
    
    
    
    
    CGFloat lable_width = self.ownImageView.width;
    CGFloat lable_height = self.height - self.ownImageView.height - self.ownImageView.y;
    
    
    self.ownLable = [[UILabel alloc]initWithFrame:CGRectMake(self.ownImageView.x, self.ownImageView.y + self.ownImageView.height, lable_width, lable_height)];
    self.ownLable.textAlignment = NSTextAlignmentCenter;
    
    [self.ownLable setText:self.ownLableTitle];
    self.ownLable.font = [UIFont systemFontOfSize:10];
    self.ownLable.textColor = [UIColor grayColor];
    
    //self.ownLable.backgroundColor = [UIColor redColor];
    [self addSubview:self.ownLable];
    
    
    //缩小点击区域，只处理宽度
    
    
    
    
    
    
    
    
    
    
    
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
