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
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",html);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

+ (void)uploadImages:(NSArray *)images isAsync:(BOOL)isAsync callback:(uploadCallblock)callback {
    // 1
    
}

@end
