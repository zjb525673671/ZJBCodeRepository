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

- (UIButton *(^)(id object, SEL action))cp_action {
    return ^(id object, SEL action) {
        [self addTarget:object action:action forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

@end
