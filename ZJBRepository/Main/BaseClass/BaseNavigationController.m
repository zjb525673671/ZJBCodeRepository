//
//  BaseNavigationController.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/17.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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

#pragma mark - 🔄overwrite

#pragma mark - 🚪public

#pragma mark - 🍐delegate

#pragma mark - - TableView Delegate and DataSource

#pragma mark - ☎️notification

#pragma mark - 🎬event response

#pragma mark - ☸getter and setter


@end
