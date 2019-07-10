//
//  NARHitTestResult.h
//
//  Created by Shawn Presser on 6/2/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARHitTestResult_h
#define NARHitTestResult_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE

#define js_value_ARHitTestResult(x) js_value_wrapper(x, ARHitTestResult)
#define to_value_ARHitTestResult(x) to_value_wrapper(x, ARHitTestResult)
#define is_value_ARHitTestResult(x) is_value_wrapper(x, ARHitTestResult)

// ARKit enums

#define js_value_ARHitTestResultType(x) JS_OPTS(ARHitTestResultType, NSUInteger, x)
#define to_value_ARHitTestResultType(x) TO_OPTS(ARHitTestResultType, NSUInteger, x)
#define is_value_ARHitTestResultType(x) IS_OPTS(ARHitTestResultType, NSUInteger, x)

JS_WRAP_CLASS(ARHitTestResult, NSObject);
  JS_PROP_READONLY(type);
  JS_PROP_READONLY(distance);
  JS_PROP_READONLY(localTransform);
  JS_PROP_READONLY(worldTransform);
  JS_PROP_READONLY(anchor);
JS_WRAP_CLASS_END(ARHitTestResult);

#endif

#endif /* NARHitTestResult_h */
