//
//  sideMenuButton.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "sideMenuButton.h"

@implementation sideMenuButton

- (UIButton*)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    //self.backgroundColor = [UIColor yellowColor];
    if (self) {
        CGFloat imageButtonWidth = frame.size.width * 0.25;
        
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageButtonWidth, imageButtonWidth)];
        
        
        //self.ownImageView.backgroundColor = [UIColor greenColor];
        self.ownImageView.layer.cornerRadius = self.ownImageView.bounds.size.width / 2;

        [self addSubview:self.ownImageView];
        
         self.ownTitleLable = [[UILabel alloc]init];
        self.ownTitleLable.frame = CGRectMake(self.ownImageView.bounds.size.width, 0, frame.size.width - imageButtonWidth, frame.size.height);
        
         //self.ownTitleLable.backgroundColor = [UIColor grayColor];
        [self.ownTitleLable setTextColor:[UIColor blackColor]];
        //重置imageview在Y上的中心点
        self.ownImageView.center = CGPointMake(self.ownImageView.center.x, self.ownTitleLable.center.y);
        [self addSubview: self.ownTitleLable];

    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
