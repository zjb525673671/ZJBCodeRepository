//
//  UIFont+JB.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (JB)

/**
 苹果semi字体
 
 @param size 大小
 @return 字体
 */
+ (UIFont *)jb_semiFontWithSize:(CGFloat)size;

/**
 苹果light字体
 
 @param size 大小
 @return 字体
 */
+ (UIFont *)jb_lightFontWithSize:(CGFloat)size;

/**
 苹果regular字体
 
 @param size 大小
 @return 字体
 */
+ (UIFont *)jb_regularFontWithSize:(CGFloat)size;
/**
 苹果medium字体
 
 @param size 大小
 @return 字体
 */
+ (UIFont *)jb_mediumFontWithSize:(CGFloat)size;

@end
