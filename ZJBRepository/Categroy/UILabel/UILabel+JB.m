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

@end
