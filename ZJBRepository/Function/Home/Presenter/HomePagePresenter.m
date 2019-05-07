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

- (void)requestInfoWithCallBack:(void (^)(BOOL isSuccess, NSString *errStr))callBack {
    [[JBNetWorkManager shareInstance] requestBaiDuWithCallBack:^(BOOL isSuccess, NSString *errStr) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            callBack(YES, nil);
        });
    }];
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
                         
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004207455.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007371668.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007356372.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555939381521.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555921536355.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007254863.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555830096275.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555672217571.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555672204015.svga",
                         @"http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555671980521.svga",
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
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549976181548.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549958793797.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553782794523.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553855298768.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553843404495.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864364223.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553843424041.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864392416.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1552989127073.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555921573163.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1552989133592.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549963854678.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864431633.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1554189548518.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864466020.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553572294207.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553572286974.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555487350848.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553673139003.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553673126003.png",
 "",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553676464921.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864504806.png",
 "",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553676429109.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864572085.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553676443233.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864600488.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555936507544.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549958206395.png",
 "",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553673139003.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553673126003.png",
 "",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553841549103.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864754526.png",
 "",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553853469966.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864858112.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555989325978.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553857683052.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553864898056.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553857701587.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1553857735114.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555069512412.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555069504461.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555333259405.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555069543046.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555412332075.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555412129996.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555399197500.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555325662971.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555671830220.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555671801282.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555671980521.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555672204015.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555672192214.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555672217571.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555830096275.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555830086178.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007254863.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555830122974.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555921536355.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555921516824.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1555939381521.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007356372.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007346681.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556007371668.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004207455.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004191253.png",
 //////////
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004220826.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004289820.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004267416.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004332993.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004501663.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004488632.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004583570.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004642570.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004627295.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004656511.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004711519.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004701417.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004728377.svga",
 "",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004800181.svga",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004781231.png",
 "http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1556004815086.svga",
 ""
 
 
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
