//
//  AnounceButtonView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/26.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol announceButtonClickDelegate <NSObject>

- (void)announceButtonClick:(NSInteger)index;

@end



@interface AnounceButtonView : UIView


@property (strong,nonatomic)UIImageView *ownImageView;

@property (strong,nonatomic)UILabel *ownLable;

@property (assign,nonatomic)id <announceButtonClickDelegate>
    announceDelegate;

-(instancetype)initWithFrame:(CGRect)frame delegate:(id<announceButtonClickDelegate>)_delegate buttonTag:(NSInteger)buttonTag;


@end
