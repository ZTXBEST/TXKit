//
//  UIControl+TXControl.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

static char OperationKey;

@interface UIControl (TXControl)
//点击事件之后的动作
- (void)onClick:(void(^)(id sender))handler;
- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;
@end
