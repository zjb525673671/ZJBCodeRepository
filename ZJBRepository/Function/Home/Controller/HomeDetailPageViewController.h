//
//  HomeDetailPageViewController.h
//  ZJBRepository
//
//  Created by zhoujiebing on 2019/5/6.
//  Copyright © 2019 ZJBCode. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HomeDetailPageVCDelegate <NSObject>

@optional

/**
 返回数据
 
 */
- (void)delegate_dismissVCDismiss;

@end

@interface HomeDetailPageViewController : BaseViewController

@property (nonatomic, assign) id <HomeDetailPageVCDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
