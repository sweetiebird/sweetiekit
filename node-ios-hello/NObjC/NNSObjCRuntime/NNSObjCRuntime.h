//
//  NNSObjCRuntime.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSObjCRuntime_h
#define NNSObjCRuntime_h    

#include "NNSObject.h"

#define js_value_NSObjCRuntime(x) js_value_wrapper(x, NSObjCRuntime)
#define to_value_NSObjCRuntime(x) to_value_wrapper(x, NSObjCRuntime)
#define is_value_NSObjCRuntime(x) is_value_wrapper(x, NSObjCRuntime)

/*
 These constants are used to indicate how items in a request are ordered, from the first one given in a method invocation or function call to the last (that is, left to right in code).
 
 Given the function:
   NSComparisonResult f(int a, int b)
 
 If:
    a < b   then return NSOrderedAscending. The left operand is smaller than the right operand.
    a > b   then return NSOrderedDescending. The left operand is greater than the right operand.
    a == b  then return NSOrderedSame. The operands are equal.
*/
#define js_value_NSComparisonResult(x) JS_ENUM(NSComparisonResult, NSInteger, x)
#define to_value_NSComparisonResult(x) TO_ENUM(NSComparisonResult, NSInteger, x)
#define is_value_NSComparisonResult(x) IS_ENUM(NSComparisonResult, NSInteger, x)

#define js_value_NSEnumerationOptions(x) JS_OPTS(NSEnumerationOptions, NSUInteger, x)
#define to_value_NSEnumerationOptions(x) TO_OPTS(NSEnumerationOptions, NSUInteger, x)
#define is_value_NSEnumerationOptions(x) IS_OPTS(NSEnumerationOptions, NSUInteger, x)

#define js_value_NSSortOptions(x) JS_OPTS(NSSortOptions, NSUInteger, x)
#define to_value_NSSortOptions(x) TO_OPTS(NSSortOptions, NSUInteger, x)
#define is_value_NSSortOptions(x) IS_OPTS(NSSortOptions, NSUInteger, x)

#define js_value_NSQualityOfService(x) JS_ENUM(NSQualityOfService, NSInteger, x)
#define to_value_NSQualityOfService(x) TO_ENUM(NSQualityOfService, NSInteger, x)
#define is_value_NSQualityOfService(x) IS_ENUM(NSQualityOfService, NSInteger, x)
  
#define js_value_NSExceptionName(x) JS_ENUM(NSExceptionName, NSString, x)
#define to_value_NSExceptionName(x) TO_ENUM(NSExceptionName, NSString, x)
#define is_value_NSExceptionName(x) IS_ENUM(NSExceptionName, NSString, x)

#define js_value_NSRunLoopMode(x) JS_ENUM(NSRunLoopMode, NSString, x)
#define to_value_NSRunLoopMode(x) TO_ENUM(NSRunLoopMode, NSString, x)
#define is_value_NSRunLoopMode(x) IS_ENUM(NSRunLoopMode, NSString, x)

JS_WRAP_CLASS(NSObjCRuntime, NSObject);
  // TODO: declare NSObjCRuntime methods and properties
JS_WRAP_CLASS_END(NSObjCRuntime);

#if __OBJC__
@interface NSObjCRuntime : NSObject
@end
#endif

#endif /* NNSObjCRuntime_h */
