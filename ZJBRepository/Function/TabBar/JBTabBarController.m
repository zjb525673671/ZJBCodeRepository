//
//  JBTabBarController.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBTabBarController.h"
#import "BaseNavigationController.h"

@interface JBTabBarController ()

@end

@implementation JBTabBarController

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
    
}

- (void)xn_initSubViews
{
    
}

- (void)addChildControllerWithVcStr:(NSString *)vcStr
                          imageName:(NSString *)imageName
                      selectedImage:(NSString *)selectedImage
                              title:(NSString *)title
                                tag:(NSInteger)tag
{
    Class cls = NSClassFromString(vcStr);
    UIViewController *vc = [[cls alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.tag = tag;
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:JB_RGB(0x323232)} forState:UIControlStateSelected];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:JB_RGB(0xb2b2b2)} forState:UIControlStateNormal];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}
#pragma mark - 🔄overwrite

#pragma mark - 🚪public

#pragma mark - 🍐delegate

#pragma mark - - TableView Delegate and DataSource

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter


@end
