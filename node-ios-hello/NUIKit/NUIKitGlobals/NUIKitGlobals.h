//
//  NUIKitGlobals.h
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIKitGlobals_h
#define NUIKitGlobals_h    

#include "NNSObject.h"

#define js_value_UIKitGlobals(x) js_value_wrapper(x, UIKitGlobals)
#define to_value_UIKitGlobals(x) to_value_wrapper(x, UIKitGlobals)
#define is_value_UIKitGlobals(x) is_value_wrapper(x, UIKitGlobals)

JS_WRAP_CLASS(UIKitGlobals, NSObject);
  JS_STATIC_METHOD(UIImageWriteToSavedPhotosAlbum);
  JS_STATIC_PROP_READONLY(UIImageOrientation);
  JS_STATIC_PROP_READONLY(UITextFieldViewMode);
JS_WRAP_CLASS_END(UIKitGlobals);

#endif /* NUIKitGlobals_h */
