//
//  LZHTabBar.m
//  UITabBarTest
//
//  Created by 李自豪 on 16/12/22.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LZHTabBar.h"
#import "LZHTabBigButton.h"
#import "LZHTabButton.h"
//按钮之间的距离
#define TABBAR_BUTTON_SPACE 70
//最左边按钮左边距（）
#define TABBAR_BUTTON_LEFT_SPACE 20

@interface LZHTabBar ()
//保持对上一次点的按钮的记忆
@property (nonatomic,weak) UIButton *selectButton;
//大按钮
@property (nonatomic,weak)LZHTabBigButton *bigButton;

//当前选中的索引
@property (nonatomic,assign)NSInteger currentSelectedIndex;


@end

@implementation LZHTabBar
//tabBar tag
static NSInteger const LZHTabBarTag = 12000;

//首页，资讯、发布。社区，我的 tag = 12000,12001,12002,12003,12004

UIImageView *backImageView;

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor grayColor];
    if(self){
            //设置背景图片
        backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
        UIImage *image = [UIImage imageNamed:@"tab_group_back@3x"];
        backImageView.contentMode = UIViewContentModeBottom;
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
       // backImageView.backgroundColor = [UIColor redColor];
            [backImageView setImage:image];
       
            [self addSubview:backImageView];
        
    }
    return self;
}
//因为下面的按钮位置布局是根据self的子视图个数的，所以注意backImageView已经作为子视图添加了进来，所以要再减去1

- (void)setItems:(NSArray *)items{
    _items = items;

    
    for(int i = 0 ; i <items.count; i ++){
        UITabBarItem *item = items[i];
        //中心大按钮
        if(i == 2){
            LZHTabBigButton *btn = [LZHTabBigButton buttonWithType:UIButtonTypeCustom];
            
            btn.tag = self.subviews.count + LZHTabBarTag - 1;//3 + 12000 - 1
            //设置自定义属性
            btn.ownBigImage = item.image;
            btn.ownBigTitle = item.title;
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:btn];
            self.bigButton = btn;
            //其余四个小按钮
        }else{
            LZHTabButton *btn = [LZHTabButton buttonWithType:UIButtonTypeCustom];
            
            btn.tag = self.subviews.count + LZHTabBarTag -1;
           // btn.adjustsImageWhenHighlighted = NO;
            btn.item = item;
            
            btn.ownImage = item.image;
            btn.ownLableTitle = item.title;
            
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            
            [self addSubview:btn];
            // 子控件的个数
            NSInteger subViewsCount = 1;
        if (self.selectIndex) {
                subViewsCount = self.selectIndex + 1;
            }
            if (self.subviews.count - 1 == subViewsCount) {
                self.currentSelectedIndex = self.subviews.count - 1 - 1;
              
                // 默认选中第一个
                self.selectButton = btn;
                btn.ownImage = item.selectedImage;
                //[btn.ownImageView setImage:item.selectedImage];
                btn.ownTitleColor = [UIColor blueColor];
            }
        }
    }
}

-(void)setDelegate:(id<LZHTabBarDelegate>)delegate{
    _delegate = delegate;
    [self btnClick:[self viewWithTag:self.currentSelectedIndex + LZHTabBarTag]];
    
}

- (void)btnClick:(UIButton*)_b{
    //简化tag
    NSInteger simpleTag = _b.tag - LZHTabBarTag;
    //当前点击的item(image,selectedImage)
    UITabBarItem *currentItem = _items[simpleTag];
    
    //获取上一个点击按钮的item
    UITabBarItem *formerButtonTabBarItem = _items[self.selectButton.tag - LZHTabBarTag];
    
    //点击的是大按钮
    if(simpleTag == 2){
        if(self.selectButton != _b){
            //重置上次点击按钮的状态
            LZHTabButton *smallButton = (LZHTabButton*)self.selectButton;
            smallButton.ownImage = formerButtonTabBarItem.image;
            smallButton.ownTitleColor = [UIColor grayColor];
            //改变当前点击按钮的状态
            LZHTabBigButton *bigButton =(LZHTabBigButton*) _b;
            bigButton.ownBigImage = currentItem.image;
            bigButton.ownTitleColor = [UIColor blueColor];
            
        }
    }else{//点击的是小按钮
        if(self.selectButton != _b){//不是同一个按钮
            
            if(self.selectButton.tag == LZHTabBarTag + 2){//上次的按钮是中心按钮,恢复上次的按钮的状态
                LZHTabBigButton *bigButton =(LZHTabBigButton*) self.selectButton;
                bigButton.ownBigImage = formerButtonTabBarItem.image;
                bigButton.ownTitleColor = [UIColor grayColor];
                
            }else{//上次的按钮是小按钮，恢复上次点击的按钮的状态
                LZHTabButton *formerSmallButton =(LZHTabButton*) self.selectButton;
                formerSmallButton.ownImage = formerButtonTabBarItem.image;
                formerSmallButton.ownTitleColor = [UIColor grayColor];
            }
            //改变当前点击的按钮的状态
            LZHTabButton *smallButton = (LZHTabButton*)_b;
             smallButton.ownImage = currentItem.selectedImage;
            smallButton.ownTitleColor = [UIColor blueColor];
        }
    }
    self.selectButton.selected = NO;
    _b.selected = YES;
    self.selectButton = _b;
    if([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]){
        [_delegate tabBar:self didClickBtn:_b.tag - LZHTabBarTag];
    }
}

//外界索引页跟着跳转
-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    UIButton *button = [self viewWithTag:LZHTabBarTag + selectIndex];
    [self btnClick:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    NSUInteger count = self.subviews.count;
//    NSLog(@"subViewCount:%li",count);
//    CGFloat x = 0;
//    CGFloat y = 0;
//    CGFloat w = [UIScreen mainScreen].bounds.size.width / (count - 1);
//    CGFloat h = self.height;
//    
//    //修改位置
//    //i必须从1开始，因为第一个子视图是背景图片imageView,第二个才是按钮
//        for(int i = 1 ; i < count ; i ++){
//            UIButton *btn = self.subviews[i];
//            x = (i - 1) * w;
//            if(i == 3){
//                y  = -12;
//                h  = self.height + 12;
//            }else{
//                y = 0;
//                h = self.height;
//            }
//            btn.frame = CGRectMake(x, y, w, h);
//        }
//    
    
    
    //试图改变中心点布局
    
    NSUInteger count = 5;
   
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width / 8.5;
    CGFloat x = 0;
    
    CGFloat h = self.height;
    //中心点：1/10,3/10,5/10,7/10,9/10
    CGFloat centerX = [UIScreen mainScreen].bounds.size.width / 10;
    
    
    //修改位置
    //i必须从1开始，因为第一个子视图是背景图片imageView,第二个才是按钮
    for(int i = 1 ; i <= count ; i ++){
        UIButton *btn = self.subviews[i];
        x = 0;
        if(i == 3){
            y  = -12;
            h  = self.height + 12;
            
           // btn.backgroundColor = [UIColor grayColor];

        }else{
            y = 0;
            h = self.height;
        }
        btn.frame = CGRectMake(x, y, w, h);
        btn.center = CGPointMake(centerX + centerX * 2 * (i - 1), btn.center.y);
    }


    
}
//减小有效点击区域
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
