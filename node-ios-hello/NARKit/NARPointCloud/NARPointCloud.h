//
//  NARPointCloud.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARPointCloud_h
#define NARPointCloud_h    

#include "NNSObject.h"

#if TARGET_OS_IPHONE && !TARGET_OS_UIKITFORMAC

#define js_value_ARPointCloud(x) js_value_wrapper(x, ARPointCloud)
#define to_value_ARPointCloud(x) to_value_wrapper(x, ARPointCloud)
#define is_value_ARPointCloud(x) is_value_wrapper(x, ARPointCloud)

JS_WRAP_CLASS(ARPointCloud, NSObject);
  JS_PROP_READONLY(count);
  JS_PROP_READONLY(points);
  JS_PROP_READONLY(identifiers);
JS_WRAP_CLASS_END(ARPointCloud);

#endif

#endif /* NARPointCloud_h */
