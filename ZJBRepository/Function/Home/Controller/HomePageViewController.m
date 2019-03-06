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
#import "JBCycleBannerView.h"
#import <SVGAPlayer/SVGA.h>
#import "WHDebugToolManager.h"

@interface HomePageViewController () <JBCycleBannerViewDelegate,MDShockBannerViewDelegate,SVGAPlayerDelegate>

@property (nonatomic, strong) XNGradientView *maxMoneyView;
@property (nonatomic, strong) UIImageView *successImageView;
@property (nonatomic, strong) UIImageView *failImageView;
@property (nonatomic, strong) UILabel *oneLabel;
@property (nonatomic, strong) UILabel *twoLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) JBGravityImageView *moveImageView;
@property (nonatomic, strong) HomePagePresenter *presenter;

//动画
@property (nonatomic, strong) UILabel *showLabel;//展示动画第几个
@property (nonatomic, strong) SVGAPlayer *animationPlayer;//动画播放器
@property (nonatomic, strong) SVGAParser *parser;//缓存播放
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSTimer *timer;


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
    [[WHDebugToolManager sharedInstance] toggleWith: DebugToolTypeAll];
    self.title = @"首页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        if ([self.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    for (NSInteger i = 0; i < self.presenter.giftUrlArray.count; i++) {
        NSString *urlStr = self.presenter.giftUrlArray[i];
        [self.parser parseWithURL:[NSURL URLWithString:urlStr] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
            XNLog(@"预加载好了第几个=%zd",i);
        } failureBlock:^(NSError * _Nullable error) {
        }];
    }
//    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timer_request) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)xn_initSubViews
{
    self.animationPlayer.frame = CGRectMake(0, 0, MainJBScreenWidth, MainJBScreenWidth);
    [self.view addSubview:self.animationPlayer];
    [self.view addSubview:self.showLabel];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.centerX.equalTo(self.view);
    }];
    self.showLabel.cp_font([UIFont jb_regularFontWithSize:24]).cp_alignment(NSTextAlignmentCenter).cp_textColor([UIColor redColor]);
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:playButton];
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-50);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    playButton.cp_font([UIFont jb_regularFontWithSize:18]).cp_title(@"发送礼物").cp_titleColor([UIColor blackColor]).cp_action(self,@selector(clickAction_playAnimation:));
    playButton.cp_cornerRadius(25).cp_borderWidth(1).cp_borderColor([UIColor redColor]);
    
    
//    JBCycleBannerView *banner = [[JBCycleBannerView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.width * 47 / 75)];
//    [self.view addSubview:banner];
//    banner.delegate = self;
//
//    JBCycleBannerModel *model1 = [[JBCycleBannerModel alloc] init];
//    model1.topImageUrl = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/6265b5b9bf8686f009cf44c366cfa4abd26b1a79.png";
//    model1.bottomImageUrl = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/9bc42ce40490c854eab2e9969ac8e328caab0a17.png";
//
//    JBCycleBannerModel *model2 = [[JBCycleBannerModel alloc] init];
//    model2.topImageUrl = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/16f7ab6124ae4688f0adef43ff3ab3b1f09ccc67.png";
//    model2.bottomImageUrl = @"http://md-juhe.oss-cn-hangzhou.aliyuncs.com/upload/ad/20180417/81e9ad49cba8dc479a09d146a1fabf4b9ef3504d.png";
//    banner.bannerModelArray = @[model1,model2];
    
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

- (void)svgaPlayerDidFinishedAnimation:(SVGAPlayer *)player {
    self.currentIndex ++;
    [self help_playWithIndex:self.currentIndex];
}
#pragma mark - ☎️notification

#pragma mark - 🎬event response

- (void)timer_request {
    for (NSInteger i = 0; i < 100; i ++) {
        [self.presenter.testArray addObject:@"你们的APP在我这呢"];
    }
    XNLog(@"时间Log发出的时间!");
}

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

- (void)clickAction_playAnimation:(UIButton *)sender {
    //http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1549963880616.svga
    //http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742607853.svga
    //http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742411015.svga
    //http://voice-oss.oss-cn-shanghai.aliyuncs.com/gift/image/1550742531055.svga
    [self.presenter help_addGiftUrlRandom];
    self.showLabel.text = [NSString stringWithFormat:@"总共%zd个礼物,正在播放第%zd礼物",self.presenter.animationUrlArray.count,self.currentIndex + 1];
    if (!self.isPlaying) {
        self.isPlaying = YES;
        [self help_playWithIndex:0];
    }
}

- (void)help_playWithIndex:(NSInteger)index {
    if (index < self.presenter.animationUrlArray.count) {
        NSString *urlStr = self.presenter.animationUrlArray[index];
        XNLog(@"准备播放");
        [self.parser parseWithURL:[NSURL URLWithString:urlStr] completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
            XNLog(@"开始播放");
            if (videoItem) {
                self.showLabel.hidden = NO;
                self.showLabel.text = [NSString stringWithFormat:@"总共%zd个礼物,正在播放第%zd礼物",self.presenter.animationUrlArray.count,self.currentIndex + 1];
                self.animationPlayer.videoItem = videoItem;
                [self.animationPlayer startAnimation];
                self.animationPlayer.loops = 1;
            } else {
                self.showLabel.hidden = YES;
                self.currentIndex ++;
            }
        } failureBlock:^(NSError * _Nullable error) {
            XNLog(@"播放错误!");
            self.showLabel.hidden = YES;
            self.currentIndex ++;
            [self help_playWithIndex:self.currentIndex];
        }];
    } else {
        self.showLabel.hidden = YES;
        [self.presenter.animationUrlArray removeAllObjects];
        self.currentIndex = 0;
        self.isPlaying = NO;
    }
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

- (SVGAPlayer *)animationPlayer {
    if (!_animationPlayer) {
        _animationPlayer = [[SVGAPlayer alloc] init];
        _animationPlayer.delegate = self;
        _animationPlayer.clearsAfterStop = YES;
    }
    return _animationPlayer;
}

- (SVGAParser *)parser {
    if (!_parser) {
        _parser = [[SVGAParser alloc] init];
    }
    return _parser;
}

- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
    }
    return _showLabel;
}

@end
