//
//  newAnnouncementView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/19.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "newAnnouncementView.h"
#import "appCommonAttributes.h"

@implementation newAnnouncementView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
    
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(35, 5, 40, 40)];
        //imageView.backgroundColor = [UIColor grayColor];
        [imageView setImage:[UIImage imageNamed:@"1_25"]];
        [self addSubview:imageView];
        
        CGFloat textView_x = imageView.frame.origin.x + imageView.bounds.size.width + 25 ;
        
        CGFloat textView_width = self.bounds.size.width - (imageView.frame.origin.x + imageView.bounds.size.width )- (25 + 19);
        
        self.textScrollView = [[LMJScrollTextView alloc]initWithFrame:CGRectMake(textView_x, 5,textView_width,imageView.bounds.size.height) textScrollModel:LMJTextScrollFromOutside direction:LMJTextScrollMoveLeft];
        self.textScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textScrollView];
        [self.textScrollView setMoveSpeed:0.2];
        [self.textScrollView startScrollWithText:@"最新公告：链科技正在打造国际一流技术对接平台，期望您的加入！" textColor: [UIColor lightGrayColor] font:[UIFont boldSystemFontOfSize:20]];
        
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