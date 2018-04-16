//
//  JBHelper.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBHelper : NSObject

/**
 图片数组
 
 @param baseString 名字前缀
 @param count 数量
 @return 返回的图片数组
 */
+ (NSArray *)help_createImageArrayWithBaseString:(NSString *)baseString count:(NSInteger)count;

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

@end
