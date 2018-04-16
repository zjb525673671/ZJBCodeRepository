//
//  CALayer+JB.h
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/*
 *  动画类型
 */
typedef enum {
    TransitionAnimTypeRippleEffect = 0, //水波纹
    TransitionAnimTypeSuckEffect,       //吸走
    TransitionAnimTypePageCurl,         //翻开书本效果
    TransitionAnimTypeOglFlip,          //正反翻转
    TransitionAnimTypeCube,             //正方体
    TransitionAnimTypeReveal,           //push推开
    TransitionAnimTypePageUnCurl,       //合上书本
    TransitionAnimTypeFade,             //渐渐的出现
    TransitionAnimTypeRamdom,           //随机以上的任一种
}TransitionAnimType;

/*
 *  动画方向
 */
typedef enum {
    TransitionSubtypesFromTop = 0,      //从上
    TransitionSubtypesFromLeft,         //从左
    TransitionSubtypesFromBotoom,       //从下
    TransitionSubtypesFromRight,        //从右
    TransitionSubtypesFromRamdom,       //随机
}TransitionSubType;


/*
 *  动画曲线
 */
typedef enum {
    TransitionCurveDefault,             //默认
    TransitionCurveEaseIn,              //缓进
    TransitionCurveEaseOut,             //缓出
    TransitionCurveEaseInEaseOut,       //缓进缓出
    TransitionCurveLinear,              //线性
    TransitionCurveRamdom,              //随机
}TransitionCurve;

@interface CALayer (JB)

/**
 转场动画
 
 @param animType 转场动画类型
 @param subType 转动动画方向
 @param curve 转动动画曲线
 @param duration 转动动画时长
 @return 转场动画实例
 */
- (CATransition *)transitionWithAnimType:(TransitionAnimType)animType
                                 subType:(TransitionSubType)subType
                                   curve:(TransitionCurve)curve
                                duration:(CGFloat)duration;

@end
