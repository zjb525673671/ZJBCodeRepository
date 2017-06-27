//
//  XNGradientView.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/27.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "XNGradientView.h"

@interface XNGradientView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation XNGradientView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}
- (void)layoutSubviews
{
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.cornerRadius = self.bounds.size.height/2;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    self.layer.shadowOpacity = 0.7;
    self.layer.cornerRadius = self.bounds.size.height/2;
    if (self.shadowColor)
    {
        self.layer.shadowColor = self.shadowColor.CGColor;
    }
    if (self.isNew)
    {
        self.gradientLayer.startPoint = self.startPoint;
        self.gradientLayer.endPoint = self.endPoint;
    }
    else
    {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);
    }
    if (self.statrColor && self.endColor)
    {
        self.gradientLayer.colors = @[(__bridge id)self.statrColor.CGColor,
                                      (__bridge id)self.endColor.CGColor];
    }
    else
    {
        self.gradientLayer.colors = @[(__bridge id)UIColorFromRGB(0xf63875).CGColor,
                                      (__bridge id)UIColorFromRGB(0xf9603c).CGColor];
    }

    self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
}

- (void)initSubViewsWithMoney:(NSString *)money
{
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"审核额度";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = FontSystemSize(12*ScaleX);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UILabel *moneyLabel = [[UILabel alloc]init];
    moneyLabel.text = money;
    moneyLabel.textColor = [UIColor whiteColor];
    moneyLabel.font = FontSystemSize(24*ScaleX);
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    [self addSubview:moneyLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20*ScaleX);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(17*ScaleX);
    }];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(36*ScaleX);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(29*ScaleX);
    }];
}

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter



- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer)
    {
        _gradientLayer = [[CAGradientLayer alloc]init];
    }
    return _gradientLayer;
}

@end
