//
//  NewsTestModel.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/2.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsTestModel : NSObject
//标题
@property (strong,nonatomic)NSString *title;
//点击量
@property (assign,nonatomic)NSInteger click;
//图片二进制
@property (strong,nonatomic)NSData *imageData;
@property (strong,nonatomic)NSString *content;
@end
