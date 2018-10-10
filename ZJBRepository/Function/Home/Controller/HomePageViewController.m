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
#import <Lottie/Lottie.h>
#import "HomePagePresenter.h"
#import "MDShockBannerView.h"
#import "MDBannerModel.h"

@interface HomePageViewController () <MDShockBannerViewDelegate>

@property (nonatomic, strong) XNGradientView *maxMoneyView;
@property (nonatomic, strong) UIImageView *successImageView;
@property (nonatomic, strong) UIImageView *failImageView;
@property (nonatomic, strong) UILabel *oneLabel;
@property (nonatomic, strong) UILabel *twoLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) JBGravityImageView *moveImageView;
@property (nonatomic, strong) HomePagePresenter *presenter;


@end

@implementation HomePageViewController

#pragma mark - ♻️life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self xn_initData];
    [self xn_initSubViews];
//    [self xn_initCPSubViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark - 🔒private

- (void)xn_initData
{
    self.title = @"首页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        if ([self.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
}

- (void)xn_initSubViews
{
//    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    redButton.cp_title(@"我不喜欢你").cp_font([UIFont systemFontOfSize:15]).cp_titleColor([UIColor redColor]).cp_action(self,@selector(clickAction_add)).cp_backgroundColor([UIColor yellowColor]);
//    self.oneLabel = [UILabel new];
//    self.twoLabel = [UILabel new];
//
//    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:self.oneLabel];
//    [self.view addSubview:self.twoLabel];
//    [self.view addSubview:changeButton];
//    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view).offset(12);
//        make.top.equalTo(self.view).offset(100);
//    }];
//    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.oneLabel.mas_right);
//        make.top.equalTo(self.view).offset(100);
//    }];
//    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(CGSizeMake(200, 100));
//    }];
//    self.oneLabel.cp_font([UIFont systemFontOfSize:15]).cp_text(@"你好").cp_alignment(NSTextAlignmentLeft).cp_textColor([UIColor redColor]);
//    self.twoLabel.cp_font([UIFont systemFontOfSize:15]).cp_text(@"你妹啊").cp_alignment(NSTextAlignmentLeft).cp_textColor([UIColor greenColor]);
//    changeButton.cp_titleColor([UIColor redColor]).cp_font([UIFont systemFontOfSize:15]).cp_title(@"变变变").cp_backgroundColor([UIColor lightGrayColor]).cp_action(self,@selector(clickAction_add));
    
    MDShockBannerView *banner = [[MDShockBannerView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 47 / 75)];
    [self.view addSubview:banner];
    banner.delegate = self;
    banner.pageSelectImage = [UIImage imageNamed:@"home_banner_select"];
    banner.pageUnselectImage = [UIImage imageNamed:@"home_banner_unselect"];
    MDBannerModel *model1 = [[MDBannerModel alloc] init];
    model1.img = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/6265b5b9bf8686f009cf44c366cfa4abd26b1a79.png";
    model1.bgImg = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/9bc42ce40490c854eab2e9969ac8e328caab0a17.png";
    
    MDBannerModel *model2 = [[MDBannerModel alloc] init];
    model2.img = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/16f7ab6124ae4688f0adef43ff3ab3b1f09ccc67.png";
    model2.bgImg = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/81e9ad49cba8dc479a09d146a1fabf4b9ef3504d.png";
    
    
    banner.banners = @[model1,model2];
    banner.backgroundColor = [UIColor greenColor];
    
    
}

- (void)xn_initCPSubViews {
    UIButton *cpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:cpButton];
    [cpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    cpButton.cp_title(@"链式编程").cp_font([UIFont systemFontOfSize:16]).cp_titleColor([UIColor blackColor]).cp_backgroundColor([UIColor yellowColor]).cp_action(self,@selector(clickAction_add));
}

- (void)xn_initSomeSubViews {
    UILabel *firstLabel = [UILabel new];
    UIButton *changgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstLabel];//必须先添加
    [self.view addSubview:changgeButton];
    [firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
    [changgeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(firstLabel);
        make.top.equalTo(firstLabel.mas_bottom).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    [changgeButton addTarget:self action:@selector(clickAction_change:) forControlEvents:UIControlEventTouchUpInside];
    changgeButton.backgroundColor = [UIColor yellowColor];
    [changgeButton setTitle:@"更新约束" forState:UIControlStateNormal];
    [changgeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changgeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    firstLabel.backgroundColor = [UIColor greenColor];
}

- (void)xn_initScorllViewSubViews {
    
    UIButton *changgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIView *contentView = [UIView new];//加个子视图作为内容视图
    UIView *firstView = [UIView new];
    UIView *secondView = [UIView new];
    UIView *ThirdView = [UIView new];
    UIView *forthView = [UIView new];
    UIView *fifthView = [UIView new];
    NSArray *array = [NSArray arrayWithObjects:ThirdView, forthView, fifthView, nil];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:contentView];
    [contentView addSubview:firstView];
    [contentView addSubview:secondView];
    [contentView addSubview:ThirdView];
    [contentView addSubview:forthView];
    [contentView addSubview:fifthView];
    [contentView addSubview:changgeButton];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
//        make.height.equalTo(self.scrollView);
    }];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(contentView).offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(contentView).offset(200);
        make.width.equalTo(firstView).multipliedBy(0.33);
        make.height.equalTo(firstView).multipliedBy(0.88);
    }];
    [changgeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(contentView).offset(740);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    /**
     *  多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
     *
     *  @param axisType        轴线方向
     *  @param fixedSpacing    间隔大小
     *  @param leadSpacing     头部间隔
     *  @param tailSpacing     尾部间隔
     */
    //横向排列 间隔距离固定 array中的元素必须最少要三个
//    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:5 tailSpacing:5];
    
    //横向排列 控件长度固定
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:100 leadSpacing:5 tailSpacing:5];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(300);
        make.height.mas_equalTo(50);
    }];
    
    //纵向排列
//    [array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:50 leadSpacing:280 tailSpacing:200];
//    [array mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(contentView);
//        make.width.mas_equalTo(100);
//    }];

    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(fifthView.mas_bottom).offset(100);
    }];
    
    contentView.backgroundColor = [UIColor lightGrayColor];
    firstView.backgroundColor = [UIColor greenColor];
    secondView.backgroundColor = [UIColor orangeColor];
    ThirdView.backgroundColor = [UIColor redColor];
    forthView.backgroundColor = [UIColor cyanColor];
    fifthView.backgroundColor = [UIColor blueColor];
    [changgeButton addTarget:self action:@selector(clickAction_change:) forControlEvents:UIControlEventTouchUpInside];
    changgeButton.backgroundColor = [UIColor yellowColor];
    [changgeButton setTitle:@"更新约束" forState:UIControlStateNormal];
    [changgeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    changgeButton.titleLabel.font = [UIFont systemFontOfSize:16];
}

- (void)xn_testEncryption {
    NSString *orstr = @"9我就是你大爷大爷的?%&8@#$%!%&*()_+_=-=08";
    NSString *encryptionStr = [JBHelper base64EncodedStringWithStrig:orstr];
    XNLog(@"加密结果:%@",encryptionStr);
    NSString *decStr = [JBHelper base64DecodeDataWithString:encryptionStr];
    XNLog(@"解密结果:%@",decStr);
}


#pragma mark - 🔄overwrite

#pragma mark - 🚪public
- (NSString *)ret32bitString {
    char data[32];
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
}
#pragma mark - 🍐delegate

#pragma mark - ☎️notification

#pragma mark - 🎬event response
- (void)clickAction_add {
    self.oneLabel.text = [self.oneLabel.text stringByAppendingString:@"大坏蛋"];
    NSLog(@"你点击我了!我很不喜欢");
}

- (void)clickAction_change:(UIButton *)sender {
    
    [sender mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    //其实之前写的两条约束还是在的就相当于以下代码
    /**
     [sender mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(firstLabel);
        make.top.equalTo(firstLabel.mas_bottom).offset(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));//只是更新了这个约束
     }];
     但是由于在这里拿不到firstLabel这个对象,所以不能用这个方法
     */
}

- (void)clickBanner:(NSInteger)index {
    NSLog(@"点击了第%ld个banner",index);
}
#pragma mark - ☸getter and setter

- (XNGradientView *)maxMoneyView {
    if (!_maxMoneyView) {
        _maxMoneyView = [[XNGradientView alloc]init];
        _maxMoneyView.statrColor = JB_RGB(0xffe300);
        _maxMoneyView.endColor = JB_RGB(0xff9100);
        _maxMoneyView.shadowColor = JB_ARGB(0xffb618, 0.5);
//        _maxMoneyView.layer.cornerRadius = SX(43);
//        _maxMoneyView.clipsToBounds = YES;
    }
    return _maxMoneyView;
}

- (UIImageView *)successImageView {
    if (!_successImageView) {
        _successImageView = [[UIImageView alloc]init];
    }
    return _successImageView;
}

- (UIImageView *)failImageView {
    if (!_failImageView) {
        _failImageView = [[UIImageView alloc]init];
    }
    return _failImageView;
}

- (JBGravityImageView *)moveImageView {
    if (!_moveImageView) {
        _moveImageView = [[JBGravityImageView alloc]initWithFrame:self.view.bounds];
    }
    return _moveImageView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (HomePagePresenter *)presenter {
    if (!_presenter) {
        _presenter = [[HomePagePresenter alloc]init];
    }
    return _presenter;
}

@end
