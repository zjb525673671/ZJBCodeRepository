//
//  JBGravityImageView.m
//  ZJBRepository
//
//  Created by 周结兵 on 2018/4/18.
//  Copyright © 2018年 ZJBCode. All rights reserved.
//

#import "JBGravityImageView.h"
#import "JBGravityManager.h"

@implementation JBGravityImageView

-(void)startAnimate
{
    float scrollSpeed = (self.frame.size.width - self.frame.size.width)/2/50;
    [JBGravityManager sharedGravity].timeInterval = 0.01;
    
    [[JBGravityManager sharedGravity]startDeviceMotionUpdatesBlock:^(float x, float y, float z) {
        
        [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeDiscrete animations:^{
            
            if (self.frame.origin.x <=0 && self.frame.origin.x >= self.frame.size.width - self.frame.size.width)
            {
                float invertedYRotationRate = y * -1.0;
                
                float interpretedXOffset = self.frame.origin.x + invertedYRotationRate * (self.frame.size.width/[UIScreen mainScreen].bounds.size.width) * scrollSpeed + self.frame.size.width/2;
                
                self.center = CGPointMake(interpretedXOffset, self.center.y);
            }
            
            if (self.frame.origin.x >0)
            {
                self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            }
            if (self.frame.origin.x < self.frame.size.width - self.frame.size.width)
            {
                self.frame = CGRectMake(self.frame.size.width - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            }
        } completion:nil];
        
        
    }];
}

- (void)stopAnimate
{
    [[JBGravityManager sharedGravity] stop];
}

@end
