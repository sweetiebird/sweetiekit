//
//  NARWorldMap.h
//
//  Created by Shawn Presser on 6/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARWorldMap_h
#define NARWorldMap_h    

#include "NNSObject.h"

#define js_value_ARWorldMap(x) js_value_wrapper(x, ARWorldMap)
#define to_value_ARWorldMap(x) to_value_wrapper(x, ARWorldMap)
#define is_value_ARWorldMap(x) is_value_wrapper(x, ARWorldMap)

JS_WRAP_CLASS(ARWorldMap, NSObject);
  JS_PROP_READONLY(center);
  JS_PROP_READONLY(extent);
  JS_PROP(anchors);
  JS_PROP_READONLY(rawFeaturePoints);
JS_WRAP_CLASS_END(ARWorldMap);

#endif /* NARWorldMap_h */
