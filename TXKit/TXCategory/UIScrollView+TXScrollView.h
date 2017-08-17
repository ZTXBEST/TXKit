//
//  UIScrollView+TXScrollView.h
//  TXKit
//
//  Created by 赵天旭 on 2017/8/17.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (TXScrollView)

- (void)scrollToTop;


- (void)scrollToBottom;


- (void)scrollToLeft;


- (void)scrollToRight;


- (void)scrollToTopAnimated:(BOOL)animated;


- (void)scrollToBottomAnimated:(BOOL)animated;


- (void)scrollToLeftAnimated:(BOOL)animated;


- (void)scrollToRightAnimated:(BOOL)animated;


@end
