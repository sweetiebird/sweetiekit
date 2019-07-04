//
//  NUIDragPreviewTarget.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragPreviewTarget_h
#define NUIDragPreviewTarget_h    

#include "NNSObject.h"

#define js_value_UIDragPreviewTarget(x) js_value_wrapper(x, UIDragPreviewTarget)
#define to_value_UIDragPreviewTarget(x) to_value_wrapper(x, UIDragPreviewTarget)
#define is_value_UIDragPreviewTarget(x) is_value_wrapper(x, UIDragPreviewTarget)

JS_WRAP_CLASS(UIDragPreviewTarget, NSObject);
  JS_METHOD(initWithContainerCenterTransform);
  JS_METHOD(initWithContainerCenter);
  JS_PROP_READONLY(container);
  JS_PROP_READONLY(center);
  JS_PROP_READONLY(transform);
JS_WRAP_CLASS_END(UIDragPreviewTarget);

#endif /* NUIDragPreviewTarget_h */
