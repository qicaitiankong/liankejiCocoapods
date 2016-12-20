//
//  CenterSmallView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "groupButttonClickDelegate.h"

@interface CenterSmallView : UIView

@property (strong,nonatomic)UIButton *imageButton;
@property (strong,nonatomic)UILabel * titleLable;

@property (assign,nonatomic)id<groupButtonDelegate> groupdelegate;
/**
 *  self加button,lable
 *
 *  @param frame      self加到父物体的frame
 *  @param _image     按钮图片
 *  @param _text      lable标题
 *  @param _isCenter  标题是否居中
 *  @param _delegate  代理
 *  @param _buttonTag 按钮标签
 *
 *  @return self
 */
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)_image lableTitle:(NSString*)_text lableTextCenter:(BOOL)_isCenter delegate:(id<groupButtonDelegate>)_delegate buttonTag:(NSInteger)_buttonTag;

@end
