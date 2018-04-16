//
//  JBNormalProgressHUD.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBNormalProgressHUD.h"

@interface JBNormalProgressHUD ()

@property (nonatomic, strong) UIView *loadView;
@property (nonatomic, strong) UIImageView *loadImageView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) NSArray *animationArray;
@property (nonatomic, strong) UIWindow *window;

@end

@implementation JBNormalProgressHUD

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)showLoading
{
    [self.window addSubview:self.loadView];
    [self.loadImageView startAnimating];
}

- (void)dismiss
{
    [self.loadImageView stopAnimating];
    [self.loadView removeFromSuperview];
}

- (void)showMessage:(NSString *)message
{
    if (message.length > 0)
    {
        self.messageLabel.text = message;
        CGSize size = [self stringRectWithStr:message];
        UIView *blackView = [[UIView alloc] init];
        blackView.backgroundColor = JB_RGB(0x000000);
        blackView.layer.cornerRadius = SX(8);
        [self.window addSubview:self.backView];
        [self.backView addSubview:blackView];
        [self.backView addSubview:self.messageLabel];
        blackView.frame = CGRectMake(0, 0, size.width + SX(20), size.height + SX(20));
        blackView.center = CGPointMake(MainJBScreenWidth/2.0, MainJBScreenHeight/2.0 - SX(50));
        self.messageLabel.frame = CGRectMake(0, 0, size.width, size.height);
        self.messageLabel.center = CGPointMake(MainJBScreenWidth/2.0, MainJBScreenHeight/2.0 - SX(50));
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.backView removeFromSuperview];
        });
    }
    else
    {
        XNLog(@"传进来的message是空值,请检查!");
    }
}

/**
 根据字符串内容计算出label需要的大小
 
 @param str 字符串
 @return label的大小
 */
- (CGSize)stringRectWithStr:(NSString *)str
{
    self.messageLabel.text = str;
    CGSize size = [self.messageLabel sizeThatFits:CGSizeMake(MainJBScreenWidth - SX(44), MainJBScreenHeight - SX(44))];
    return size;
}

#pragma mark - ☸getter and setter

- (UIWindow *)window
{
    if (!_window)
    {
        _window = [UIApplication sharedApplication].keyWindow;
    }
    return _window;
}

- (UIView *)loadView
{
    if (!_loadView)
    {
        _loadView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //        _loadView.backgroundColor = RGBAColor(0x0000, 0.5);
        [_loadView addSubview:self.loadImageView];
        [self.loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_loadView);
            make.size.mas_equalTo(CGSizeMake(SX(37.5), SX(100)));
        }];
    }
    return _loadView;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel)
    {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = [UIFont jb_regularFontWithSize:SX(16)];
        _messageLabel.clipsToBounds = true;
    }
    return _messageLabel;
}

- (UIImageView *)loadImageView
{
    if (!_loadImageView)
    {
        _loadImageView = [[UIImageView alloc]init];
        _loadImageView.animationImages = self.animationArray;
        _loadImageView.animationDuration = 1.05;
        _loadImageView.animationRepeatCount = 0;
    }
    return _loadImageView;
}

- (UIView *)backView
{
    if (!_backView)
    {
        _backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor clearColor];
    }
    return _backView;
}

- (NSArray *)animationArray
{
    if (!_animationArray)
    {
        _animationArray = [JBHelper help_createImageArrayWithBaseString:@"animation_loading" count:21];
        
    }
    return _animationArray;
}

@end
