//
//  AppDelegate+TXAppdelegate.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (TXAppdelegate)

/** 当前的navigationController */
@property(nonatomic,weak,readonly)UINavigationController *currentNav;

/** topVC */
@property(nonatomic,weak,readonly)UIViewController *topVC;

+ (AppDelegate *)shared;

/** 寻找Navigation中的某个viewcontroler */
- (id)findViewController:(Class)className;

/** currentNav的 RootViewController */
- (UIViewController *)rootViewController;

/** present viewcontroler */
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)(void))completion;

/** push viewcontroler */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/** 以某种动画形式push */
- (void)pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;

/** pop viewcontroler */
- (void)popViewControllerAnimated:(BOOL)animated;

/** pop指定的viewcontroler */
- (NSArray *)popToViewControllerWithClassName:(Class)className animated:(BOOL)animated;

/** popToRootViewController */
- (void)popToRootViewControllerAnimated:(BOOL)animated;

/**以某种动画形式pop */
- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition;



@end
