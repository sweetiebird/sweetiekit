//
//  SCNFloor.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNFloor.h"

NSCNFloor::NSCNFloor () {}
NSCNFloor::~NSCNFloor () {}

JS_INIT_CLASS(SCNFloor, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, reflectivity);
  JS_ASSIGN_PROP(proto, reflectionFalloffStart);
  JS_ASSIGN_PROP(proto, reflectionFalloffEnd);
  JS_ASSIGN_PROP(proto, reflectionCategoryBitMask);
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, length);
  JS_ASSIGN_PROP(proto, reflectionResolutionScaleFactor);
  // static members (ctor)
  JS_INIT_CTOR(SCNFloor, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, floor);
JS_INIT_CLASS_END(SCNFloor, SCNGeometry);

SCNFloor*
SCNFloor_floor()
{
  return [SCNFloor floor];
}

NAN_METHOD(NSCNFloor::floor) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNFloor_floor())
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNFloor, argv));
  }
}

NAN_METHOD(NSCNFloor::New) {
  JS_RECONSTRUCT(SCNFloor);
  @autoreleasepool {
    SCNFloor* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNFloor *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && info[0]->IsObject()) {
      self = SCNFloor_floor();
    } else if (info.Length() <= 0) {
      self = [[SCNFloor alloc] init];
    }
    if (self) {
      NSCNFloor *wrapper = new NSCNFloor();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else if (info.Length() <= 0) {
      Nan::ThrowError("SCNFloor::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNFloor::reflectivityGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self reflectivity]));
    return;
  }
}

NAN_SETTER(NSCNFloor::reflectivitySetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setReflectivity: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNFloor::reflectionFalloffStartGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self reflectionFalloffStart]));
    return;
  }
}

NAN_SETTER(NSCNFloor::reflectionFalloffStartSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setReflectionFalloffStart: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNFloor::reflectionFalloffEndGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self reflectionFalloffEnd]));
    return;
  }
}

NAN_SETTER(NSCNFloor::reflectionFalloffEndSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setReflectionFalloffEnd: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNFloor::reflectionCategoryBitMaskGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSUInteger([self reflectionCategoryBitMask]));
    return;
  }
}

NAN_SETTER(NSCNFloor::reflectionCategoryBitMaskSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setReflectionCategoryBitMask: to_value_NSUInteger(value)];
  }
}

NAN_GETTER(NSCNFloor::widthGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNFloor::widthSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNFloor::lengthGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self length]));
    return;
  }
}

NAN_SETTER(NSCNFloor::lengthSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setLength: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNFloor::reflectionResolutionScaleFactorGetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self reflectionResolutionScaleFactor]));
    return;
  }
}

NAN_SETTER(NSCNFloor::reflectionResolutionScaleFactorSetter) {
  JS_UNWRAP(SCNFloor, self);
  @autoreleasepool
  {
    [self setReflectionResolutionScaleFactor: TO_FLOAT(value)];
  }
}
