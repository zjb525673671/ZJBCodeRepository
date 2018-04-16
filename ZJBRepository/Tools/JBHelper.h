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

@end
