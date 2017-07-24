//
//  UIView+TXView.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);
typedef void (^LongPressActionBlock)(UILongPressGestureRecognizer *gestureRecoginzer);

@interface UIView (TXView)
//锚点
@property(nonatomic,assign)CGFloat top;
@property(nonatomic,assign)CGFloat bottom;
@property(nonatomic,assign)CGFloat left;
@property(nonatomic,assign)CGFloat right;

@property(nonatomic,assign)CGPoint leftTop;
@property(nonatomic,assign)CGPoint leftCenter;
@property(nonatomic,assign)CGPoint leftBottom;
@property(nonatomic,assign)CGPoint topCenter;
@property(nonatomic,assign)CGPoint bottomCenter;
@property(nonatomic,assign)CGPoint rightTop;
@property(nonatomic,assign)CGPoint rightCenter;
@property(nonatomic,assign)CGPoint rightBottom;

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGSize size;

//将view截取成图片
- (UIImage *)tx_snapshotImage;

/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)tx_addTapActionWithBlock:(TapActionBlock)block;

/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)tx_addLongPressActionWithBlock:(LongPressActionBlock)block;

/** 找到指定类名的subView */
- (UIView *)tx_findSubViewWithClass:(Class)className;
- (NSArray *)tx_findAllSubViewsWithClass:(Class)className;

/** 找到指定类名的superView对象 */
- (UIView *)tx_findSuperViewWithClass:(Class)className;

/** 找到view上的第一响应者 */
- (UIView *)tx_findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)tx_findViewController;

/**
 裁剪view的圆角

 @param direction 裁剪的位置
 @param radius 角度
 */
- (void)clipRectCorner:(UIRectCorner)direction cornerRadius:(CGFloat)radius;





@end
