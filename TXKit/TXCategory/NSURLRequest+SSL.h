//
//  NSURLRequest+SSL.h
//  TXKit
//
//  Created by 赵天旭 on 2017/7/19.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (SSL)
+(BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+(void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end
