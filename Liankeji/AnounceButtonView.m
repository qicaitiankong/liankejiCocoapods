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


-(instancetype)initWithFrame:(CGRect)frame delegate:(id<announceButtonClickDelegate>)_delegate buttonTag:(NSInteger)buttonTag {
    self = [super initWithFrame:frame];
    if(self){
        self.announceDelegate = _delegate;
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.ownImageView = [[UIImageView alloc]init];
        self.ownImageView.userInteractionEnabled = YES;
        
        self.ownImageView.frame = CGRectMake(0, 0, frame.size.height * 0.6, frame.size.height * 0.6);
        self.ownImageView.layer.cornerRadius = self.ownImageView.bounds.size.width / 2;
        self.ownImageView.center = CGPointMake(self.bounds.size.width / 2, self.ownImageView.center.y);
        self.ownImageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.ownImageView];
        //添加imageView上的透明按钮,与ownimageView大小一致
        self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        self.imageButton.frame = CGRectMake(0, 0, self.ownImageView.bounds.size.width, self.ownImageView.bounds.size.width);
        self.imageButton.tag = buttonTag;
        self.imageButton.backgroundColor = [UIColor clearColor];
        self.imageButton.layer.cornerRadius = self.imageButton.bounds.size.width / 2;
        [self.imageButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.ownImageView addSubview:self.imageButton];
        
        //lable
        self.ownLable = [[UILabel alloc]init];
        self.ownLable.frame = CGRectMake(self.ownImageView.frame.origin.x, self.ownImageView.frame.origin.y + self.ownImageView.bounds.size.height + 5, self.ownImageView.bounds.size.width, frame.size.height - self.ownImageView.frame.origin.y - self.ownImageView.bounds.size.height - 5);
        self.ownLable.text = @"发布设备";
        self.ownLable.textAlignment = NSTextAlignmentCenter;
        self.ownLable.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.ownLable];
        
        //titleButton 往self上加而不是lable（lable上不能加按钮）
        self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titleButton.frame = self.ownLable.frame;
        self.titleButton.tag = buttonTag;
        
        self.titleButton.backgroundColor = [UIColor yellowColor];
        self.titleButton.backgroundColor = [UIColor clearColor];
        [self.titleButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.titleButton];
        
        
    }
    return self;
}
- (void)buttonHandler:(UIButton*)_b{
    NSLog(@"你在点击");
    if(self.announceDelegate){
        [self.announceDelegate announceButtonClick:_b.tag];
    }
    
    
    NSLog(@"你在点击中");
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
