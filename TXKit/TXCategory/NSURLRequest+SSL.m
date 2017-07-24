//
//  NSURLRequest+SSL.m
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "NSURLRequest+SSL.h"

@implementation NSURLRequest (SSL)
+(BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host{
    return YES;
}

+(void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host{
    
}
@end
