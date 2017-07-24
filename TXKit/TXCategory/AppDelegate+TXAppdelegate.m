//
//  AppDelegate+TXAppdelegate.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "AppDelegate+TXAppdelegate.h"

@implementation AppDelegate (TXAppdelegate)

+ (AppDelegate *)shared {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (id)findViewController:(Class)className {
    for (UIViewController *vc in self.currentNav.viewControllers) {
        if ([vc isKindOfClass:className]) {
            return vc;
        }
    }
    return nil;
}


- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void(^)(void))completion {
    [self.topVC presentViewController:viewController animated:animated completion:completion];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.currentNav pushViewController:viewController animated:YES];
}

- (void)pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:nil];
    [self.currentNav pushViewController:controller animated:NO];
    [UIView setAnimationDuration:.5f];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.currentNav.view cache:YES];
    [UIView commitAnimations];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [self.currentNav popViewControllerAnimated:YES];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated {
    [self.currentNav popToRootViewControllerAnimated:YES];
}

- (NSArray *)popToViewControllerWithClassName:(Class)className animated:(BOOL)animated {
    return [self.currentNav popToViewController:[self findViewController:className] animated:YES];
}

- (UIViewController *)popViewControllerWithTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    UIViewController *controller = [self.currentNav popViewControllerAnimated:NO];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.currentNav.view cache:YES];
    [UIView commitAnimations];
    return controller;
}

- (UIViewController *)rootViewController {
    if (self.currentNav.viewControllers && self.currentNav.viewControllers.count>0) {
        return self.currentNav.viewControllers.firstObject;
    }
    return nil;
}

-(UIViewController *)topVC{
    if ([self.currentNav isKindOfClass:[UINavigationController class]]) {
        return (UIViewController *)self.currentNav.topViewController;
    }
    return nil;
}

- (UINavigationController *)currentNav {
    return [self recursiveViewController:self.window.rootViewController];
}

- (UINavigationController *)recursiveViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self recursiveViewController:[(UINavigationController *)vc visibleViewController]];
    }
    if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self recursiveViewController:[(UITabBarController *)vc selectedViewController]];
    }
    if (vc.presentedViewController) {
        return [self recursiveViewController:vc.presentedViewController];
    }
    if ([vc isKindOfClass:[UISearchController class]]) {
        UIViewController *presentingViewController = vc.presentingViewController;
        if ([presentingViewController isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)presentingViewController;
        } else {
            return presentingViewController.navigationController;
        }
    }
    return vc.navigationController;
}


@end
