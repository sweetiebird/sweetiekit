//
//  NCLBeaconRegion.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLBeaconRegion_h
#define NCLBeaconRegion_h    

#include "NCLRegion.h"

#define js_value_CLBeaconRegion(x) js_value_wrapper(x, CLBeaconRegion)
#define to_value_CLBeaconRegion(x) to_value_wrapper(x, CLBeaconRegion)
#define is_value_CLBeaconRegion(x) is_value_wrapper(x, CLBeaconRegion)

#define js_value_CLBeaconMajorValue(x) js_value_uint16_t(x)
#define to_value_CLBeaconMajorValue(x) to_value_uint16_t(x)
#define is_value_CLBeaconMajorValue(x) is_value_uint16_t(x)

#define js_value_CLBeaconMinorValue(x) js_value_uint16_t(x)
#define to_value_CLBeaconMinorValue(x) to_value_uint16_t(x)
#define is_value_CLBeaconMinorValue(x) is_value_uint16_t(x)

JS_WRAP_CLASS(CLBeaconRegion, CLRegion);
  JS_STATIC_METHOD(initWithProximityUUIDIdentifier);
  JS_STATIC_METHOD(initWithProximityUUIDMajorIdentifier);
  JS_STATIC_METHOD(initWithProximityUUIDMajorMinorIdentifier);
  JS_METHOD(peripheralDataWithMeasuredPower);
  JS_PROP_READONLY(proximityUUID);
  JS_PROP_READONLY(major);
  JS_PROP_READONLY(minor);
  JS_PROP(notifyEntryStateOnDisplay);
JS_WRAP_CLASS_END(CLBeaconRegion);

#endif /* NCLBeaconRegion_h */
