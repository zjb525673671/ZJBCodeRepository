//
//  HomePagePresenter.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "HomePagePresenter.h"
#import <SVGAPlayer/SVGA.h>

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

- (void)help_addGiftUrlRandom {
//    NSInteger index = arc4random()%self.giftUrlArray.count;
//    if (index < self.giftUrlArray.count) {
//        NSString *url = self.giftUrlArray[index];
//        [self.animationUrlArray addObject:url];
//    }
    if (self.selectIndex < self.giftUrlArray.count) {
        NSString *url = self.giftUrlArray[self.selectIndex];
        [self.animationUrlArray addObject:url];
        self.selectIndex ++;
    } else {
        self.selectIndex = 0;
        [self help_addGiftUrlRandom];
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

//http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549963880616.svga
//http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742607853.svga
//http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742411015.svga
//http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742531055.svga
- (NSMutableArray *)animationUrlArray {
    if (!_animationUrlArray) {
        _animationUrlArray = [[NSMutableArray alloc] init];
    }
    return _animationUrlArray;
}


- (NSArray *)giftUrlArray {
    if (!_giftUrlArray) {
        _giftUrlArray = [[NSArray alloc] initWithObjects:
                         @"https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true",
                         @"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true",
                         @"https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true",
                         @"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true",
                         @"https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true",
                         nil];
    }
    return _giftUrlArray;
}

- (NSMutableArray *)testArray {
    if (!_testArray) {
        _testArray = [[NSMutableArray alloc] init];
    }
    return _testArray;
}

/**
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550726560876.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550921459022.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550728963888.svga",
 "",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550726672313.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550726658892.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550728993071.svga",
 "",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550727045184.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550727026031.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729020653.svga",
 "",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550728307323.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550728294594.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550749467466.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550732925905.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729170650.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729157470.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729181120.svga",
 "",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729978629.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729950613.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550749412387.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550729932394.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730379394.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730371599.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730387755.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730346414.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730666166.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550730654096.png",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550749446681.svga",
 "http://qingyin-real.oss-cn-shanghai.aliyuncs.com/gift/image/1550732820950.png"
 */

@end
