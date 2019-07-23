//
//  NARRaycastQuery.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARRaycastQuery_h
#define NARRaycastQuery_h    

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#include "NNSObject.h"

#define js_value_ARRaycastTarget(x) JS_ENUM(ARRaycastTarget, NSInteger, x)
#define to_value_ARRaycastTarget(x) TO_ENUM(ARRaycastTarget, NSInteger, x)
#define is_value_ARRaycastTarget(x) IS_ENUM(ARRaycastTarget, NSInteger, x)

#define js_value_ARRaycastTargetAlignment(x) JS_ENUM(ARRaycastTargetAlignment, NSInteger, x)
#define to_value_ARRaycastTargetAlignment(x) TO_ENUM(ARRaycastTargetAlignment, NSInteger, x)
#define is_value_ARRaycastTargetAlignment(x) IS_ENUM(ARRaycastTargetAlignment, NSInteger, x)

#define js_value_ARRaycastQuery(x) js_value_wrapper(x, ARRaycastQuery)
#define to_value_ARRaycastQuery(x) to_value_wrapper(x, ARRaycastQuery)
#define is_value_ARRaycastQuery(x) is_value_wrapper(x, ARRaycastQuery)

JS_WRAP_CLASS(ARRaycastQuery, NSObject);
  JS_METHOD(initWithOriginDirectionAllowingTargetAlignment);
  JS_PROP_READONLY(origin);
  JS_PROP_READONLY(direction);
  JS_PROP_READONLY(target);
  JS_PROP_READONLY(targetAlignment);
JS_WRAP_CLASS_END(ARRaycastQuery);

#endif

#endif /* NARRaycastQuery_h */
