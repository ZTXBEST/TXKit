//
//  UIAlertController+TXAlert.m
//  TXKit
//
//  Created by 赵天旭 on 2017/8/9.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "UIAlertController+TXAlert.h"

@implementation UIAlertController (TXAlert)

+ (UIAlertController *)tx_alertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancel];
        [alert addAction:OK];
    }
    return alert;
}

+ (UIAlertController *)tx_sheetAlertControllerWithTitle:(NSString *)title message:(NSString *)message optionStyle:(OptionStyle)optionStyle OkTitle:(NSString *)okTitle cancelTitle:(NSString *)cancelTitle okBlock:(dispatch_block_t)okBlock cancelBlock:(dispatch_block_t)cancelBlock {
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    if (optionStyle == OptionStyleStyleOnlyOK) {
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:OK];
    } else {
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelBlock) {
                cancelBlock();
            }
        }];
        UIAlertAction* OK=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (okBlock) {
                okBlock();
            }
        }];
        [alert addAction:cancel];
        [alert addAction:OK];
    }
    return alert;
}


@end
