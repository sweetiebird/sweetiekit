//
//  NCGImageProperties.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCGImageProperties_h
#define NCGImageProperties_h    

#include "NNSObject.h"

#define js_value_CGImagePropertyOrientation(x) JS_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define to_value_CGImagePropertyOrientation(x) TO_ENUM(CGImagePropertyOrientation, uint32_t, x)
#define is_value_CGImagePropertyOrientation(x) IS_ENUM(CGImagePropertyOrientation, uint32_t, x)

JS_WRAP_GLOBALS(CGImageProperties);
  // TODO: declare CGImageProperties globals
JS_WRAP_GLOBALS_END(CGImageProperties);

#endif /* NCGImageProperties_h */
