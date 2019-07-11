//
//  NMKUserLocation.mm
//
//  Created by Shawn Presser on 6/23/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMKUserLocation.h"

#define instancetype MKUserLocation
#define js_value_instancetype js_value_MKUserLocation

NMKUserLocation::NMKUserLocation() {}
NMKUserLocation::~NMKUserLocation() {}

JS_INIT_CLASS(MKUserLocation, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(isUpdating);
  JS_ASSIGN_PROTO_PROP_READONLY(location);
  JS_ASSIGN_PROTO_PROP_READONLY(heading);
  JS_ASSIGN_PROTO_PROP(title);
  JS_ASSIGN_PROTO_PROP(subtitle);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(MKUserLocation, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(MKUserLocation, NSObject);

NAN_METHOD(NMKUserLocation::New) {
  JS_RECONSTRUCT(MKUserLocation);
  @autoreleasepool {
    MKUserLocation* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge MKUserLocation *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[MKUserLocation alloc] init];
    }
    if (self) {
      NMKUserLocation *wrapper = new NMKUserLocation();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MKUserLocation::New: invalid arguments");
    }
  }
}

NAN_GETTER(NMKUserLocation::isUpdatingGetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isUpdating]));
  }
}

#include "NCLLocation.h"

NAN_GETTER(NMKUserLocation::locationGetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLLocation([self location]));
  }
}

#include "NCLHeading.h"

NAN_GETTER(NMKUserLocation::headingGetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CLHeading([self heading]));
  }
}

NAN_GETTER(NMKUserLocation::titleGetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self title]));
  }
}

NAN_SETTER(NMKUserLocation::titleSetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setTitle: input];
  }
}

NAN_GETTER(NMKUserLocation::subtitleGetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self subtitle]));
  }
}

NAN_SETTER(NMKUserLocation::subtitleSetter) {
  JS_UNWRAP(MKUserLocation, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setSubtitle: input];
  }
}
