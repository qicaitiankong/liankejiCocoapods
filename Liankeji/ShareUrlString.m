//
//  ShareUrlString.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ShareUrlString.h"
static ShareUrlString *shareUrlString = nil;
@implementation ShareUrlString
+(ShareUrlString*)ShareUrlString{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        NSLog(@"执行单例");
        shareUrlString = [[ShareUrlString alloc]init];
    });
    return shareUrlString;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.testUrlStr = @"http://115.159.1.248:56666/xinwen/getorders.php";
        self.postUrlStr = @"http://115.159.1.248:56666/xinwen/getsearchs.php";
    }
    return self;
}

@end
