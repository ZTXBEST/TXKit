//
//  UILabel+TXLabel.h
//  TXKit
//
//  Created by 赵天旭 on 2017/8/17.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TXLabel)

-(void)sizeThatFitsWithWidth;
-(void)sizeThatFitsWithHeight;
-(void)sizeThatFitsUnderWidth;
-(void)sizeThatFitsUnderHeight;

/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;

/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end
