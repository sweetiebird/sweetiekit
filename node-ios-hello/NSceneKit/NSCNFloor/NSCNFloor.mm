//
//  SCNFloor.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNFloor.h"

NSCNFloor::NSCNFloor () {}
NSCNFloor::~NSCNFloor () {}

Nan::Persistent<FunctionTemplate> NSCNFloor::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNFloor::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNFloor"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, reflectivity);
  JS_ASSIGN_PROP(proto, reflectionFalloffStart);
  JS_ASSIGN_PROP(proto, reflectionFalloffEnd);
  JS_ASSIGN_PROP(proto, reflectionCategoryBitMask);
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, length);
  JS_ASSIGN_PROP(proto, reflectionResolutionScaleFactor);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  JS_ASSIGN_METHOD(ctorFn, floor);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

#include "NUIBezierPath.h"

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
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNFloor(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNFloor, info);
      return;
    }
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
