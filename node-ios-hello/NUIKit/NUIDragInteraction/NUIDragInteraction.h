//
//  NUIDragInteraction.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDragInteraction_h
#define NUIDragInteraction_h    

#include "NNSObject.h"

#define js_value_UIDragInteraction(x) js_value_wrapper(x, UIDragInteraction)
#define to_value_UIDragInteraction(x) to_value_wrapper(x, UIDragInteraction)
#define is_value_UIDragInteraction(x) is_value_wrapper(x, UIDragInteraction)

JS_WRAP_CLASS(UIDragInteraction, NSObject);
  JS_METHOD(initWithDelegate);
  JS_PROP_READONLY(delegate);
  JS_PROP(allowsSimultaneousRecognitionDuringLift);
  JS_PROP(isEnabled);
  JS_STATIC_PROP_READONLY(isEnabledByDefault);
JS_WRAP_CLASS_END(UIDragInteraction);

#endif /* NUIDragInteraction_h */
