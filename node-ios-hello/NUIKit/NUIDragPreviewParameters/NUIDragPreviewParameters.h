//
//  NUIDragPreviewParameters.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragPreviewParameters_h
#define NUIDragPreviewParameters_h    

#include "NNSObject.h"

#define js_value_UIDragPreviewParameters(x) js_value_wrapper(x, UIDragPreviewParameters)
#define to_value_UIDragPreviewParameters(x) to_value_wrapper(x, UIDragPreviewParameters)
#define is_value_UIDragPreviewParameters(x) is_value_wrapper(x, UIDragPreviewParameters)

JS_WRAP_CLASS(UIDragPreviewParameters, NSObject);
  JS_METHOD(initWithTextLineRects);
  JS_PROP(visiblePath);
  JS_PROP(backgroundColor);
JS_WRAP_CLASS_END(UIDragPreviewParameters);

#endif /* NUIDragPreviewParameters_h */
