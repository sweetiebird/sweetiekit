//
//  NCLRegion.mm
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCLRegion.h"

#define instancetype CLRegion
#define js_value_instancetype js_value_CLRegion

NCLRegion::NCLRegion() {}
NCLRegion::~NCLRegion() {}

JS_INIT_CLASS(CLRegion, NSObject);
  JS_ASSIGN_STATIC_METHOD(initCircularRegionWithCenterRadiusIdentifier);
  JS_ASSIGN_PROTO_METHOD(containsCoordinate);
  JS_ASSIGN_PROTO_PROP_READONLY(center);
  JS_ASSIGN_PROTO_PROP_READONLY(radius);
  JS_ASSIGN_PROTO_PROP_READONLY(identifier);
  JS_ASSIGN_PROTO_PROP(notifyOnEntry);
  JS_ASSIGN_PROTO_PROP(notifyOnExit);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CLRegion, NSObject);
  // constant values (exports)

  //typedef NS_CLOSED_ENUM(NSInteger, CLRegionState) {
    JS_ASSIGN_ENUM(CLRegionStateUnknown, NSInteger);
    JS_ASSIGN_ENUM(CLRegionStateInside, NSInteger);
    JS_ASSIGN_ENUM(CLRegionStateOutside, NSInteger);
  //} API_AVAILABLE(macos(10.10), ios(7.0)) API_UNAVAILABLE(watchos, tvos);

  //typedef NS_ENUM(NSInteger, CLProximity) {
    JS_ASSIGN_ENUM(CLProximityUnknown, NSInteger);
    JS_ASSIGN_ENUM(CLProximityImmediate, NSInteger);
    JS_ASSIGN_ENUM(CLProximityNear, NSInteger);
    JS_ASSIGN_ENUM(CLProximityFar, NSInteger);
  //} API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(watchos, tvos);

JS_INIT_CLASS_END(CLRegion, NSObject);

NAN_METHOD(NCLRegion::New) {
  JS_RECONSTRUCT(CLRegion);
  @autoreleasepool {
    CLRegion* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CLRegion *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CLRegion alloc] init];
    }
    if (self) {
      NCLRegion *wrapper = new NCLRegion();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CLRegion::New: invalid arguments");
    }
  }
}

#include "NCLLocation.h"

NAN_METHOD(NCLRegion::initCircularRegionWithCenterRadiusIdentifier) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, center);
    declare_value(CLLocationDistance, radius);
    declare_pointer(NSString, identifier);
    JS_SET_RETURN(js_value_instancetype([[CLRegion alloc] initCircularRegionWithCenter: center radius: radius identifier: identifier]));
  }
}

NAN_METHOD(NCLRegion::containsCoordinate) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CLLocationCoordinate2D, coordinate);
    JS_SET_RETURN(js_value_BOOL([self containsCoordinate: coordinate]));
  }
}

NAN_GETTER(NCLRegion::centerGetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationCoordinate2D([self center]));
  }
}

NAN_GETTER(NCLRegion::radiusGetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocationDistance([self radius]));
  }
}

NAN_GETTER(NCLRegion::identifierGetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self identifier]));
  }
}

NAN_GETTER(NCLRegion::notifyOnEntryGetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self notifyOnEntry]));
  }
}

NAN_SETTER(NCLRegion::notifyOnEntrySetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNotifyOnEntry: input];
  }
}

NAN_GETTER(NCLRegion::notifyOnExitGetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self notifyOnExit]));
  }
}

NAN_SETTER(NCLRegion::notifyOnExitSetter) {
  JS_UNWRAP(CLRegion, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNotifyOnExit: input];
  }
}
