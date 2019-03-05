//
//  HomePagePresenter.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "HomePagePresenter.h"


@implementation HomePagePresenter

- (void)FMDB_createTable:(NSString *)DBName {
    
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString *fileName = [doc stringByAppendingPathComponent:@"device.sqlite"];
    NSLog(@"doc = %@", fileName);
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS Device (deviceID text, deviceName text, deviceType integer, deviceStatus integer);"];
        if (result) {
            NSLog(@"创建表成功");
        } else {
            NSLog(@"建表失败");
        }
    }
}

- (FMDatabase *)testDB {
    if (!_testDB) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"doc = %@", doc);
        NSString *fileName = [doc stringByAppendingPathComponent:@"t_student.sqlite"];
        //2.获得数据库
        _testDB = [FMDatabase databaseWithPath:fileName];
    }
    return _testDB;
}

- (NSMutableArray *)animationUrlArray {
    if (!_animationUrlArray) {
        _animationUrlArray = [[NSMutableArray alloc] init];
    }
    return _animationUrlArray;
}

@end
