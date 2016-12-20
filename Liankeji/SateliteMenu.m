//
//  SateliteMenu.m
//  SateliteMenuTest
//
//  Created by 李自豪 on 16/12/14.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "SateliteMenu.h"

////中心按钮的FRAME
//#define CENTER_BUTTON_FRAME CGRectMake(50, 100, 60, 60)
////中心按钮的半径
//#define CENTENR_MENU_RADIUS 30
////子安扭的Frame
//#define SUBBUTTON_FRAME CGRectMake(50, 100, 25, 25)
////子安扭的半径
//#define SUBBUTTON_RADIUS 12.5

//小按钮的半径与中心按钮半径的比例
#define RADIUS_PERCENTAGE 0.35

@implementation SateliteMenu

@synthesize baseButton;
@synthesize subButtonArr;
@synthesize  distance;
@synthesize isOpen;

//初始方法
//frame:卫星菜单的大小 ——distance:子安扭距离中心点的距离 _delehgate:指定你的代理去做点击子安扭的事件
//小按钮直径是中心按钮的一半
-(instancetype)initWithFrame:(CGRect)frame targetCenter:(CGPoint)_targetCenter  centerButtonSize:(CGSize)_cenButtonSize delegeteTarget:(id<clickSubButtonDelegate>) _delegete{
    self = [super initWithFrame:frame];
    if(self){
        distance = self.frame.size.width / 2 - _cenButtonSize.width / 2 * RADIUS_PERCENTAGE;
        self.centerButtonSize = _cenButtonSize;
        self.sateliteDelegate = _delegete;
        self.center = _targetCenter;
        self.layer.cornerRadius = frame.size.width / 2;
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 0.65;
        [self addGesterRotation];
        [self addBaseButton];
        [self initSubbutton];
        [self addSubMenu];
       
    }
    return self;
}
//添加旋转手势
- (void)addGesterRotation{
    //self.transform = CGAffineTransformMakeRotation(M_PI_2);
    UIRotationGestureRecognizer *gester = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotate:)];
    [self addGestureRecognizer:gester];
}
- (void)rotate:(UIRotationGestureRecognizer*)_u{
    static CGFloat pre_rotate = 0;
    self.transform = CGAffineTransformMakeRotation(_u.rotation + pre_rotate);
    if(_u.state == UIGestureRecognizerStateEnded){
        pre_rotate += _u.rotation;
    }
}
//添加遮罩按钮
- (void)addBaseButton{
    baseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    baseButton.frame = CGRectMake(0, 0, self.centerButtonSize.width, self.centerButtonSize.height);
    baseButton.layer.cornerRadius = self.centerButtonSize.width / 2;
     baseButton.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    baseButton.backgroundColor = [UIColor clearColor];
    [baseButton addTarget:self action:@selector(baseButtonHandler:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:baseButton];
   
}
//点击了遮罩BUTTON收回子按钮
- (void)baseButtonHandler:(UIButton*)_b{
    NSLog(@"你点击了背景按钮");
        [self pullBackSubbutton];
}
//创建子安扭，仅仅创建
- (void)initSubbutton{
    _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    _button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    subButtonArr = [[NSMutableArray alloc]initWithObjects:_button1,_button2,_button3,_button4,_button5,_button6,_button7,nil];
}
//设置所有子安扭的属性
- (void)addSubMenu{
    for(NSInteger i = 0; i <subButtonArr.count; i ++){
        UIButton *button = subButtonArr[i];
        button.frame = CGRectMake(0, 0, baseButton.frame.size.width * RADIUS_PERCENTAGE, baseButton.frame.size.height * RADIUS_PERCENTAGE);
        button.layer.cornerRadius = baseButton.frame.size.width  * RADIUS_PERCENTAGE / 2;
        button.center = baseButton.center;
        button.backgroundColor = [UIColor yellowColor];
        button.tag = i +1 ;
        [button addTarget:self action:@selector(subButtonHandler:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:button];
    }
    if(subButtonArr.count > 0){
        [self dealAnimation];
    }
}

//计算扇形坐标
- (NSMutableArray *)getXWithTanAngle:(double)tanAngle  isSame:(BOOL)_isSame{
    double x;
    double y;
    NSMutableArray *locationArray = [[NSMutableArray alloc]init];
    x = distance / (sqrt(1 + tanAngle * tanAngle));
    if (x > 0.00){
       x = -x;
    }
    //NSLog(@"x=%lf",x);
    // y = fabs(tanAngle * x );
    y = tanAngle * x;
    //NSLog(@"y=%lf",y);
    [locationArray addObject:[NSString stringWithFormat:@"%f",x]];
    [locationArray addObject:[NSString stringWithFormat:@"%f",y]];
    return locationArray;
}

//处理动画
- (void)dealAnimation{
    double tan1 = tan(0);
    double tan2 = tan(M_PI_2 / 7);
    double tan3 = tan(M_PI_2 / 7  * 2);
    double tan4 = tan(M_PI_2 / 7 * 3);
    double tan5 = tan(M_PI_2 / 7 * 4);
    double tan6 = tan(M_PI_2 / 7 * 5);
    double tan7 = tan(M_PI_2 / 7 * 6);
   

    //    double tan1 = tan(M_PI * 2 / (n - 1));
    //    double tan2 = tan((M_PI * 2 / (n - 1) * 2));
    NSMutableArray *positionArr1 = [self getXWithTanAngle:tan1 isSame:NO];
    NSMutableArray *positionArr2 = [self getXWithTanAngle:tan2 isSame:NO];
    NSMutableArray *positionArr3 = [self getXWithTanAngle:tan3 isSame:NO];
    NSMutableArray *positionArr4 = [self getXWithTanAngle:tan4 isSame:NO];
    NSMutableArray *positionArr5 = [self getXWithTanAngle:tan5 isSame:NO];
    NSMutableArray *positionArr6 = [self getXWithTanAngle:tan6 isSame:NO];
    NSMutableArray *positionArr7 = [self getXWithTanAngle:tan7 isSame:NO];
    
    NSMutableArray *positionArray = [[NSMutableArray alloc]initWithObjects:positionArr1,positionArr2,positionArr3,positionArr4,positionArr5,positionArr6,positionArr7,nil];
    if (isOpen) {
        [self pullBackSubbutton];
    }
    else {
        [self popSubbutton:positionArray];
    }
    
    
}
//弹出子安扭
- (void)popSubbutton:(NSMutableArray*)_positionArr{
    isOpen = YES;
    int i  = 0;
    //CAAnimationGroup *group = [CAAnimationGroup animation];
   // NSMutableArray *animationArr = [[NSMutableArray alloc]init];
    for(NSMutableArray *arr in _positionArr){
        double x = [arr[0] doubleValue];
        double y = [arr[1] doubleValue];
        UIButton *button = subButtonArr[i];
        [UIView animateWithDuration:0.5 animations:^{
            button.transform = CGAffineTransformMakeTranslation(x, y);
        } completion:^(BOOL finished) {
        }];
        //启用动画组
        
//        CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//        //[positionAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(button.frame.origin.x, button.frame.origin.y)]];
//        [positionAnimation setToValue:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
//        [positionAnimation  setDuration:1];
//        [positionAnimation setBeginTime:0.1 * i];
//        [button.layer addAnimation:positionAnimation forKey:nil];
//        [animationArr addObject:positionAnimation];
        i ++;
    }
    //[group setAnimations:animationArr];
    //[group setDuration:1];
    //[self.layer addAnimation:group forKey:nil];
}




//拉回子安扭
- (void)pullBackSubbutton{
    isOpen = NO;
    for(UIButton *button in subButtonArr){
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            button.transform = CGAffineTransformIdentity;
            button.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
    }
}
//根据点击tag让代理去处理相应方法
- (void)subButtonHandler:(UIButton*)_b{
    if(_sateliteDelegate){
        [self.sateliteDelegate dealClickHandler:_b.tag];
    }else{
        NSLog(@"代理为空");
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
