//
//  JBNormalProgressHUD.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBNormalProgressHUD : NSObject

+ (instancetype)sharedInstance;

/**
 loading框显示
 */
- (void)showLoading;

/**
 loading框消失
 */
- (void)dismiss;

/**
 展示tips信息 会根据信息内容设置具体大小
 
 @param message 信息
 */
- (void)showMessage:(NSString *)message;


@end
