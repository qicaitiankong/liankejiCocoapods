//
//  firstPageButtonGroup.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageButtonGroup.h"
#import "appCommonAttributes.h"



#define FIRST_BUTTON_LEFT_SPACE 10
#define LAST_BUTTON_RIGHT_SPACE 10

//BUTTON与BUTTON水平方向的间隔
#define BUTTON_HORINZONTAL_SPACE 5
//button垂直方向的间隔
#define BUTTON_VERTICAL_SPACE 5
UIView *baseView;
@implementation firstPageButtonGroup

-(UIView*)initWithFrame:(CGRect)frame titleArray:(NSMutableArray*)_titleArray imageArr:(NSMutableArray*)_imageArr groupDelegate:(id<groupButtonDelegate>)_groupDelegate{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    if(self){
        baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        //baseView.backgroundColor = [UIColor grayColor];
        [self addSubview:baseView];
        //行数
        double row = 2;
        NSLog(@"row=%lf",row);
        //一行规定4个，列数不定
        CGFloat buttonWidth = (baseView.frame.size.width - FIRST_BUTTON_LEFT_SPACE  - LAST_BUTTON_RIGHT_SPACE - 3 * BUTTON_HORINZONTAL_SPACE ) / 4;
        CGFloat buttonHeight = buttonWidth;
        NSInteger j = 0;
        for(NSInteger i = 0; i < _titleArray.count; i ++){
            if(i % 4 == 0 && i != 0){
                j ++;
            }
            CGRect buttonFrame = CGRectMake(FIRST_BUTTON_LEFT_SPACE + i % 4 * (buttonWidth + BUTTON_HORINZONTAL_SPACE) , BUTTON_VERTICAL_SPACE + j * (buttonHeight + BUTTON_VERTICAL_SPACE), buttonWidth, buttonHeight);
            //检查长度设置对齐方式
            BOOL iscenter = NO;
            NSString *title = _titleArray[i];
            if(title.length <= 3){
                iscenter = YES;
            }
            CenterSmallView *smallView = [[CenterSmallView alloc]initWithFrame:buttonFrame image:_imageArr[i] lableTitle:_titleArray[i] lableTextCenter:iscenter delegate:_groupDelegate buttonTag:i + 1];
            [baseView addSubview:smallView];
        }
        //设置完按钮之后，重置self与baseView高度
        baseView.frame = CGRectMake(0, 0, baseView.frame.size.width, BUTTON_VERTICAL_SPACE * 3 + buttonHeight * 2);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, BUTTON_VERTICAL_SPACE * 3 + buttonHeight * 2);
        }
       return self;
}

//设置view样式
- (void)setStyleOfView :(UIView*)_view{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
