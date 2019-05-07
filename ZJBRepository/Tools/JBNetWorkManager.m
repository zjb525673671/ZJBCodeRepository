//
//  JBNetWorkManager.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/6/27.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBNetWorkManager.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import <AliyunOSSiOS/AliyunOSSiOS.h>

/// 上传回调
typedef void(^uploadCallblock)(BOOL success, NSString* msg, NSArray<NSString *>* keys);

@interface JBNetWorkManager ()

@property (strong, nonatomic) AFURLSessionManager *sessionManager;

@end

@implementation JBNetWorkManager

+ (JBNetWorkManager *)shareInstance
{
    static JBNetWorkManager *_manager = nil;
    static dispatch_once_t onceInterfaceInitialize;
    dispatch_once(&onceInterfaceInitialize, ^{
        _manager = [[JBNetWorkManager alloc]init];
    });
    return _manager;
}

- (void)requestBaiDu
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //修改响应的序列化器
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager GET:@"https://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
    }];
}

- (void)requestBaiDuWithCallBack:(void (^)(BOOL isSuccess, NSString *errStr))callBack
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //修改响应的序列化器
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager GET:@"https://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callBack(YES,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(NO,@"出错误啦");
    }];
}

- (void)uploadImagesToOSSWithURL:(NSString *)URL
                        fileData:(NSData *)fileData
                  finishCallBack:(void (^)(BOOL isSuccess, NSString *errStr))finishCallBack {
    if (!fileData) {
        finishCallBack(NO, @"上传文件为空");
        return;
    }
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URL]];
    request.HTTPMethod = @"PUT";
    
    [request setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"qingyin" forHTTPHeaderField:@"x-oss-meta-author"];
    
    NSURLSessionTask *uploadTask = [_sessionManager uploadTaskWithRequest:request
                                                                 fromData:fileData
                                                                 progress:^(NSProgress *_Nonnull uploadProgress) {
                                                                     //上传进度不需要
                                                                 }
                                                        completionHandler:^(NSURLResponse *_Nonnull response, id _Nullable responseObject, NSError *_Nullable error) {
                                                            
                                                            if (!error) {
                                                                finishCallBack(YES, nil);
                                                                XNLog(@"文件上传成功");
                                                            } else {
                                                                finishCallBack(NO, @"上传失败");
                                                                XNLog(@"文件上传失败error:%@",error.description);
                                                            }
                                                        }];
    [uploadTask resume];
}

- (AFURLSessionManager *)sessionManager {
    if (!_sessionManager) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return _sessionManager;
}

@end
