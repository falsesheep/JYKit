//
//  NSString+JYString.m
//  JYKit
//
//  Created by Ren Jing on 16/6/12.
//  Copyright © 2016年 FALSESHEEP. All rights reserved.
//

#import "NSString+JYString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (JYString)

- (void)alert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:self delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (CGSize)acceptableSizeWithFont:(UIFont *)font
                         maxWith:(CGFloat)maxWidth
                       maxHeight:(CGFloat)maxHeight {
    CGSize ret = CGSizeZero;

    CGSize maxSize = CGSizeZero;
    if (maxWidth > 0 && maxHeight == 0) {
        maxSize = CGSizeMake(maxWidth, 3000);
    }else if (maxHeight > 0 && maxWidth == 0) {
        maxSize = CGSizeMake(3000, maxHeight);
    }else {
        maxSize = CGSizeMake(maxWidth, maxHeight);
    }
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSDictionary *attributes = @{NSFontAttributeName: font};
        ret = [self boundingRectWithSize:maxSize
                                 options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                              attributes:attributes context:nil].size;
    }else {
        NSLog(@"没有确认Size的方法");
    }
    return ret;
}

+ (NSString *)stringFromDouble:(double)value {
    return [NSString stringFromDouble:value decimalCount:2 allowRound:YES prettyFormat:NO];
}

+ (NSString *)prettyStringFromDouble:(double)value {
    return [NSString stringFromDouble:value decimalCount:2 allowRound:YES prettyFormat:YES];
}

+ (NSString *)stringFromDouble:(double)value
                  decimalCount:(NSUInteger)count
                    allowRound:(BOOL)allowRound
                  prettyFormat:(BOOL)pretty {
    double multiply = pow(10, count);
    double rounded = round(value * multiply);
    double devided = rounded / multiply;
    NSString *formatter = [NSString stringWithFormat:@"%%.%df", count];
    NSString *ret = [NSString stringWithFormat:formatter, devided];
    if (pretty) { // 去掉末尾的0和小数点
        while (ret.length > 1 &&
               ([[ret substringFromIndex:ret.length-1] isEqualToString:@"0"] ||
                [[ret substringFromIndex:ret.length-1] isEqualToString:@"."])) {
                   ret = [ret substringToIndex:ret.length-1];
               }
    }
    return ret;
}

- (BOOL)isMobileNumber {
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:self];
}

- (NSString *)encryptWithMD5 {
    const char *cStr = self.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);

    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

- (UIImage *)generateQRCodeWithSideWidth:(CGFloat)sideWidth {
    NSData *data = [self dataUsingEncoding:NSISOLatin1StringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"Q" forKey:@"inputCorrectionLevel"];
    CIImage *image = filter.outputImage;
    // Scale
    CGFloat scale = sideWidth / image.extent.size.width;
    CIImage *scaledImage = [image imageByApplyingTransform:CGAffineTransformMakeScale(scale, scale)];
    return [UIImage imageWithCIImage:scaledImage];
}

@end
