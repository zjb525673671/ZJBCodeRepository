//
//  HomeContentView.m
//  ZJBRepository
//
//  Created by zhoujiebing on 2019/4/13.
//  Copyright © 2019 ZJBCode. All rights reserved.
//

#import "HomeContentView.h"

@interface HomeDismissView ()


@end

@implementation HomeDismissView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    self.backgroundColor = JB_ARGB(0x000000, 0.5);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction_dismiss)];
    [self addGestureRecognizer:tap];
}

#pragma mark - 🎬event response

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];

    if(hitView == self){
        XNLog(@"执行了很多遍吗?");
        [self clickAction_dismiss];
        return nil;
    }
//    XNLog(@"Dismiss别人的穿透事件点击了!");
    return hitView;
}

- (void)clickAction_dismiss {
    XNLog(@"消失事件");
    if (self.delegate && [self.delegate respondsToSelector:@selector(delegate_dismissViewDismiss)]) {
        [self.delegate delegate_dismissViewDismiss];
    }
}

#pragma mark - ☸getter and setter

@end

@interface HomeContentView () <HomeDismissViewDelegate>

@property (nonatomic, strong) HomeDismissView *dismissView;
@property (nonatomic, strong) UIButton *firstButton;

@property (nonatomic, strong) UIView *redView;

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation HomeContentView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.dismissView];
    [self addSubview:self.firstButton];
    [self addSubview:self.redView];
    [self addSubview:self.picImageView];
    
    [self.dismissView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(400);
    }];
    [self.firstButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dismissView.mas_bottom);
        make.left.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dismissView.mas_bottom);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dismissView.mas_bottom);
        make.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    self.firstButton.cp_title(@"按钮").cp_font([UIFont jb_regularFontWithSize:18]).cp_titleColor([UIColor blackColor]).cp_action(self,@selector(clickAction_first));
    self.redView.backgroundColor = [UIColor redColor];
    self.picImageView.image = [UIImage imageNamed:@"nav_backImage"];
}

#pragma mark - 🎬event response

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if(hitView == self){
        XNLog(@"自己的穿透事件点击了!");
        return nil;
    }
    XNLog(@"别人的穿透事件点击了!");
    return hitView;
}

- (void)clickAction_first {
    XNLog(@"按钮点击事件");
}

- (void)delegate_dismissViewDismiss {
    [self removeFromSuperview];
}

#pragma mark - ☸getter and setter

- (UIButton *)firstButton {
    if (!_firstButton) {
        _firstButton = [[UIButton alloc] init];
    }
    return _firstButton;
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
    }
    return _redView;
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
    }
    return _picImageView;
}

- (HomeDismissView *)dismissView {
    if (!_dismissView) {
        _dismissView = [[HomeDismissView alloc] init];
        _dismissView.delegate = self;
    }
    return _dismissView;
}

@end
