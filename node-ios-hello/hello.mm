//
//  hello.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/9/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#include <stdarg.h>

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>

extern "C" void iOSTrap()
{
    __builtin_trap();
}

extern "C" void iOSLog(const char* format, ...)
{
    va_list args;
    va_start(args, format);
    NSLogv([NSString stringWithUTF8String:format], args);
    vfprintf(stderr, format, args);
    fflush(stderr);
    va_end(args);
}

extern "C" void iOSLog0(const char* msg)
{
    iOSLog("%s", msg);
}

extern "C" void iOSLogV(const char* format, va_list args)
{
    NSLogv([NSString stringWithUTF8String:format], args);
    vfprintf(stderr, format, args);
    fflush(stderr);
}

