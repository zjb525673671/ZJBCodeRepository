//
//  BaseUIWebViewController.m
//  ZJBRepository
//
//  Created by zhoujiebing on 2019/4/15.
//  Copyright © 2019 ZJBCode. All rights reserved.
//

#import "BaseUIWebViewController.h"
#import <VasSonic/Sonic.h>

#import <WebKit/WebKit.h>

@interface BaseUIWebViewController () <SonicSessionDelegate, UIWebViewDelegate,WKNavigationDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation BaseUIWebViewController

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
    XNLog(@"nima");
}


#pragma mark - 🔒private

- (void)xn_initData {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.title = @"用户协议";
//    SonicSessionConfiguration *configuration = [SonicSessionConfiguration new];
//    NSString *linkValue = @"http://assets.kgc.cn/ff7f069b/css/common-min.www.kgc.css?v=e4ecfe82;http://assets.kgc.cn/ff7f069b/css/themes.www.kgc.css?v=612eb426;http://assets.kgc.cn/ff7f069b/css/style.www.kgc.css?v=05d94f84";
//    configuration.customResponseHeaders = @{
//                                            SonicHeaderKeyCacheOffline:SonicHeaderValueCacheOfflineStore,
//                                            SonicHeaderKeyLink:linkValue
//                                            };
//    configuration.enableLocalServer = YES;
//    configuration.supportCacheControl = YES;
//    [[SonicEngine sharedEngine] createSessionWithUrl:self.htmlUrl withWebDelegate:self withConfiguration:configuration];
    [[SonicEngine sharedEngine] createSessionWithUrl:self.htmlUrl withWebDelegate:self];
}

- (void)xn_initSubViews {
//    [self.view addSubview:self.webView];
//    [self.webView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.htmlUrl]]];
    [self.view addSubview:self.wkWebView];
    SonicSession *session = [[SonicEngine sharedEngine] sessionWithWebDelegate:self];
    if (session) {
        [self.wkWebView loadRequest:[SonicUtil sonicWebRequestWithSession:session withOrigin:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.htmlUrl]]]];
    } else {
        [self.wkWebView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.htmlUrl]]];
    }
    
}

#pragma mark - 🔄overwrite

#pragma mark - 🚪public

#pragma mark - 🍐delegate

#pragma mark - - SonicSessionDelegate

- (void)sessionWillRequest:(SonicSession *)session {

}

- (void)session:(SonicSession *)session requireWebViewReload:(NSURLRequest *)request {
    [self.wkWebView loadRequest:request];
}

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.delegate = self;
    }
    return _webView;
}

- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:[[WKWebViewConfiguration alloc] init]];
        _wkWebView.backgroundColor = [UIColor whiteColor];
        _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
        _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
        _wkWebView.scrollView.bounces = NO;
        if (@available(iOS 11.0, *)){
            if ([_webView.scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
                _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
        _wkWebView.navigationDelegate = self;
    }
    return _wkWebView;
}

@end
