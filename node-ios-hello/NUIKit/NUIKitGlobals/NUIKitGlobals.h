//
//  NUIKitGlobals.h
//  node-ios-hello
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
  JS_METHOD(UIImageWriteToSavedPhotosAlbum);
  JS_METHOD(UIImageOrientation);
JS_WRAP_CLASS_END(UIKitGlobals);

#endif /* NUIKitGlobals_h */
