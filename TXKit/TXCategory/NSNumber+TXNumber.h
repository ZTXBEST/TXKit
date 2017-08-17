//
//  NSNumber+TXNumber.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/21.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (TXNumber)
/** 返回自己对应的罗马数字 */
- (NSString *)romanNumber;

/**
  number展示

 @param digit 最大小数位数
 @return 结果
 */
- (NSString*)toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)toDisplayPercentageWithDigit:(NSInteger)digit;


/**
 *  @brief  四舍五入
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)doRoundWithDigit:(NSUInteger)digit;

/**
 *  @brief  取上整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)doCeilWithDigit:(NSUInteger)digit;

/**
 *  @brief  取下整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)doFloorWithDigit:(NSUInteger)digit;




@end
