//
//  XNGradientView.h
//  ZJBRepository
//
//  Created by 周结兵 on 2017/6/27.
//  Copyright © 2017年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNGradientView : UIView

@property (nonatomic, assign) BOOL isNew;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, strong) UIColor *statrColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

- (void)initSubViewsWithMoney:(NSString *)money;
@end
