//
//  ShareNetWorkState.h
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>

typedef void(^Success)(id reponseObject);//成功回调
typedef void(^Failure)(NSError *err);//错误回调
@interface ShareNetWorkState : NSObject
-(NSInteger)getNetState:(SEL)notReachableHandler unknownStateHandler:(SEL)unknownStateHandler WifeHandler:(SEL)
wifeHandler wanHandler:(SEL)wwanHandler target:(id)target;

+(ShareNetWorkState*)ShareNetState;
- (void)getDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameterDict sucess:(Success)success failuer:(Failure)failure;
- (void)postDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameterDict sucess:(Success)success failuer:(Failure)failure;
-(void)stopNetWatch;
@end
