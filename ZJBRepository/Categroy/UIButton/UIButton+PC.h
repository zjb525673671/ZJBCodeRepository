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
 链式编程之设置背景图片
 */
- (UIButton *(^)(UIImage *image))cp_backImage;

/**
 链式编程之cornerRadius
 */
- (UIButton *(^)(CGFloat radius))cp_cornerRadius;

/**
 链式编程之borderWidth
 */
- (UIButton *(^)(BOOL isBounds))cp_clipsToBounds;

/**
 链式编程之borderColor
 */
- (UIButton *(^)(UIColor *color))cp_borderColor;

/**
 链式编程之borderWidth
 */
- (UIButton *(^)(CGFloat width))cp_borderWidth;

/**
 链式编程之设置action
 */
- (UIButton *(^)(id object, SEL action))cp_action;

/**
 链式编程之设置tag
 */
- (UIButton *(^)(NSInteger tag))cp_tag;

/**
 链式编程之设置hidden
 */
- (UIButton *(^)(BOOL hidden))cp_hidden;

@end
