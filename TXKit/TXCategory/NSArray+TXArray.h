//
//  NSArray+TXArray.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/20.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TXArray)
/**
 反转数组
 
 @return 完成反转的数组
 */
- (NSArray *)tx_reverseArray;

@end


@interface NSMutableArray (TXMutableArray)

-(void)addObjectSafe:(id)anObject;
-(void)insertObjectAtFirst:(id)anObject;

@end
