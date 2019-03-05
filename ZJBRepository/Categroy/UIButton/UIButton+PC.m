//
//  UIButton+PC.m
//  ZJBRepository
//
//  Created by zhoujiebing on 2018/9/17.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "UIButton+PC.h"

@implementation UIButton (PC)

- (void)public_setTitle:(NSString *)title
                   font:(UIFont *)font
             titleColor:(UIColor *)titleColor
        backgroundColor:(UIColor *)backgroundColor
                 target:(id)target
                 action:(SEL)action {
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    self.titleLabel.font = font;
    self.backgroundColor = backgroundColor;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *(^)(NSString *title))cp_title {
    return ^(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *color))cp_titleColor {
    return ^(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIFont *font))cp_font {
    return ^(UIFont *font) {
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(BOOL hidden))cp_hidden {
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

- (UIButton *(^)(UIColor *color))cp_backgroundColor {
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIButton *(^)(NSString *name))cp_imageName {
    return ^(NSString *name) {
        [self setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *image))cp_backImage {
    return ^(UIImage *image) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(id object, SEL action))cp_action {
    return ^(id object, SEL action) {
        [self addTarget:object action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

/**
 链式编程之cornerRadius
 */
- (UIButton *(^)(CGFloat radius))cp_cornerRadius {
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        return self;
    };
}

/**
 链式编程之borderColor
 */
- (UIButton *(^)(UIColor *color))cp_borderColor {
    return ^(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

/**
 链式编程之borderWidth
 */
- (UIButton *(^)(CGFloat width))cp_borderWidth {
    return ^(CGFloat width) {
        self.layer.borderWidth = width;
        return self;
    };
}

- (UIButton *(^)(BOOL isBounds))cp_clipsToBounds {
    return ^(BOOL isBounds) {
        self.clipsToBounds = isBounds;
        return self;
    };
}

- (UIButton *(^)(NSInteger tag))cp_tag {
    return ^(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

@end
