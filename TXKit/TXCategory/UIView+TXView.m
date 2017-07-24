//
//  UIView+TXView.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "UIView+TXView.h"
#import <objc/runtime.h>

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;

@implementation UIView (TXView)
//top
-(void)setTop:(CGFloat)top{
    CGRect frame=self.frame;
    if (self.frame.origin.y==top) {
        return;
    }
    frame.origin=CGPointMake(frame.origin.x, top);
    self.frame=frame;
}

-(CGFloat)top{
    return self.frame.origin.y;
}

//bottom
-(void)setBottom:(CGFloat)bottom{
    CGRect frame=self.frame;
    if (self.frame.origin.y+self.frame.size.height==bottom) {
        return;
    }
    frame.origin=CGPointMake(frame.origin.x, bottom-self.frame.size.height);
    self.frame=frame;
}

-(CGFloat)bottom{
    return self.frame.origin.y+self.frame.size.height;
}

//left
-(void)setLeft:(CGFloat)left{
    CGRect frame=self.frame;
    if (self.frame.origin.x==left) {
        return;
    }
    frame.origin=CGPointMake(left,self.frame.origin.y);
    self.frame=frame;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

//right
-(void)setRight:(CGFloat)right{
    CGRect frame=self.frame;
    if (self.frame.origin.x+self.frame.size.width==right) {
        return;
    }
    frame.origin=CGPointMake(right-self.frame.size.width,self.frame.origin.y);
    self.frame=frame;
}

-(CGFloat)right{
    return self.frame.origin.x+self.frame.size.width;
}

//x
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    if (self.frame.origin.x==x) {
        return;
    }
    frame.origin=CGPointMake(x, frame.origin.y);
    self.frame=frame;
}

-(CGFloat)x{
    return self.frame.origin.x;
}

//y
-(void)setY:(CGFloat)y{
    CGRect frame=self.frame;
    if (self.frame.origin.y==y) {
        return;
    }
    frame.origin=CGPointMake(frame.origin.x, y);
    self.frame=frame;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

//width
-(void)setWidth:(CGFloat)width{
    CGRect frame=self.frame;
    if (self.frame.size.width==width) {
        return;
    }
    frame.size=CGSizeMake(width, frame.size.height);
    self.frame=frame;
}

-(CGFloat)width{
    return self.bounds.size.width;
}

//height
-(void)setHeight:(CGFloat)height{
    CGRect frame=self.frame;
    if (self.frame.size.height==height) {
        return;
    }
    frame.size=CGSizeMake(frame.size.width, height);
    self.frame=frame;
}

-(CGFloat)height{
    return self.bounds.size.height;
}

//size
-(void)setSize:(CGSize)size{
    CGRect frame=self.frame;
    if (CGSizeEqualToSize(frame.size, size)) {
        return;
    }
    frame.size=size;
    self.frame=frame;
}

-(CGSize)size{
    return self.bounds.size;
}

//leftTop
-(void)setLeftTop:(CGPoint)leftTop{
    if (CGPointEqualToPoint(self.frame.origin, leftTop)) {
        return;
    }
    CGRect frame=self.frame;
    frame.origin=leftTop;
    self.frame=frame;
}

-(CGPoint)leftTop{
    return self.frame.origin;
}

//leftCenter
-(void)setLeftCenter:(CGPoint)leftCenter{
    CGPoint leftTop=self.leftTop;
    leftTop.x=leftCenter.x;
    leftTop.y=leftCenter.y-self.height/2.0;
    [self setLeftTop:leftTop];
}

-(CGPoint)leftCenter{
    return CGPointMake(self.frame.origin.x, self.frame.origin.y+self.height/2.0);
}

//leftBottom
-(void)setLeftBottom:(CGPoint)leftBottom{
    CGPoint leftTop=self.leftTop;
    leftTop.x=leftBottom.x;
    leftTop.y=leftBottom.y-self.height;
    [self setLeftTop:leftTop];
}

-(CGPoint)leftBottom{
    return CGPointMake(self.frame.origin.x, self.frame.origin.y+self.height);
}

//topCenter
-(void)setTopCenter:(CGPoint)topCenter{
    CGPoint leftTop=self.leftTop;
    leftTop.x=topCenter.x-self.width/2.0;
    leftTop.y=topCenter.y;
    [self setLeftTop:leftTop];
}

-(CGPoint)topCenter{
    return CGPointMake(self.frame.origin.x+self.width/2.0, self.frame.origin.y);
}

//bottomCenter
-(void)setBottomCenter:(CGPoint)bottomCenter{
    CGPoint leftTop=self.leftTop;
    leftTop.x=bottomCenter.x-self.width/2.0;
    leftTop.y=bottomCenter.y-self.height;
    [self setLeftTop:leftTop];
}

-(CGPoint)bottomCenter{
    return CGPointMake(self.frame.origin.x+self.width/2.0, self.frame.origin.y+self.height);
}

//rightTop
-(void)setRightTop:(CGPoint)rightTop{
    CGPoint leftTop=self.leftTop;
    leftTop.x=rightTop.x-self.width;
    leftTop.y=rightTop.y;
    [self setLeftTop:leftTop];
}

-(CGPoint)rightTop{
    return CGPointMake(self.frame.origin.x+self.width, self.frame.origin.y);
}

//rightCenter
-(void)setRightCenter:(CGPoint)rightCenter{
    CGPoint leftTop=self.leftTop;
    leftTop.x=rightCenter.x-self.width;
    leftTop.y=rightCenter.y-self.height/2.0;
    [self setLeftTop:leftTop];
}

-(CGPoint)rightCenter{
    return CGPointMake(self.frame.origin.x+self.width, self.frame.origin.y+self.height/2.0);
}

//rightBottom
-(void)setRightBottom:(CGPoint)rightBottom{
    CGPoint leftTop=self.leftTop;
    leftTop.x=rightBottom.x-self.width;
    leftTop.y=rightBottom.y-self.height;
    [self setLeftTop:leftTop];
}

-(CGPoint)rightBottom{
    return CGPointMake(self.frame.origin.x+self.width, self.frame.origin.y+self.height);
}

- (UIImage *)tx_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (void)tx_addTapActionWithBlock:(TapActionBlock)block {
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (tap == nil) {
        tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, tap, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        TapActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (void)tx_addLongPressActionWithBlock:(LongPressActionBlock)block {
    UILongPressGestureRecognizer *longPress = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey);
    if (!longPress) {
        longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPressGesture:)];
        objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, longPress, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)handleActionForLongPressGesture:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateRecognized) {
        LongPressActionBlock block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey);
        if (block) {
            block(gesture);
        }
    }
}

- (UIView *)tx_findSubViewWithClass:(Class)className {
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:className]) {
            return subView;
        }
    }
    return nil;
}

- (NSArray *)tx_findAllSubViewsWithClass:(Class)className {
    NSMutableArray *array = [NSMutableArray array];
    
    for (UIView * subView in self.subviews)
    {
        if ([subView isKindOfClass:className])
        {
            [array addObject:subView];
        }
    }
    
    return array;
}

- (UIView *)tx_findSuperViewWithClass:(Class)className {
    if (self == nil) {
        return nil;
    }
    else if (self.superview == nil) {
        return nil;
    }
    else if ([self.superview isKindOfClass:className]) {
        return self.superview;
    }
    else {
        return [self.superview tx_findSuperViewWithClass:className];
    }
}

- (UIView *)tx_findFirstResponder {
    if (([self isKindOfClass:[UITextField class]] || [self isKindOfClass:[UITextView class]])
        && (self.isFirstResponder)) {
        return self;
    }
    
    for (UIView *view in self.subviews) {
        UIView *v = [view tx_findFirstResponder];
        if (v) {
            return v;
        }
    }
    return nil;
}

- (UIViewController *)tx_findViewController {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    } while (responder);
    
    return nil;
}

- (void)clipRectCorner:(UIRectCorner)direction cornerRadius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:direction cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}




@end
