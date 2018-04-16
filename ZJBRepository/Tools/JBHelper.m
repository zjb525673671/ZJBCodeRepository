//
//  JBHelper.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBHelper.h"

@implementation JBHelper

+ (NSArray *)help_createImageArrayWithBaseString:(NSString *)baseString count:(NSInteger)count
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < count; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%ld",baseString,i+1]];
        [imageArray addObject:image];
    }
    return [imageArray copy];
}

@end
