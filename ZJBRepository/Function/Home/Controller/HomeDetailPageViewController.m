//
//  HomeDetailPageViewController.m
//  ZJBRepository
//
//  Created by zhoujiebing on 2019/5/6.
//  Copyright © 2019 ZJBCode. All rights reserved.
//

#import "HomeDetailPageViewController.h"
#import "HomePageHeadView.h"
#import "HomePagePresenter.h"

@interface HomeDetailPageViewController ()

@property (nonatomic, strong) HomePagePresenter *presenter;
@property (nonatomic, strong) HomePageHeadView *testView;
@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation HomeDetailPageViewController

#pragma mark - ♻️life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xn_initData];
    [self xn_initSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)dealloc {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [_testView public_changeTextColor];
//        XNLog(@" _testView = %@",_testView);
//    });
}

#pragma mark - 🔒private

- (void)xn_initData {
    self.title = @"内存引用";
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self test2_cycle];
}

- (void)test_cycle {
    XNLog(@"刚开始进来的");
    __weak typeof(self) wSelf = self;
    [[JBNetWorkManager shareInstance] requestBaiDuWithCallBack:^(BOOL isSuccess, NSString *errStr) {
        XNLog(@"回来的时候");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            XNLog(@"1秒之后执行");
            [wSelf.testView public_changeTextColor];
            [wSelf test_cycle];
        });
    }];
}

- (void)test2_cycle {
    XNLog(@"刚开始进来的");
    __weak typeof(self) wSelf = self;
    [self.presenter requestInfoWithCallBack:^(BOOL isSuccess, NSString *errStr) {
        XNLog(@"回来的时候");
        [wSelf.testView public_changeTextColor];
        [wSelf test2_cycle];
    }];
}

- (void)xn_initSubViews {
    _testView = [[HomePageHeadView alloc] init];
    [self.view addSubview:_testView];
    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    UIButton *leaveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:leaveButton];
    [leaveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    leaveButton.cp_font([UIFont jb_regularFontWithSize:18]).cp_title(@"返回上一页").cp_titleColor([UIColor blackColor]).cp_action(self, @selector(clickAction_goBack));
}

#pragma mark - 🔄overwrite

#pragma mark - 🚪public

#pragma mark - 🍐delegate

#pragma mark - - TableView Delegate and DataSource

#pragma mark - ☎️notification

#pragma mark - 🎬event response

- (void)clickAction_goBack {
    [self.navigationController popViewControllerAnimated:YES];
    if ([self.delegate respondsToSelector:@selector(delegate_dismissVCDismiss)]) {
        [self.delegate delegate_dismissVCDismiss];
    }
}

#pragma mark - ☸getter and setter

- (HomePagePresenter *)presenter {
    if (!_presenter) {
        _presenter = [[HomePagePresenter alloc] init];
    }
    return _presenter;
}

@end
