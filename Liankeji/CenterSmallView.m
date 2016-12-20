//
//  CenterSmallView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中间的企业、专家等分类自定义视图
#import "CenterSmallView.h"

@implementation CenterSmallView
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)_image lableTitle:(NSString*)_text lableTextCenter:(BOOL)_isCenter delegate:(id<groupButtonDelegate>)_delegate buttonTag:(NSInteger)_buttonTag
{
    self = [super initWithFrame:frame];
   // self.backgroundColor = [UIColor redColor];
    if (self) {
        self.groupdelegate = _delegate;
       _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _imageButton.tag = _buttonTag;
        _imageButton.frame = CGRectMake(frame.size.width * 0.125, 0, frame.size.width* 0.75, frame.size.height * 0.75);
        [_imageButton setImage:_image forState:UIControlStateNormal];
       // _imageButton.backgroundColor = [UIColor grayColor];
        [_imageButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_imageButton];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(_imageButton.frame.origin.x, _imageButton.frame.size.height, _imageButton.frame.size.width, frame.size.height * 0.25)];
        _titleLable.text = _text;
        if(_isCenter){
            _titleLable.textAlignment = NSTextAlignmentCenter;
        }
        //_titleLable.backgroundColor = [UIColor blueColor];
        _titleLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLable];
    }
    return self;
}

- (void)buttonHandler:(UIButton*)_b{
    if(self.groupdelegate){
        [self.groupdelegate groupButtonClickHandler:_b.tag];
    }
    //NSLog(@"点击按钮中2016");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
