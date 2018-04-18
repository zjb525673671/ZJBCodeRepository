//
//  HomePageViewController.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "HomePageViewController.h"
#import "XNGradientView.h"
#import "JBGravityImageView.h"

@interface HomePageViewController ()

@property (nonatomic, strong) XNGradientView *maxMoneyView;
@property (nonatomic, strong) UIImageView *successImageView;
@property (nonatomic, strong) UIImageView *failImageView;
@property (nonatomic, strong) JBGravityImageView *moveImageView;

@end

@implementation HomePageViewController

#pragma mark - ♻️life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self xn_initData];
    [self xn_initSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark - 🔒private

- (void)xn_initData
{
    self.title = @"首页";
    
}

- (void)xn_initSubViews
{
    [self.view addSubview:self.moveImageView];
    self.moveImageView.image = [UIImage imageNamed:@"login_back_image "];
    [self.moveImageView startAnimate];
//    [self.view addSubview:self.maxMoneyView];
//    [self.view addSubview:self.successImageView];
//    [self.view addSubview:self.failImageView];
//    [self.maxMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(SX(-8));
//        make.top.equalTo(self.view).offset(SX(66));
//        make.size.mas_equalTo(CGSizeMake(SX(86), SX(86)));
//    }];
//    [self.maxMoneyView updateMaxMoney:@"1500"];
//    [self.successImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(SX(100));
//        make.top.equalTo(self.view).offset(SX(100));
//        make.size.mas_equalTo(CGSizeMake(SX(200), SX(200)));
//    }];
//    [self.failImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(SX(100));
//        make.top.equalTo(self.view).offset(SX(350));
//        make.size.mas_equalTo(CGSizeMake(SX(200), SX(200)));
//    }];
//    [self xn_successAnimation];
//
//    self.failImageView.animationImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"getMoney01"],
//                                          [UIImage imageNamed:@"getMoney02"],
//                                          [UIImage imageNamed:@"getMoney03"],
//                                          [UIImage imageNamed:@"getMoney04"],
//                                          [UIImage imageNamed:@"getMoney05"],
//                                          [UIImage imageNamed:@"getMoney06"],
//                                          [UIImage imageNamed:@"getMoney07"],
//                                          [UIImage imageNamed:@"getMoney08"],
//                                          [UIImage imageNamed:@"getMoney09"],
//                                          [UIImage imageNamed:@"getMoney10"],
//                                          [UIImage imageNamed:@"getMoney11"],
//                                          [UIImage imageNamed:@"getMoney12"],
//                                          [UIImage imageNamed:@"getMoney13"],
//                                          [UIImage imageNamed:@"getMoney14"],
//                                          [UIImage imageNamed:@"getMoney15"],
//                                          [UIImage imageNamed:@"getMoney16"],
//                                          [UIImage imageNamed:@"getMoney17"],
//                                          [UIImage imageNamed:@"getMoney18"], nil];
//    self.failImageView.animationDuration = 1.42;
//    self.failImageView.animationRepeatCount = 0;
//    [self.failImageView startAnimating];
//    NSString *str = [self ret32bitString];
//    XNLog(@"这是什么鬼?:%@",str);
//    [self xn_testEncryption];
}

- (void)xn_testEncryption
{
    NSString *orstr = @"9我就是你大爷大爷的?%&8@#$%!%&*()_+_=-=08";
    NSString *encryptionStr = [JBHelper base64EncodedStringWithStrig:orstr];
    XNLog(@"加密结果:%@",encryptionStr);
    NSString *decStr = [JBHelper base64DecodeDataWithString:encryptionStr];
    XNLog(@"解密结果:%@",decStr);
}

- (void)xn_successAnimation
{
    NSArray *imgArray = [NSArray arrayWithObjects:(__bridge id)[UIImage imageNamed:@"getMoney01"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney02"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney03"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney04"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney05"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney06"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney07"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney08"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney09"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney10"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney11"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney12"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney13"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney14"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney15"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney16"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney17"].CGImage,
                                (__bridge id)[UIImage imageNamed:@"getMoney18"].CGImage, nil];
    
    NSArray *timeArray = [NSArray arrayWithObjects:@"0.1",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.2",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07",@"0.07", nil];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    NSMutableArray *times = [[NSMutableArray alloc]init];
    CGFloat currentTime = 0;
    for (NSInteger i = 0; i <timeArray.count; i++)
    {
        [times addObject:[NSNumber numberWithFloat:currentTime/1.42]];
        currentTime += [timeArray[i] floatValue];
    }
    animation.keyTimes = times;
    animation.values = imgArray;
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.repeatCount = HUGE_VAL;
    animation.duration = 1.42;
    [self.successImageView.layer addAnimation:animation forKey:@"woshinimade"];
}
#pragma mark - 🔄overwrite

#pragma mark - 🚪public
- (NSString *)ret32bitString
{
    char data[32];
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
}
#pragma mark - 🍐delegate

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (XNGradientView *)maxMoneyView
{
    if (!_maxMoneyView)
    {
        _maxMoneyView = [[XNGradientView alloc]init];
        _maxMoneyView.statrColor = JB_RGB(0xffe300);
        _maxMoneyView.endColor = JB_RGB(0xff9100);
        _maxMoneyView.shadowColor = JB_ARGB(0xffb618, 0.5);
//        _maxMoneyView.layer.cornerRadius = SX(43);
//        _maxMoneyView.clipsToBounds = YES;
    }
    return _maxMoneyView;
}

- (UIImageView *)successImageView
{
    if (!_successImageView)
    {
        _successImageView = [[UIImageView alloc]init];
    }
    return _successImageView;
}

- (UIImageView *)failImageView
{
    if (!_failImageView)
    {
        _failImageView = [[UIImageView alloc]init];
    }
    return _failImageView;
}

- (JBGravityImageView *)moveImageView
{
    if (!_moveImageView)
    {
        _moveImageView = [[JBGravityImageView alloc]initWithFrame:self.view.bounds];
    }
    return _moveImageView;
}

@end
