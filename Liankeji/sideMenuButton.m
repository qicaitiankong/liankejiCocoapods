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
    if (self) {
        CGFloat imageButtonWidth = frame.size.width * 0.25;
        
        self.ownImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageButtonWidth, imageButtonWidth)];
        
        
        self.ownImageView.backgroundColor = [UIColor greenColor];
        [self addSubview:self.ownImageView];
        
         self.ownTitleLable = [[UILabel alloc]init];
        self.ownTitleLable.frame = CGRectMake(self.ownImageView.bounds.size.width, 0, frame.size.width - imageButtonWidth, frame.size.height);
        
         self.ownTitleLable.backgroundColor = [UIColor blueColor];
        
        self.ownImageView.center = CGPointMake(self.ownTitleLable.center.x, self.ownTitleLable.center.y);
        
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
