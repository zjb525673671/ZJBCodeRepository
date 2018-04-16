//
//  CALayer+JB.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/16.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "CALayer+JB.h"

@implementation CALayer (JB)

- (CATransition *)transitionWithAnimType:(TransitionAnimType)animType
                                 subType:(TransitionSubType)subType
                                   curve:(TransitionCurve)curve
                                duration:(CGFloat)duration
{
    NSString *key = @"transition";
    if([self animationForKey:key]!=nil){
        [self removeAnimationForKey:key];
    }
    CATransition *transition = [CATransition animation];
    //动画时长
    transition.duration = duration;
    //动画类型
    transition.type = [self animaTypeWithTransitionType:animType];
    //动画方向
    transition.subtype = [self animaSubtype:subType];
    //缓动函数
    transition.timingFunction = [CAMediaTimingFunction functionWithName:[self curve:curve]];
    //完成动画删除
    transition.removedOnCompletion = YES;
    [self addAnimation:transition forKey:key];
    return transition;
}

/*
 *  返回动画曲线
 */
- (NSString *)curve:(TransitionCurve)curve
{
    //曲线数组
    NSArray *funcNames = @[kCAMediaTimingFunctionDefault,
                           kCAMediaTimingFunctionEaseIn,
                           kCAMediaTimingFunctionEaseInEaseOut,
                           kCAMediaTimingFunctionEaseOut,
                           kCAMediaTimingFunctionLinear];
    return [self objFromArray:funcNames index:curve isRamdom:(TransitionCurveRamdom == curve)];
}

/*
 *  返回动画方向
 */
- (NSString *)animaSubtype:(TransitionSubType)subType
{
    //设置转场动画的方向
    NSArray *subtypes = @[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    return [self objFromArray:subtypes index:subType isRamdom:(TransitionSubtypesFromRamdom == subType)];
}

/*
 *  返回动画类型
 */
- (NSString *)animaTypeWithTransitionType:(TransitionAnimType)type
{
    //设置转场动画的类型
    NSArray *animArray = @[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl",@"kCATransitionFade"];
    return [self objFromArray:animArray index:type isRamdom:(TransitionAnimTypeRamdom == type)];
}

/*
 *  统一从数据返回对象
 */
- (id)objFromArray:(NSArray *)array index:(NSUInteger)index isRamdom:(BOOL)isRamdom
{
    NSUInteger count = array.count;
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}

@end
