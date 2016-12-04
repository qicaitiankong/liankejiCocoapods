//
//  ShareUrlString.h
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareUrlString : NSObject
@property (strong,nonatomic)NSString *testUrlStr;
@property (strong,nonatomic)NSString *postUrlStr;
+(ShareUrlString*)ShareUrlString;
@end
