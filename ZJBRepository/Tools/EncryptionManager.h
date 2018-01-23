//
//  EncryptionManager.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/1/22.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptionManager : NSObject

/**
 base64加密

 @param string 原字符串
 @return 加密字符串
 */
+ (NSString *)base64EncodedStringWithStrig:(NSString *)string;

/**
 base64解密

 @param string 加密字符串
 @return 解密字符串
 */
+ (NSString *)base64DecodeDataWithString:(NSString *)string;

/**
 md5编码

 @param string 原字符串
 @return md5 编码后的字符串
 */
+ (NSString *)MD5StringWithStrig:(NSString *)string;

@end
