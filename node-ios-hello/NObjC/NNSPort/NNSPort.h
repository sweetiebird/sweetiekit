//
//  NNSPort.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSPort_h
#define NNSPort_h    

#include "NNSObject.h"

#define js_value_NSPort(x) js_value_wrapper(x, NSPort)
#define to_value_NSPort(x) to_value_wrapper(x, NSPort)
#define is_value_NSPort(x) is_value_wrapper(x, NSPort)

JS_WRAP_CLASS(NSPort, NSObject);
  JS_STATIC_METHOD(port);
  JS_METHOD(invalidate);
  JS_METHOD(setDelegate);
  JS_METHOD(delegate);
  JS_METHOD(scheduleInRunLoopForMode);
  JS_METHOD(removeFromRunLoopForMode);
  JS_METHOD(sendBeforeDateComponentsFromReserved);
  JS_METHOD(sendBeforeDateMsgidComponentsFromReserved);
  JS_METHOD(addConnectionToRunLoopForMode);
  JS_METHOD(removeConnectionFromRunLoopForMode);
  JS_PROP_READONLY(isValid);
  JS_PROP_READONLY(reservedSpaceLength);


JS_WRAP_CLASS_END(NSPort);

#endif /* NNSPort_h */
