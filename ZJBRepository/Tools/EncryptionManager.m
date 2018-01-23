//
//  EncryptionManager.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/1/22.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "EncryptionManager.h"

@implementation EncryptionManager

+ (NSString *)base64EncodedStringWithStrig:(NSString *)string
{
    if (!string)
    {
        return nil;
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //判断是否传入需要加密数据参数
    if ((data == nil) || (data == NULL)) {
        return nil;
    } else if (![data isKindOfClass:[NSData class]]) {
        return nil;
    }
    
    //判断设备系统是否满足条件
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] <= 6.9) {
        return nil;
    }
    
    //使用系统的API进行Base64加密操作
    NSDataBase64EncodingOptions options;
    options = NSDataBase64EncodingEndLineWithLineFeed;
    return [data base64EncodedStringWithOptions:options];
}

+ (NSString *)base64DecodeDataWithString:(NSString *)string
{
    //判断是否传入需要加密数据参数
    if ((string == nil) || (string == NULL)) {
        return nil;
    } else if (![string isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    //判断设备系统是否满足条件
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] <= 6.9) {
        return nil;
    }
    
    //使用系统的API进行Base64解密操作
    NSDataBase64DecodingOptions options;
    options = NSDataBase64DecodingIgnoreUnknownCharacters;
    NSString *decodeString = nil;
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:string options:options];
    decodeString = [[NSString alloc] initWithData:decodeData
                                         encoding:NSUTF8StringEncoding];
    return decodeString;
}
@end
