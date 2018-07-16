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

/**
 创建新的表

 @param DBName 标的名字
 */
- (void)FMDB_createTable:(NSString *)DBName;

@end
