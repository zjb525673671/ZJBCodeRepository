//
//  JBCycleBannerView.h
//  ZJBRepository
//
//  Created by zhoujiebing on 2018/9/19.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JBCycleBannerViewDelegate <NSObject>

/**
 点击的第几个banner事件

 @param index 第几个
 */
- (void)clickActionCycleBanner_index:(NSInteger)index;

@end

@interface JBCycleBannerView : UIView

/**
 当前位置的banner小点图片
 */
@property(nonatomic, strong) UIImage *pageSelectImage;

/**
 其他的小圆点图片
 */
@property(nonatomic, strong) UIImage *pageUnselectImage;

/**
 代理
 */
@property (nonatomic, weak) id <JBCycleBannerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
