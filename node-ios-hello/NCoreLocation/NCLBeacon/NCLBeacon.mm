//
//  NCLBeacon.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLBeacon.h"
#include <CoreLocation/CLBeaconRegion.h>

#define instancetype CLBeacon
#define js_value_instancetype js_value_CLBeacon

NCLBeacon::NCLBeacon() {}
NCLBeacon::~NCLBeacon() {}

JS_INIT_CLASS(CLBeacon, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(proximityUUID);
  JS_ASSIGN_PROTO_PROP_READONLY(major);
  JS_ASSIGN_PROTO_PROP_READONLY(minor);
  JS_ASSIGN_PROTO_PROP_READONLY(proximity);
  JS_ASSIGN_PROTO_PROP_READONLY(accuracy);
  JS_ASSIGN_PROTO_PROP_READONLY(rssi);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLBeacon, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CLBeacon, NSObject);

NAN_METHOD(NCLBeacon::New) {
  JS_RECONSTRUCT(CLBeacon);
  @autoreleasepool {
    CLBeacon* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLBeacon *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLBeacon alloc] init];
    }
    if (self) {
      NCLBeacon *wrapper = new NCLBeacon();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLBeacon::New: invalid arguments");
    }
  }
}

#include "NNSUUID.h"

NAN_GETTER(NCLBeacon::proximityUUIDGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self proximityUUID]));
  }
}

NAN_GETTER(NCLBeacon::majorGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self major]));
  }
}

NAN_GETTER(NCLBeacon::minorGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self minor]));
  }
}

#include "NCLRegion.h"

NAN_GETTER(NCLBeacon::proximityGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLProximity([self proximity]));
  }
}

#include "NCLLocation.h"

NAN_GETTER(NCLBeacon::accuracyGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationAccuracy([self accuracy]));
  }
}

NAN_GETTER(NCLBeacon::rssiGetter) {
  JS_UNWRAP(CLBeacon, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self rssi]));
  }
}
