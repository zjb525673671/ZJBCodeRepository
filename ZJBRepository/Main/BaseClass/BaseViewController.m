//
//  BaseViewController.m
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/3.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIButton *rightBarButton;

@end

@implementation BaseViewController

#pragma mark - ♻️life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self base_initData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    XNLog(@"ViewCotroller: %@ is dealloc",self);
}
#pragma mark - 🔒private

- (void)base_initData
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18*ScaleX], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    if (self.navigationController.childViewControllers.count > 1)
    {
        [self xn_setLeftBarButtonItemWithImageName:@"navition_back"];
    }
}

- (void)xn_setLeftBarButtonItemWithImageName:(NSString *)imageName
{
    UIImage *backImage = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 0, 10, 18);
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(leftBtnItemAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}
// 找出导航条的黑线view
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews)
    {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView)
        {
            return imageView;
        }
    }
    return nil;
}
#pragma mark - 🔄overwrite

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 🚪public

- (void)xn_setBlackLineImageViewAlpha:(CGFloat)alpha
{
    [self findHairlineImageViewUnder:self.navigationController.navigationBar].alpha = alpha;
}

- (void)xn_setNavigationBarColor:(UIColor *)color
{
    if (color)
    {
        self.navigationController.navigationBar.barTintColor = color;
    }
}

- (void)xn_setNavigationTitleWithFont:(UIFont *)font color:(UIColor *)color
{
    NSMutableDictionary *titleTextAttributesDict = [[NSMutableDictionary alloc]init];
    if (font)
    {
        [titleTextAttributesDict setObject:font forKey:NSFontAttributeName];
    }
    if (color)
    {
        [titleTextAttributesDict setObject:color forKey:NSForegroundColorAttributeName];
    }
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributesDict;
}

- (void)xn_setNavigationBarRightItemTitle:(NSString *)rightTitle
{
    if (rightTitle.length > 0)
    {
        [self.rightBarButton setTitle:rightTitle forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:self.rightBarButton];
    }
    else
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

//设置状态栏颜色
- (void)xn_setStatusBarBackgroundColor:(UIColor *)color
{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

- (void)leftBtnItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonAction
{
    //如果有点击事件需要重写
}

#pragma mark - 🍐delegate

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter

- (UIButton *)rightBarButton
{
    if (!_rightBarButton)
    {
        _rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBarButton.titleLabel.font = FontSystemSize(16*ScaleX);
        [_rightBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightBarButton sizeToFit];
        [_rightBarButton addTarget:self action:@selector(rightBarButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBarButton;
}

@end
