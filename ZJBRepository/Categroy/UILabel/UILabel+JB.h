//
//  UILabel+JB.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JB)

/**
 设置label各种属性
 
 @param text 标题
 @param textColor 标题颜色
 @param font 字体大小
 @param aligment 位置
 */
- (void)jb_text:(NSString *)text
      textColor:(UIColor *)textColor
           font:(UIFont *)font
       aligment:(NSTextAlignment)aligment;

@end
