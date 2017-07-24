//
//  NSArray+TXArray.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/20.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "NSArray+TXArray.h"

@implementation NSArray (TXArray)
- (NSArray *)tx_reverseArray {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    
    return arrayTemp;
}
@end

@implementation NSMutableArray (TXMutableArray)

-(void)addObjectSafe:(id)anObject{
    if (anObject==nil) {
        [self addObject:[NSNull null]];
    }
    else{
        [self addObject:anObject];
    }
}

-(void)insertObjectAtFirst:(id)anObject{
    if (self.count>0) {
        [self insertObject:anObject atIndex:0];
    }
    else{
        [self addObject:anObject];
    }
}

@end
