//
//  HomeContentView.h
//  ZJBRepository
//
//  Created by zhoujiebing on 2019/4/13.
//  Copyright © 2019 ZJBCode. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeDismissViewDelegate <NSObject>

@optional

/**
 消失
 
 */
- (void)delegate_dismissViewDismiss;

@end

@interface HomeContentView : UIView

@end


@interface HomeDismissView : UIView

@property (nonatomic, weak) id <HomeDismissViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
