//
//  UIDevice+JYDevice.m
//  JYKit
//
//  Created by Ren Jing on 2017/4/28.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "UIDevice+JYDevice.h"
#import <sys/utsname.h>

@implementation UIDevice (JYDevice)

+ (NSString *)platformType {
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (NSString *)platformString {
    NSDictionary *dic = @{
                          //Simultor
                          @"i386"      : @"32-bit Simulator",
                          @"x86_64"    : @"64-bit Simulator",

                          //iPhone
                          @"iPhone1,1" : @"iPhone",
                          @"iPhone1,2" : @"iPhone 3G",
                          @"iPhone2,1" : @"iPhone 3GS",
                          @"iPhone3,1" : @"iPhone 4 (GSM)",
                          @"iPhone3,3" : @"iPhone 4 (CDMA/Verizon/Sprint)",
                          @"iPhone4,1" : @"iPhone 4S",
                          @"iPhone5,1" : @"iPhone 5 (model A1428, AT&T/Canada)",
                          @"iPhone5,2" : @"iPhone 5 (model A1429, everything else)",
                          @"iPhone5,3" : @"iPhone 5c (model A1456, A1532 | GSM)",
                          @"iPhone5,4" : @"iPhone 5c (model A1507, A1516, A1526 (China), A1529 | Global)",
                          @"iPhone6,1" : @"iPhone 5s (model A1433, A1533 | GSM)",
                          @"iPhone6,2" : @"iPhone 5s (model A1457, A1518, A1528 (China), A1530 | Global)",
                          @"iPhone7,1" : @"iPhone 6 Plus",
                          @"iPhone7,2" : @"iPhone 6",
                          @"iPhone8,1" : @"iPhone 6S",
                          @"iPhone8,2" : @"iPhone 6S Plus",
                          @"iPhone8,4" : @"iPhone SE",
                          @"iPhone9,1" : @"iPhone 7 (CDMA)",
                          @"iPhone9,3" : @"iPhone 7 (GSM)",
                          @"iPhone9,2" : @"iPhone 7 Plus (CDMA)",
                          @"iPhone9,4" : @"iPhone 7 Plus (GSM)",

                          //iPad 1
                          @"iPad1,1" : @"iPad 1 - Wifi (model A1219)",
                          @"iPad1,1" : @"iPad 1 - Wifi + Cellular (model A1337)",

                          //iPad 2
                          @"iPad2,1" : @"iPad 2 - Wifi (model A1395)",
                          @"iPad2,2" : @"iPad 2 - GSM (model A1396)",
                          @"iPad2,3" : @"iPad 2 - 3G (model A1397)",
                          @"iPad2,4" : @"iPad 2 - Wifi (model A1395)",

                          // iPad Mini
                          @"iPad2,5" : @"iPad Mini - Wifi (model A1432)",
                          @"iPad2,6" : @"iPad Mini - Wifi + Cellular (model  A1454)",
                          @"iPad2,7" : @"iPad Mini - Wifi + Cellular (model  A1455)",

                          //iPad 3
                          @"iPad3,1" : @"iPad 3 - Wifi (model A1416)",
                          @"iPad3,2" : @"iPad 3 - Wifi + Cellular (model  A1403)",
                          @"iPad3,3" : @"iPad 3 - Wifi + Cellular (model  A1430)",
                          
                          //iPad 4
                          @"iPad3,4" : @"iPad 4 - Wifi (model A1458)",
                          @"iPad3,5" : @"iPad 4 - Wifi + Cellular (model  A1459)",
                          @"iPad3,6" : @"iPad 4 - Wifi + Cellular (model  A1460)",
                          
                          //iPad AIR
                          @"iPad4,1" : @"iPad AIR - Wifi (model A1474)",
                          @"iPad4,2" : @"iPad AIR - Wifi + Cellular (model A1475)",
                          @"iPad4,3" : @"iPad AIR - Wifi + Cellular (model A1476)",
                          
                          // iPad Mini 2
                          @"iPad4,4" : @"iPad Mini 2 - Wifi (model A1489)",
                          @"iPad4,5" : @"iPad Mini 2 - Wifi + Cellular (model A1490)",
                          @"iPad4,6" : @"iPad Mini 2 - Wifi + Cellular (model A1491)",
                          
                          // iPad Mini 3
                          @"iPad4,7" : @"iPad Mini 3 - Wifi (model A1599)",
                          @"iPad4,8" : @"iPad Mini 3 - Wifi + Cellular (model A1600)",
                          @"iPad4,9" : @"iPad Mini 3 - Wifi + Cellular (model A1601)",
                          
                          // iPad Mini 4
                          @"iPad5,1" : @"iPad Mini 4 - Wifi (model A1538)",
                          @"iPad5,2" : @"iPad Mini 4 - Wifi + Cellular (model A1550)",
                          
                          //iPad AIR 2
                          @"iPad5,3" : @"iPad AIR 2 - Wifi (model A1566)",
                          @"iPad5,4" : @"iPad AIR 2 - Wifi + Cellular (model A1567)",
                          
                          // iPad PRO 12.9"
                          @"iPad6,3" : @"iPad PRO 12.9\" - Wifi (model A1673)",
                          @"iPad6,4" : @"iPad PRO 12.9\" - Wifi + Cellular (model A1674)",
                          @"iPad6,4" : @"iPad PRO 12.9\" - Wifi + Cellular (model A1675)",
                          
                          //iPad PRO 9.7"
                          @"iPad6,7" : @"iPad PRO 9.7\" - Wifi (model A1584)",
                          @"iPad6,8" : @"iPad PRO 9.7\" - Wifi + Cellular (model A1652)",
                          
                          //iPod Touch
                          @"iPod1,1" : @"iPod Touch",
                          @"iPod2,1" : @"iPod Touch Second Generation",
                          @"iPod3,1" : @"iPod Touch Third Generation",
                          @"iPod4,1" : @"iPod Touch Fourth Generation",
                          @"iPod7,1" : @"iPod Touch 6th Generation"};
    NSString *platformType = [UIDevice platformType];
    return dic[platformType];
}

@end
