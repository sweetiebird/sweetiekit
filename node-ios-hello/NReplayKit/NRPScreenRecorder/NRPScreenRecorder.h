//
//  NRPScreenRecorder.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPScreenRecorder_h
#define NRPScreenRecorder_h    

#include "NNSObject.h"

#define js_value_RPScreenRecorder(x) js_value_wrapper(x, RPScreenRecorder)
#define to_value_RPScreenRecorder(x) to_value_wrapper(x, RPScreenRecorder)
#define is_value_RPScreenRecorder(x) is_value_wrapper(x, RPScreenRecorder)

JS_WRAP_CLASS(RPScreenRecorder, NSObject);
  JS_METHOD(startRecordingWithHandler);
  JS_METHOD(stopRecordingWithHandler);
JS_WRAP_CLASS_END(RPScreenRecorder);

#endif /* NRPScreenRecorder_h */
