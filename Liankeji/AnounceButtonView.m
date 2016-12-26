//
//  AnounceButtonView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AnounceButtonView.h"
@interface AnounceButtonView()

@property (strong,nonatomic)UIButton *imageButton;

@property (strong,nonatomic)UIButton *titleButton;


@end

@implementation AnounceButtonView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor grayColor];
        
        self.ownImageView = [[UIImageView alloc]init];
        self.ownImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.width);
        self.ownImageView.layer.cornerRadius = self.ownImageView.bounds.size.width / 2;
        
        [self.ownImageView setImage:[UIImage imageNamed:@"发布设备@3x"]];
        self.ownImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.ownImageView];
        
        //[self.titleButton setTitle:@"发布" forState:UIControlStateNormal];
        
       
        
        
        self.ownLable = [[UILabel alloc]init];
        self.ownLable.frame = CGRectMake(self.ownImageView.frame.origin.x, self.ownImageView.frame.origin.y + self.ownImageView.bounds.size.height, self.ownImageView.bounds.size.width, frame.size.height - self.ownImageView.frame.origin.y - self.ownImageView.bounds.size.height);
        self.ownLable.text = @"发布设备";
        self.ownLable.textAlignment = NSTextAlignmentCenter;
        
        
        //self.titleButton.titleLabel.backgroundColor = [UIColor blueColor];
        //self.titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [self addSubview:self.ownLable];

    }
    return self;
}

-(void)layoutSubviews{
    //self.imageButton.imageView.frame = CGRectMake(0, 0, self.imageButton.bounds.size.width,  self.imageButton.bounds.size.width);
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
