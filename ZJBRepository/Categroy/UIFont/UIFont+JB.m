//
//  UIFont+JB.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "UIFont+JB.h"

@implementation UIFont (JB)

+ (UIFont *)jb_semiFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
    if (!font)
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)jb_lightFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
    if (!font)
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)jb_regularFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (!font)
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)jb_mediumFontWithSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (!font)
    {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

@end
