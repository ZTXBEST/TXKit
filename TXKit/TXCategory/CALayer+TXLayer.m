//
//  CALayer+TXLayer.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/20.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "CALayer+TXLayer.h"

@implementation CALayer (TXLayer)
-(void)shake {
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat shakeWidth = 16;
    keyAnimation.values = @[@(-shakeWidth),@(0),@(shakeWidth),@(0),@(-shakeWidth),@(0),@(shakeWidth),@(0)];
    keyAnimation.duration = .1f;
    keyAnimation.repeatCount = 2;
    keyAnimation.removedOnCompletion = YES;
    [self addAnimation:keyAnimation forKey:@"shake"];
}
@end
