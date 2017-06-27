//
//  HomePageViewController.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "HomePageViewController.h"
#import "XNGradientView.h"

@interface HomePageViewController ()

@property (nonatomic, strong) XNGradientView *maxMoneyView;

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
    [self.view addSubview:self.maxMoneyView];
    [self.maxMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-8*ScaleX);
        make.top.equalTo(self.view).offset(66*ScaleX);
        make.size.mas_equalTo(CGSizeMake(86*ScaleX, 86*ScaleX));
    }];
    [self.maxMoneyView initSubViewsWithMoney:@"1500"];
}

#pragma mark - 🔄overwrite

#pragma mark - 🚪public

#pragma mark - 🍐delegate

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (XNGradientView *)maxMoneyView
{
    if (!_maxMoneyView)
    {
        _maxMoneyView = [[XNGradientView alloc]init];
        _maxMoneyView.statrColor = UIColorFromRGB(0xffe300);
        _maxMoneyView.endColor = UIColorFromRGB(0xff9100);
        _maxMoneyView.shadowColor = UIColorFromARGB(0xffb618, 0.5);
//        _maxMoneyView.layer.cornerRadius = 43*ScaleX;
//        _maxMoneyView.clipsToBounds = YES;
    }
    return _maxMoneyView;
}

@end
