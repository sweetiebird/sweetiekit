//
//  NGCController.h
//
//  Created by Shawn Presser on 7/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NGCController_h
#define NGCController_h    

#include "NNSObject.h"

#define js_value_GCControllerPlayerIndex(x) JS_ENUM(GCControllerPlayerIndex, NSInteger, x)
#define to_value_GCControllerPlayerIndex(x) TO_ENUM(GCControllerPlayerIndex, NSInteger, x)
#define is_value_GCControllerPlayerIndex(x) IS_ENUM(GCControllerPlayerIndex, NSInteger, x)

#define js_value_GCController(x) js_value_wrapper(x, GCController)
#define to_value_GCController(x) to_value_wrapper(x, GCController)
#define is_value_GCController(x) is_value_wrapper(x, GCController)

JS_WRAP_CLASS(GCController, NSObject);
  JS_STATIC_METHOD(controllers);
  JS_STATIC_METHOD(startWirelessControllerDiscoveryWithCompletionHandler);
  JS_STATIC_METHOD(stopWirelessControllerDiscovery);
  JS_STATIC_METHOD(controllerWithMicroGamepad);
  JS_STATIC_METHOD(controllerWithExtendedGamepad);
  JS_METHOD(capture);
  JS_PROP(controllerPausedHandler);
  JS_PROP(handlerQueue);
  JS_PROP_READONLY(vendorName);
  JS_PROP_READONLY(productCategory);
  JS_PROP_READONLY(isAttachedToDevice);
  JS_PROP_READONLY(isSnapshot);
  JS_PROP(playerIndex);
  JS_PROP_READONLY(gamepad);
  JS_PROP_READONLY(microGamepad);
  JS_PROP_READONLY(extendedGamepad);
  JS_PROP_READONLY(motion);
JS_WRAP_CLASS_END(GCController);

#endif /* NGCController_h */
