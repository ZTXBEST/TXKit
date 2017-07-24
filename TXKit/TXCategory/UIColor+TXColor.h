//
//  UIColor+TXColor.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/20.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (TXColor)
/**
 * 使用16进制数字创建颜色
 */
+ (instancetype)tx_colorWithHex:(uint32_t)hex;

/**
 * 随机颜色
 */
+ (instancetype)tx_randomColor;

/**
 * RGB颜色
 */
+ (instancetype)tx_colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

/**
 十六进制字符串显示颜色
 
 @param color 十六进制字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)tx_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 *  @brief  渐变颜色
 *
 *  @param fromColor  开始颜色
 *  @param toColor    结束颜色
 *  @param height     渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)tx_gradientFromColor:(UIColor*)fromColor toColor:(UIColor*)toColor withHeight:(CGFloat)height;
@end
