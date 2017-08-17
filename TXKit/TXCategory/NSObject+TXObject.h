//
//  NSObject+TXObject.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/24.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^KVOBlock)(NSDictionary *change, void *context);

@interface NSObject (TXObject)

+ (NSString *)version;

+ (NSInteger)build;

+ (NSString *)identifier;

+ (NSString *)currentLanguage;

+ (NSString *)deviceModel;

//类名
- (NSString *)className;
+ (NSString *)className;

//父类名称
- (NSString *)superClassName;
+ (NSString *)superClassName;

//实例属性字典
-(NSDictionary *)propertyDictionary;

//属性名称列表
- (NSArray *)propertyKeys;
+ (NSArray *)propertyKeys;

//方法列表
-(NSArray *)methodList;
+(NSArray *)methodList;

-(NSArray *)methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)registedClassList;
//实例变量
+ (NSArray *)instanceVariable;

- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(KVOBlock)block;

-(void)removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath;

-(void)addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(KVOBlock)block;

-(void)removeBlockObserverForKeyPath:(NSString *)keyPath;

//json转字符串
-(NSString *)JSONString;
//json字符串转字典
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString *)decodeType:(const char *)cString;
@end
