//
//  SCNTorus.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNTorus.h"

NSCNTorus::NSCNTorus () {}
NSCNTorus::~NSCNTorus () {}

JS_INIT_CLASS(SCNTorus, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, ringRadius);
  JS_ASSIGN_PROP(proto, pipeRadius);
  JS_ASSIGN_PROP(proto, ringSegmentCount);
  JS_ASSIGN_PROP(proto, pipeSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNTorus, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, torusWithRingRadiusPipeRadius);
JS_INIT_CLASS_END(SCNTorus, SCNGeometry);

SCNTorus*
SCNTorus_torusWithRingRadiusPipeRadius(
  Local<Value> ringRadius,
  Local<Value> pipeRadius)
{
  return [SCNTorus
            torusWithRingRadius:TO_FLOAT(ringRadius)
            pipeRadius:TO_FLOAT(pipeRadius)];
}

NAN_METHOD(NSCNTorus::torusWithRingRadiusPipeRadius) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNTorus_torusWithRingRadiusPipeRadius(info[0], info[1]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNTorus, argv));
  }
}

NAN_METHOD(NSCNTorus::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNTorus(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNTorus, info);
      return;
    }
    SCNTorus* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNTorus *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 2 && info[0]->IsNumber()) {
      self = SCNTorus_torusWithRingRadiusPipeRadius(info[0], info[1]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("ringRadius"))) {
      self = SCNTorus_torusWithRingRadiusPipeRadius(
          JS_OBJ(info[0])->Get(JS_STR("ringRadius")),
          JS_OBJ(info[0])->Get(JS_STR("pipeRadius"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNTorus alloc] init];
    }
    if (self) {
      NSCNTorus *wrapper = new NSCNTorus();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else if (info.Length() <= 0) {
      Nan::ThrowError("SCNTorus::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNTorus::ringRadiusGetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self ringRadius]));
    return;
  }
}

NAN_SETTER(NSCNTorus::ringRadiusSetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    [self setRingRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNTorus::pipeRadiusGetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self pipeRadius]));
    return;
  }
}

NAN_SETTER(NSCNTorus::pipeRadiusSetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    [self setPipeRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNTorus::ringSegmentCountGetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self ringSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNTorus::ringSegmentCountSetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    [self setRingSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNTorus::pipeSegmentCountGetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self pipeSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNTorus::pipeSegmentCountSetter) {
  JS_UNWRAP(SCNTorus, self);
  @autoreleasepool
  {
    [self setPipeSegmentCount: to_value_NSInteger(value)];
  }
}

