//
//  UILabel+JB.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "UILabel+JB.h"

@implementation UILabel (JB)

- (void)jb_text:(NSString *)text
      textColor:(UIColor *)textColor
           font:(UIFont *)font
       aligment:(NSTextAlignment)aligment
{
    if (text)
    {
        self.text = text;
    }
    if (textColor)
    {
        self.textColor = textColor;
    }
    if (font)
    {
        self.font = font;
    }
    self.textAlignment = aligment;
}

- (UILabel *(^)(NSString *text))cp_text {
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *color))cp_textColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(UIFont *font))cp_font {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment alignment))cp_alignment {
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

@end
