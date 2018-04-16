//
//  JBBaseTabBar.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBBaseTabBar.h"

@interface JBBaseTabBar ()

@property (nonatomic, strong) NSArray *animationArray;
@property (nonatomic, strong) NSArray *animationBPageArray;
@property (nonatomic, strong) UIImageView *selectedImageView;

@end

@implementation JBBaseTabBar

#pragma mark - ♻️life cycle

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIControl *tabBarButton in self.subviews)
    {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - 🔒private


#pragma mark - 🎬event response

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    NSInteger index = [self.subviews indexOfObject:tabBarButton];
    XNLog(@"itmeindex = %ld",index);
    for (UIImageView *imageView in tabBarButton.subviews)
    {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            if (self.selectedImageView)
            {
                [self.selectedImageView stopAnimating];
                self.selectedImageView.animationImages = nil;
            }
            imageView.animationImages = self.animationArray[index - 1];
            imageView.animationDuration = 0.2;
            imageView.animationRepeatCount = 1;
            [imageView startAnimating];
            self.selectedImageView = imageView;
        }
    }
}


#pragma mark - ☸getter and setter

- (NSArray *)animationArray
{
    if (!_animationArray)
    {
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_home_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_score_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_okami_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_me_gif" count:6]];
        _animationArray = [NSArray arrayWithArray:mArray];
    }
    return _animationArray;
}

- (NSArray *)animationBPageArray
{
    if (!_animationBPageArray)
    {
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_home_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_okami_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_score_gif" count:6]];
        [mArray addObject:[JBHelper help_createImageArrayWithBaseString:@"tabbar_me_gif" count:6]];
        _animationBPageArray = [NSArray arrayWithArray:mArray];
    }
    return _animationBPageArray;
}

@end
