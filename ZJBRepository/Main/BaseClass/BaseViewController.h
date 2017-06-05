//
//  BaseViewController.h
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 设置导航栏的底部黑线的透明度
 
 @param alpha 透明度
 */
- (void)xn_setBlackLineImageViewAlpha:(CGFloat)alpha;

/**
 设置导航栏的颜色
 
 @param color 颜色值
 */
- (void)xn_setNavigationBarColor:(UIColor *)color;

/**
 设置导航栏的标题的字体和颜色
 
 @param font 字体大小
 @param color 颜色值
 */
- (void)xn_setNavigationTitleWithFont:(UIFont *)font color:(UIColor *)color;

/**
 设置导航栏右边主题
 
 @param rightTitle 主题名字
 */
- (void)xn_setNavigationBarRightItemTitle:(NSString *)rightTitle;

/**
 设置导航栏状态颜色
 
 @param color 颜色
 */
- (void)xn_setStatusBarBackgroundColor:(UIColor *)color;

/**
 返回按钮事件
 */
- (void)leftBtnItemAction;

/**
 右边主题按钮事件
 */
- (void)rightBarButtonAction;

@end
