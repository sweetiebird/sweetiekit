//
//  NCLHeading.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLHeading.h"
#include <CoreLocation/CLHeading.h>

#define instancetype CLHeading
#define js_value_instancetype js_value_CLHeading

NCLHeading::NCLHeading () {}
NCLHeading::~NCLHeading () {}

#include "NCLLocation.h"

JS_INIT_CLASS(CLHeading, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP_READONLY(magneticHeading);
  JS_ASSIGN_PROTO_PROP_READONLY(trueHeading);
  JS_ASSIGN_PROTO_PROP_READONLY(headingAccuracy);
  JS_ASSIGN_PROTO_PROP_READONLY(x);
  JS_ASSIGN_PROTO_PROP_READONLY(y);
  JS_ASSIGN_PROTO_PROP_READONLY(z);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  // static members (ctor)
  JS_INIT_CTOR(CLHeading, NSObject);
  // constants (exports)
  JS_ASSIGN_ENUM(kCLHeadingFilterNone, CLLocationDegrees);
JS_INIT_CLASS_END(CLHeading, NSObject);

NAN_METHOD(NCLHeading::New) {
  JS_RECONSTRUCT(CLHeading);
  @autoreleasepool {
    CLHeading* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLHeading *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLHeading alloc] init];
    }
    if (self) {
      NCLHeading *wrapper = new NCLHeading();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLHeading::New: invalid arguments");
    }
  }
}

NAN_GETTER(NCLHeading::magneticHeadingGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDirection([self magneticHeading]));
  }
}

NAN_GETTER(NCLHeading::trueHeadingGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDirection([self trueHeading]));
  }
}

NAN_GETTER(NCLHeading::headingAccuracyGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDirection([self headingAccuracy]));
  }
}

NAN_GETTER(NCLHeading::xGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLHeadingComponentValue([self x]));
  }
}

NAN_GETTER(NCLHeading::yGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLHeadingComponentValue([self y]));
  }
}

NAN_GETTER(NCLHeading::zGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLHeadingComponentValue([self z]));
  }
}

NAN_GETTER(NCLHeading::timestampGetter) {
  JS_UNWRAP(CLHeading, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDate([self timestamp]));
  }
}
