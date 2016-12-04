//
//  ShareNetWorkState.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ShareNetWorkState.h"



static ShareNetWorkState *ShareGetNetState = nil;
static AFHTTPSessionManager *manager = nil;

@implementation ShareNetWorkState
+(ShareNetWorkState*)ShareNetState{
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        ShareGetNetState = [[ShareNetWorkState alloc]init];
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/css", @"text/plain", @"application/x-javascript", @"application/javascript",@"application/xhtml+xml",@"application/xml", nil];
    });
    return ShareGetNetState;
}

-( NSInteger)getNetState:(SEL)notReachableHandler unknownStateHandler:(SEL)unknownStateHandler WifeHandler:(SEL)
    wifeHandler wanHandler:(SEL)wwanHandler target:(id)target
    {
    __block NSInteger num = 0;
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%@",[NSThread currentThread]);
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                num = 0;
                NSLog(@"没网");
                [target performSelectorOnMainThread:notReachableHandler withObject:nil waitUntilDone:NO];
                break;
            case AFNetworkReachabilityStatusUnknown:
                num = -1;
                NSLog(@"未知");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                num = 1;
                NSLog(@"%li WIFE",num);
               // [target performSelector:wifeHandler withObject:nil];
                [target performSelectorOnMainThread:wifeHandler withObject:nil waitUntilDone:NO];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"宽带");
                num = 2;
                break;
            default:
                break;
        }
    }];
    NSLog(@"网络:%li",num);
    return num;
}
-(void)stopNetWatch{
    [[AFNetworkReachabilityManager sharedManager]stopMonitoring];
    //停止监听网络
}
- (void)getDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameterDict sucess:(Success)success failuer:(Failure)failure{
    [manager GET:url parameters:parameterDict progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"下载线程%@",[NSThread currentThread]);
        //NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"当前线程%@",[NSThread currentThread]);
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
- (void)postDataWithUrl:(NSString*)url parameters:(NSDictionary*)parameterDict sucess:(Success)success failuer:(Failure)failure{
    [manager POST:url parameters:parameterDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
- (void)uploadData:(NSString *)urlString upImage:(UIImage*)_image{
    //[manager POST:<#(nonnull NSString *)#> parameters:<#(nullable id)#> constructingBodyWithBlock:<#^(id<AFMultipartFormData>  _Nonnull formData)block#> progress:<#^(NSProgress * _Nonnull uploadProgress)uploadProgress#> success:<#^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)success#> failure:<#^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)failure#>]
}

@end
