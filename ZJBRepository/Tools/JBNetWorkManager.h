//
//  JBNetWorkManager.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/6/27.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBNetWorkManager : NSObject

+ (JBNetWorkManager *)shareInstance;

- (void)requestBaiDuWithCallBack:(void (^)(BOOL isSuccess, NSString *errStr))callBack;
@end
