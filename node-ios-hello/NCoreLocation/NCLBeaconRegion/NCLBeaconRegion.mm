//
//  NCLBeaconRegion.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLBeaconRegion.h"

#define instancetype CLBeaconRegion
#define js_value_instancetype js_value_CLBeaconRegion

NCLBeaconRegion::NCLBeaconRegion() {}
NCLBeaconRegion::~NCLBeaconRegion() {}

JS_INIT_CLASS(CLBeaconRegion, CLRegion);
  JS_ASSIGN_PROTO_METHOD(initWithProximityUUIDIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithProximityUUIDMajorIdentifier);
  JS_ASSIGN_PROTO_METHOD(initWithProximityUUIDMajorMinorIdentifier);
  JS_ASSIGN_PROTO_METHOD(peripheralDataWithMeasuredPower);
  JS_ASSIGN_PROTO_PROP_READONLY(proximityUUID);
  JS_ASSIGN_PROTO_PROP_READONLY(major);
  JS_ASSIGN_PROTO_PROP_READONLY(minor);
  JS_ASSIGN_PROTO_PROP(notifyEntryStateOnDisplay);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLBeaconRegion, CLRegion);
  // constant values (exports)
JS_INIT_CLASS_END(CLBeaconRegion, CLRegion);

NAN_METHOD(NCLBeaconRegion::New) {
  JS_RECONSTRUCT(CLBeaconRegion);
  @autoreleasepool {
    CLBeaconRegion* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLBeaconRegion *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLBeaconRegion alloc] init];
    }
    if (self) {
      NCLBeaconRegion *wrapper = new NCLBeaconRegion();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLBeaconRegion::New: invalid arguments");
    }
  }
}

#include "NNSUUID.h"

NAN_METHOD(NCLBeaconRegion::initWithProximityUUIDIdentifier) {
  JS_UNWRAP_OR_ALLOC(CLBeaconRegion, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSUUID, proximityUUID);
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_instancetype([self initWithProximityUUID: proximityUUID identifier: identifier]));
  }
}

NAN_METHOD(NCLBeaconRegion::initWithProximityUUIDMajorIdentifier) {
  JS_UNWRAP_OR_ALLOC(CLBeaconRegion, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSUUID, proximityUUID);
    declare_value(CLBeaconMajorValue, major);
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_instancetype([self initWithProximityUUID: proximityUUID major: major identifier: identifier]));
  }
}

NAN_METHOD(NCLBeaconRegion::initWithProximityUUIDMajorMinorIdentifier) {
  JS_UNWRAP_OR_ALLOC(CLBeaconRegion, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSUUID, proximityUUID);
    declare_value(CLBeaconMajorValue, major);
    declare_value(CLBeaconMinorValue, minor);
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_instancetype([self initWithProximityUUID: proximityUUID major: major minor: minor identifier: identifier]));
  }
}

NAN_METHOD(NCLBeaconRegion::peripheralDataWithMeasuredPower) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSNumber, measuredPower);
    JS_SET_RETURN(js_value_NSMutableDictionary/* <NSString*, id>*/([self peripheralDataWithMeasuredPower: measuredPower]));
  }
}

NAN_GETTER(NCLBeaconRegion::proximityUUIDGetter) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUUID([self proximityUUID]));
  }
}

NAN_GETTER(NCLBeaconRegion::majorGetter) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self major]));
  }
}

NAN_GETTER(NCLBeaconRegion::minorGetter) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSNumber([self minor]));
  }
}

NAN_GETTER(NCLBeaconRegion::notifyEntryStateOnDisplayGetter) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self notifyEntryStateOnDisplay]));
  }
}

NAN_SETTER(NCLBeaconRegion::notifyEntryStateOnDisplaySetter) {
  JS_UNWRAP(CLBeaconRegion, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNotifyEntryStateOnDisplay: input];
  }
}
