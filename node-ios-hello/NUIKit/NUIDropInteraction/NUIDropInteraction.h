//
//  NUIDropInteraction.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDropInteraction_h
#define NUIDropInteraction_h    

#include "NNSObject.h"

#define js_value_UIDropInteraction(x) js_value_wrapper(x, UIDropInteraction)
#define to_value_UIDropInteraction(x) to_value_wrapper(x, UIDropInteraction)
#define is_value_UIDropInteraction(x) is_value_wrapper(x, UIDropInteraction)

#define js_value_UIDropOperation(x) JS_ENUM(UIDropOperation, NSUInteger, x)
#define to_value_UIDropOperation(x) TO_ENUM(UIDropOperation, NSUInteger, x)
#define is_value_UIDropOperation(x) IS_ENUM(UIDropOperation, NSUInteger, x)

JS_WRAP_CLASS(UIDropInteraction, NSObject);
  JS_METHOD(initWithDelegate);
  JS_PROP_READONLY(delegate);
  JS_PROP(allowsSimultaneousDropSessions);
JS_WRAP_CLASS_END(UIDropInteraction);

#endif /* NUIDropInteraction_h */
