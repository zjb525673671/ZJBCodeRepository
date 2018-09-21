//
//  UIButton+PC.h
//  ZJBRepository
//
//  Created by zhoujiebing on 2018/9/17.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (PC)

- (void)public_setTitle:(NSString *)title
                   font:(UIFont *)font
             titleColor:(UIColor *)titleColor
        backgroundColor:(UIColor *)backgroundColor
                 target:(id)target
                 action:(SEL)action;

/**
 链式编程之设置title
 */
- (UIButton *(^)(NSString *title))cp_title;

/**
 链式编程之设置titleColor
 */
- (UIButton *(^)(UIColor *color))cp_titleColor;

/**
 链式编程之设置font
 */
- (UIButton *(^)(UIFont *font))cp_font;

/**
 链式编程之设置backgroundColor
 */
- (UIButton *(^)(UIColor *color))cp_backgroundColor;

/**
 链式编程之设置imageName
 */
- (UIButton *(^)(NSString *name))cp_imageName;

/**
 链式编程之设置action
 */
- (UIButton *(^)(id object, SEL action))cp_action;

@end
