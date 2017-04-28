//
//  JYExceptionHandle.m
//  JYKit
//
//  Created by Ren Jing on 2017/4/27.
//  Copyright © 2017年 FALSESHEEP. All rights reserved.
//

#import "JYExceptionHandle.h"

@implementation JYExceptionHandle

+ (NSString *)crashFolder {
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *crashFolder = [documentPath stringByAppendingPathComponent:@"Logs"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:crashFolder isDirectory:nil]) {
        [fileManager createDirectoryAtPath:crashFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return crashFolder;
}

void uncaughtExceptionHandler(NSException *exception) {
    NSTimeInterval crashTime = [[NSDate date] timeIntervalSince1970];
    NSString *appName = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleName"];
    NSString *appVer = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *name = exception.name;
    NSString *reason = exception.reason;
    NSArray *stackArray = exception.callStackSymbols;
    NSString *exceptionInfo = [NSString stringWithFormat:@"Crash Time: %.f\nApp Name: %@\nApp Version: %@\nException Name: %@\nException Reason: %@\nException Stack: %@", crashTime, appName, appVer, name, reason, stackArray];
    NSString *fileName = [NSString stringWithFormat:@"%@-%.f.log", appName, crashTime];
    NSString *filePath = [[JYExceptionHandle crashFolder] stringByAppendingPathComponent:fileName];
    [exceptionInfo writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

+ (void)writeCrashLogWhenNecessary {
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
}

+ (NSArray *)crashLogs {
    NSMutableArray *ret = [NSMutableArray array];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:[JYExceptionHandle crashFolder]];
    NSString *fileName;
    while (fileName = [enumerator nextObject]) {
        NSString *filePath = [[JYExceptionHandle crashFolder] stringByAppendingPathComponent:fileName];
        [ret addObject:filePath];
    }
    return ret;
}

+ (BOOL)removeCrashLogs {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL result = [fileManager removeItemAtPath:[JYExceptionHandle crashFolder] error:&error];
    if (!result && error) {
        NSLog(@"删除Crash Log文件错误: %@", error.localizedDescription);
    }
    return result;
}

@end
