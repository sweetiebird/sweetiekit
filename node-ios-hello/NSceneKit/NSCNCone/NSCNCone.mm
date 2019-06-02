//
//  SCNCone.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNCone.h"

NSCNCone::NSCNCone () {}
NSCNCone::~NSCNCone () {}

JS_INIT_CLASS(SCNCone, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, topRadius);
  JS_ASSIGN_PROP(proto, bottomRadius);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, radialSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNCone, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, coneWithTopRadiusBottomRadiusHeight);
JS_INIT_CLASS_END(SCNCone, SCNGeometry);

SCNCone*
SCNCone_coneWithTopRadiusBottomRadiusHeight(
  Local<Value> topRadius, 
  Local<Value> bottomRadius,
  Local<Value> height)
{
  return [SCNCone
            coneWithTopRadius:TO_FLOAT(topRadius)
            bottomRadius:TO_FLOAT(bottomRadius)
            height:TO_FLOAT(height)];
}

NAN_METHOD(NSCNCone::coneWithTopRadiusBottomRadiusHeight) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNCone_coneWithTopRadiusBottomRadiusHeight(info[0], info[1], info[2]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNCone, argv));
  }
}
  
NAN_METHOD(NSCNCone::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNCone(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNCone, info);
      return;
    }
    SCNCone* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNCone *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 3) {
      self = SCNCone_coneWithTopRadiusBottomRadiusHeight(info[0], info[1], info[2]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("topRadius"))) {
      self = SCNCone_coneWithTopRadiusBottomRadiusHeight(
          JS_OBJ(info[0])->Get(JS_STR("topRadius")),
          JS_OBJ(info[0])->Get(JS_STR("bottomRadius")),
          JS_OBJ(info[0])->Get(JS_STR("height"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNCone alloc] init];
    }
    if (self) {
      NSCNCone *wrapper = new NSCNCone();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNCone::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNCone::topRadiusGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self topRadius]));
    return;
  }
}

NAN_SETTER(NSCNCone::topRadiusSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setTopRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::bottomRadiusGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self bottomRadius]));
    return;
  }
}

NAN_SETTER(NSCNCone::bottomRadiusSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setBottomRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::heightGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNCone::heightSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::radialSegmentCountGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self radialSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCone::radialSegmentCountSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setRadialSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCone::heightSegmentCountGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCone::heightSegmentCountSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

