//
//  XNHelper.h
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/15.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface XNHelper : NSObject

/**
 防止字典添加空对象
 
 @param xDic 字典
 @param i 对象
 @param key key
 */
+ (void)xDic:(NSMutableDictionary *)xDic setObj:(id)i forKey:(NSString*)key;

/**
 防止数组添加空对象
 
 @param xArray 数组
 @param i 对象
 */
+ (void)xArray:(NSMutableArray *)xArray addObject:(id)i;

/**
 16进制颜色带透明度
 
 @param hex 如0x2b2b2b
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)xn_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

/**
 给label设置各种属性
 
 @param label 对象
 @param title text
 @param font 字体
 @param aligment 位置
 @param color 颜色
 */
+ (void)xn_Label:(UILabel *)label title:(NSString *)title font:(UIFont *)font aligment:(NSTextAlignment)aligment textColor:(UIColor *)color;

/**
 绘制虚线
 
 @param lineView 被绘制的View
 @param lineLength 每段虚线长度
 @param lineSpacing 间隔
 @param lineColor 虚线颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 获取IP地址(WiFi)
 
 @return IP地址
 */
+ (NSString *)deviceIPAdress;

/**
 获取WiFi,4G等网络下ip
 
 @param preferIPv4 YES
 @return IP地址
 */
+ (NSString *)getIPAddress:(BOOL)preferIPv4;

/**
 写入日历事件
 
 @param title 主题
 @param startDate 开始日期
 @param callBack 回调
 */
+ (void)writeEventToSystemCalendarWithTitle:(NSString *)title startDate:(NSString *)startDate callBack:(void(^)(BOOL isSuccess, NSString *eMsg))callBack;
@end
