//
//  HomePageHeadView.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "HomePageHeadView.h"

@interface HomePageHeadView ()

@property (nonatomic, strong) UILabel *itemLabel;

@end

@implementation HomePageHeadView

#pragma mark - ♻️life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    _itemLabel = [[UILabel alloc] init];
    [self addSubview:_itemLabel];
    [_itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    _itemLabel.cp_text(@"顶部").cp_font([UIFont jb_regularFontWithSize:16]).cp_alignment(NSTextAlignmentCenter).cp_textColor([UIColor redColor]);
}

- (void)public_changeTextColor {
    _itemLabel.textColor = [UIColor blackColor];
}

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter


@end
