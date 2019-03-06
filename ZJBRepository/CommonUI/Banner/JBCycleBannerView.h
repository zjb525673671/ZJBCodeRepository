//
//  JBCycleBannerView.h
//  ZJBRepository
//
//  Created by zhoujiebing on 2018/9/19.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    JBBannerSrollDirectionUnknow,
    JBBannerSrollDirectionLeft,
    JBBannerSrollDirectionRight,
} JBBannerSrollDirection;

@interface JBCycleBannerModel : NSObject

@property (nonatomic, copy) NSString *topImageUrl;//上层图片
@property (nonatomic, copy) NSString *bottomImageUrl;//下层图片
@property (nonatomic, copy) NSString *jumpUrl;//跳转链接

@end


@protocol JBCycleBannerViewDelegate <NSObject>

@optional

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
 图片链接
 */
@property (nonatomic, strong) NSArray *bannerModelArray;

/**
 代理
 */
@property (nonatomic, weak) id <JBCycleBannerViewDelegate> delegate;



@end
