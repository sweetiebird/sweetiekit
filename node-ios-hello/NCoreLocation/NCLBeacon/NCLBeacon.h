//
//  NCLBeacon.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLBeacon_h
#define NCLBeacon_h    

#include "NNSObject.h"

#define js_value_CLBeacon(x) js_value_wrapper(x, CLBeacon)
#define to_value_CLBeacon(x) to_value_wrapper(x, CLBeacon)
#define is_value_CLBeacon(x) is_value_wrapper(x, CLBeacon)

JS_WRAP_CLASS(CLBeacon, NSObject);
  JS_PROP_READONLY(proximityUUID);
  JS_PROP_READONLY(major);
  JS_PROP_READONLY(minor);
  JS_PROP_READONLY(proximity);
  JS_PROP_READONLY(accuracy);
  JS_PROP_READONLY(rssi);
JS_WRAP_CLASS_END(CLBeacon);

#endif /* NCLBeacon_h */
