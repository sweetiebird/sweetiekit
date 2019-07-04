//
//  NUITargetedDragPreview.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITargetedDragPreview_h
#define NUITargetedDragPreview_h    

#include "NNSObject.h"

#define js_value_UITargetedDragPreview(x) js_value_wrapper(x, UITargetedDragPreview)
#define to_value_UITargetedDragPreview(x) to_value_wrapper(x, UITargetedDragPreview)
#define is_value_UITargetedDragPreview(x) is_value_wrapper(x, UITargetedDragPreview)

JS_WRAP_CLASS(UITargetedDragPreview, NSObject);
  JS_METHOD(initWithViewParametersTarget);
  JS_METHOD(initWithViewParameters);
  JS_METHOD(initWithView);
  JS_METHOD(retargetedPreviewWithTarget);
  JS_PROP_READONLY(target);
  JS_PROP_READONLY(view);
  JS_PROP_READONLY(parameters);
  JS_PROP_READONLY(size);
JS_WRAP_CLASS_END(UITargetedDragPreview);

#endif /* NUITargetedDragPreview_h */
