//
//  HomePagePresenter.h
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import <sqlite3.h>

@interface HomePagePresenter : NSObject

@property (nonatomic, strong) FMDatabase *testDB;
@property (nonatomic, strong) NSMutableArray *animationUrlArray;
@property (nonatomic, strong) NSArray *giftUrlArray;//礼物urla数组
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) NSMutableArray *testArray;//测试数组

/**
 创建新的表

 @param DBName 标的名字
 */
- (void)FMDB_createTable:(NSString *)DBName;

/**
 随机增加礼物动画
 */
- (void)help_addGiftUrlRandom;

- (void)requestInfoWithCallBack:(void (^)(BOOL isSuccess, NSString *errStr))callBack;

@end
