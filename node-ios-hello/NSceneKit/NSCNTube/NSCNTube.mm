//
//  SCNTube.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNTube.h"

NSCNTube::NSCNTube() {}
NSCNTube::~NSCNTube() {}

JS_INIT_CLASS(SCNTube, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, innerRadius);
  JS_ASSIGN_PROP(proto, outerRadius);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, radialSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNTube, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, tubeWithInnerRadiusOuterRadiusHeight);
JS_INIT_CLASS_END(SCNTube, SCNGeometry);

SCNTube*
SCNTube_tubeWithInnerRadiusOuterRadiusHeight(
  Local<Value> innerRadius, 
  Local<Value> outerRadius,
  Local<Value> height)
{
  return [SCNTube
            tubeWithInnerRadius:TO_FLOAT(innerRadius)
            outerRadius:TO_FLOAT(outerRadius)
            height:TO_FLOAT(height)];
}

NAN_METHOD(NSCNTube::tubeWithInnerRadiusOuterRadiusHeight) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNTube_tubeWithInnerRadiusOuterRadiusHeight(info[0], info[1], info[2]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNTube, argv));
  }
}
  
NAN_METHOD(NSCNTube::New) {
  JS_RECONSTRUCT(SCNTube);
  @autoreleasepool {
    SCNTube* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNTube *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 3) {
      self = SCNTube_tubeWithInnerRadiusOuterRadiusHeight(info[0], info[1], info[2]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("innerRadius"))) {
      self = SCNTube_tubeWithInnerRadiusOuterRadiusHeight(
          JS_OBJ(info[0])->Get(JS_STR("innerRadius")),
          JS_OBJ(info[0])->Get(JS_STR("outerRadius")),
          JS_OBJ(info[0])->Get(JS_STR("height"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNTube alloc] init];
    }
    if (self) {
      NSCNTube *wrapper = new NSCNTube();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNTube::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNTube::innerRadiusGetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self innerRadius]));
    return;
  }
}

NAN_SETTER(NSCNTube::innerRadiusSetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    [self setInnerRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNTube::outerRadiusGetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self outerRadius]));
    return;
  }
}

NAN_SETTER(NSCNTube::outerRadiusSetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    [self setOuterRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNTube::heightGetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNTube::heightSetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNTube::radialSegmentCountGetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self radialSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNTube::radialSegmentCountSetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    [self setRadialSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNTube::heightSegmentCountGetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNTube::heightSegmentCountSetter) {
  JS_UNWRAP(SCNTube, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

