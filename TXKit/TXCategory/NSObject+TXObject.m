//
//  NSObject+TXObject.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/24.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "NSObject+TXObject.h"
#import <sys/utsname.h>
#import <objc/runtime.h>

@implementation NSObject (TXObject)

+ (NSString *)version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

+ (NSInteger)build {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [app_build integerValue];
}

+ (NSString *)identifier {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * bundleIdentifier = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)currentLanguage {
    return [[NSLocale preferredLanguages] firstObject];
}

+ (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

- (NSString *)className
{
    return NSStringFromClass([self class]);
}

- (NSString *)superClassName
{
    return NSStringFromClass([self superclass]);
}

+ (NSString *)className
{
    return NSStringFromClass([self class]);
}

+ (NSString *)superClassName
{
    return NSStringFromClass([self superclass]);
}

-(NSDictionary *)propertyDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    unsigned int count = 0;
    objc_property_t *property = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t pro = property[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(pro) encoding:NSUTF8StringEncoding];
        id propertyValue = [self valueForKey:propertyName];
        [dict setObject:propertyValue?:[NSNull null] forKey:propertyName];
    }
    free(property);
    return dict;
}

- (NSArray *)propertyKeys {
    NSMutableArray *propertys = [[NSMutableArray alloc] init];
    unsigned int count = 0;
    objc_property_t *property = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t propertyName = property[i];
        const char * name = property_getName(propertyName);
        [propertys addObject:[NSString stringWithUTF8String:name]];
    }
    free(property);
    return propertys;
}

+ (NSArray *)propertyKeys {
    return [self propertyKeys];
}

-(NSArray *)methodList {
    NSMutableArray *methodList = [[NSMutableArray alloc] init];
    unsigned int count = 0;
    Method *method = class_copyMethodList([self class], &count);
    for (int i = 0; i<count; i++) {
        Method methodName = method[i];
        SEL name = method_getName(methodName);
        NSString *nameString = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        [methodList addObject:nameString];
    }
    free(method);
    return methodList;
}

+(NSArray *)methodList {
    return [self methodList];
}

-(NSArray *)methodListInfo {
    unsigned int count = 0;
    NSMutableArray *methodList = [NSMutableArray array];
    Method *methods = class_copyMethodList([self class], &count);
    for (int i = 0; i<count; i++) {
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        Method method = methods[i];
        SEL name = method_getName(method);
        //返回方法的参数个数
        int methodsCount = method_getNumberOfArguments(method);
        //获取描述方法参数和返回值类型的字符串
        const char *encoding = method_getTypeEncoding(method);
        //取方法的返回值类型的字符串
        const char *returnType = method_copyReturnType(method);
        NSMutableArray *arguments = [[NSMutableArray alloc] init];
        for (int i = 0; i<methodsCount; i++) {
            // 获取方法的指定位置参数的类型字符串
            char *argument = method_copyArgumentType(method, i);
//            NSString *argString = [NSString stringWithCString:argument encoding:NSUTF8StringEncoding];
//            [arguments addObject:argString];
            [arguments addObject:[[self class] decodeType:argument]];
        }
        
        NSString *returnTypeString =[[self class] decodeType:returnType];
        NSString *encodeString = [[self class] decodeType:encoding];
        NSString *nameString = [NSString  stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
        
        [info setObject:arguments forKey:@"arguments"];
        [info setObject:[NSString stringWithFormat:@"%d",methodsCount] forKey:@"methodsCount"];
        [info setObject:returnTypeString forKey:@"returnType"];
        [info setObject:encodeString forKey:@"encode"];
        [info setObject:nameString forKey:@"name"];
        //        [info setObject:imp_f forKey:@"imp"];
        [methodList addObject:info];
    }
    free(methods);
    return methodList;
}

+ (NSArray *)registedClassList {
    unsigned int count = 0;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    Class *classes = objc_copyClassList(&count);
    for (int i = 0; i<count; i++) {
        [result addObject:NSStringFromClass(classes[i])];
    }
    free(classes);
    return result;
}

+ (NSArray *)instanceVariable {
    unsigned int count = 0;
    NSMutableArray *result = [[NSMutableArray alloc] init];
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0 ; i<count; i++) {
        NSString *type = [[self class] decodeType:ivar_getTypeEncoding(ivars[i])];
        NSString *name = [NSString stringWithCString:ivar_getName(ivars[i]) encoding:NSUTF8StringEncoding];
        NSString *description = [NSString stringWithFormat:@"%@,%@",type,name];
        [result addObject:description];
    }
    free(ivars);
    return result;
}

+ (NSString *)decodeType:(const char *)cString
{
    if (!strcmp(cString, @encode(char)))
        return @"char";
    if (!strcmp(cString, @encode(int)))
        return @"int";
    if (!strcmp(cString, @encode(short)))
        return @"short";
    if (!strcmp(cString, @encode(long)))
        return @"long";
    if (!strcmp(cString, @encode(long long)))
        return @"long long";
    if (!strcmp(cString, @encode(unsigned char)))
        return @"unsigned char";
    if (!strcmp(cString, @encode(unsigned int)))
        return @"unsigned int";
    if (!strcmp(cString, @encode(unsigned short)))
        return @"unsigned short";
    if (!strcmp(cString, @encode(unsigned long)))
        return @"unsigned long";
    if (!strcmp(cString, @encode(unsigned long long)))
        return @"unsigned long long";
    if (!strcmp(cString, @encode(float)))
        return @"float";
    if (!strcmp(cString, @encode(double)))
        return @"double";
    if (!strcmp(cString, @encode(bool)))
        return @"bool";
    if (!strcmp(cString, @encode(_Bool)))
        return @"_Bool";
    if (!strcmp(cString, @encode(void)))
        return @"void";
    if (!strcmp(cString, @encode(char *)))
        return @"char *";
    if (!strcmp(cString, @encode(id)))
        return @"id";
    if (!strcmp(cString, @encode(Class)))
        return @"class";
    if (!strcmp(cString, @encode(SEL)))
        return @"SEL";
    if (!strcmp(cString, @encode(BOOL)))
        return @"BOOL";
    
    NSString *result = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];

    if ([[result substringToIndex:1] isEqualToString:@"@"] && [result rangeOfString:@"?"].location == NSNotFound) {
        result = [[result substringWithRange:NSMakeRange(2, result.length - 3)] stringByAppendingString:@"*"];
    }
    else {
        if ([[result substringToIndex:1] isEqualToString:@"^"]) {
            result = [NSString stringWithFormat:@"%@ *",
                      [NSString decodeType:[[result substringFromIndex:1] cStringUsingEncoding:NSUTF8StringEncoding]]];
        }
    }
    return result;
}

- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
          withBlock:(KVOBlock)block {
    objc_setAssociatedObject(self, (__bridge const void *)(keyPath), block, OBJC_ASSOCIATION_COPY);
    [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:context];
}

-(void)removeBlockObserver:(NSObject *)observer
                forKeyPath:(NSString *)keyPath {
    objc_setAssociatedObject(self, (__bridge const void *)(keyPath), nil, OBJC_ASSOCIATION_COPY);
    [self removeObserver:observer forKeyPath:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    KVOBlock block = objc_getAssociatedObject(self, (__bridge const void *)(keyPath));
    block(change,context);
}

-(void)addObserverForKeyPath:(NSString *)keyPath
                     options:(NSKeyValueObservingOptions)options
                     context:(void *)context
                   withBlock:(KVOBlock)block {
    [self addObserver:self forKeyPath:keyPath options:options context:context withBlock:block];
}

-(void)removeBlockObserverForKeyPath:(NSString *)keyPath {
    [self removeBlockObserver:self forKeyPath:keyPath];
}

-(NSString *)JSONString {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&error];
    
    if(error) {
        NSLog(@"json解析失败：%@",error);
        return nil;
    }
    return dic;
}

@end
