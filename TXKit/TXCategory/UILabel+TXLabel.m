//
//  UILabel+TXLabel.m
//  TXKit
//
//  Created by 赵天旭 on 2017/8/17.
//  Copyright © 2017年 ZTX. All rights reserved.
//

#import "UILabel+TXLabel.h"
#import "UIView+TXView.h"
#import <CoreText/CoreText.h>

@implementation UILabel (TXLabel)

- (void)setColumnSpace:(CGFloat)columnSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])];
    self.attributedText = attributedString;
}

- (void)setRowSpace:(CGFloat)rowSpace
{
    self.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}


-(void)sizeThatFitsWithWidth{
    CGSize size = [self sizeThatFits:CGSizeMake(self.width, NSIntegerMax)];
    self.height=size.height;
}

-(void)sizeThatFitsWithHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(NSIntegerMax, self.height)];
    self.width=size.width;
}

-(void)sizeThatFitsUnderWidth{
    CGSize size=[self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    if (size.width>self.width) {
        [self sizeThatFitsWithWidth];
    }
    else{
        [self sizeToFit];
    }
}

-(void)sizeThatFitsUnderHeight{
    CGSize size=[self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    if (size.height>self.height) {
        [self sizeThatFitsWithHeight];
    }
    else{
        [self sizeToFit];
    }
}

@end
