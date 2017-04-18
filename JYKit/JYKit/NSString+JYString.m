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
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:self delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    });
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

- (BOOL)isNumberWithMaxNumberOfDecimalDigits:(NSInteger)maxNumber {
    NSString *numberRegex = @"";
    if (maxNumber == 0) {
        numberRegex = @"^\\d+$";
    }else {
        numberRegex = [NSString stringWithFormat:@"^\\d+(\\.\\d{1,%ld})?$", (long)maxNumber];
    }
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:self];
}

- (BOOL)isMobileNumber {
    NSString *mobileRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [mobileTest evaluateWithObject:self];
}

- (BOOL)isEmailAddress {
    NSString *emailRegex = @"^.+@.+.[A-Za-z]{2}[A-Za-z]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isQQNumber {
    NSString *qqRegex = @"^[1-9]\\d{4,}$";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", qqRegex];
    return [qqTest evaluateWithObject:self];
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

- (void)writeToLog {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *debugFilePath = [documentPath stringByAppendingPathComponent:@"debug.txt"];
    if (![fileManager fileExistsAtPath:debugFilePath]) {
        if (![fileManager createFileAtPath:debugFilePath contents:nil attributes:nil]) {
            NSLog(@"不能创建debug file");
            return;
        }
        [fileManager setAttributes:@{NSFileProtectionKey:NSFileProtectionNone} ofItemAtPath:debugFilePath error:nil];
    }
    NSFileHandle *debugFileHandle = [NSFileHandle fileHandleForWritingAtPath:debugFilePath];
    [debugFileHandle seekToEndOfFile];
    [debugFileHandle writeData:[self dataUsingEncoding:NSUTF8StringEncoding]];
    [debugFileHandle closeFile];
}

- (void)drawAtPointInRect:(CGRect)rect withAttributes:(NSDictionary<NSString *,id> *)attrs andAlignment:(NCStringAlignment)alignment {
    CGSize size = [self sizeWithAttributes:attrs];
    // X
    CGFloat x = 0;
    switch (alignment) {
        case NCStringAlignmentLeftTop:
        case NCStringAlignmentLeftCenter:
        case NCStringAlignmentLeftBottom:
            x = CGRectGetMinX(rect);
            break;
        case NCStringAlignmentCenterTop:
        case NCStringAlignmentCenter:
        case NCStringAlignmentCenterBottom:
            x = CGRectGetMidX(rect) - size.width/2;
            break;
        case NCStringAlignmentRightTop:
        case NCStringAlignmentRightCenter:
        case NCStringAlignmentRightBottom:
            x = CGRectGetMaxX(rect) - size.width;
            break;
        default:
            break;
    }
    // Y
    CGFloat y = 0;
    switch (alignment) {
        case NCStringAlignmentLeftTop:
        case NCStringAlignmentCenterTop:
        case NCStringAlignmentRightTop:
            y = CGRectGetMinY(rect);
            break;
        case NCStringAlignmentLeftCenter:
        case NCStringAlignmentCenter:
        case NCStringAlignmentRightCenter:
            y = CGRectGetMidY(rect) - size.height/2;
            break;
        case NCStringAlignmentLeftBottom:
        case NCStringAlignmentCenterBottom:
        case NCStringAlignmentRightBottom:
            y = CGRectGetMaxY(rect) - size.height;
            break;
        default:
            break;
    }
    // draw
    [self drawAtPoint:CGPointMake(x, y) withAttributes:attrs];
}

@end
