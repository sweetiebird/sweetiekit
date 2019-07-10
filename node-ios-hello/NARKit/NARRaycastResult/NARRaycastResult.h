//
//  NARRaycastResult.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARRaycastResult_h
#define NARRaycastResult_h    

#include "NNSObject.h"

#define js_value_ARRaycastResult(x) js_value_wrapper(x, ARRaycastResult)
#define to_value_ARRaycastResult(x) to_value_wrapper(x, ARRaycastResult)
#define is_value_ARRaycastResult(x) is_value_wrapper(x, ARRaycastResult)

JS_WRAP_CLASS(ARRaycastResult, NSObject);
  JS_PROP_READONLY(worldTransform);
  JS_PROP_READONLY(target);
  JS_PROP_READONLY(targetAlignment);
  JS_PROP_READONLY(anchor);
JS_WRAP_CLASS_END(ARRaycastResult);

#endif /* NARRaycastResult_h */
