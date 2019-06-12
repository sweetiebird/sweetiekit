//
//  SCNCylinder.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNCylinder.h"

NSCNCylinder::NSCNCylinder () {}
NSCNCylinder::~NSCNCylinder () {}

JS_INIT_CLASS(SCNCylinder, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, radius);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, radialSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNCylinder, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, cylinderWithRadiusHeight);
JS_INIT_CLASS_END(SCNCylinder, SCNGeometry);

SCNCylinder*
SCNCylinder_cylinderWithRadiusHeight(
  Local<Value> radius,
  Local<Value> height)
{
  return [SCNCylinder
            cylinderWithRadius:TO_FLOAT(radius)
            height:TO_FLOAT(height)];
}

NAN_METHOD(NSCNCylinder::cylinderWithRadiusHeight) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNCylinder_cylinderWithRadiusHeight(info[0], info[1]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNCylinder, argv));
  }
}

NAN_METHOD(NSCNCylinder::New) {
  JS_RECONSTRUCT(SCNCylinder);
  @autoreleasepool {
    SCNCylinder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNCylinder *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 2 && info[0]->IsNumber()) {
      self = SCNCylinder_cylinderWithRadiusHeight(info[0], info[1]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("radius"))) {
      self = SCNCylinder_cylinderWithRadiusHeight(
          JS_OBJ(info[0])->Get(JS_STR("radius")),
          JS_OBJ(info[0])->Get(JS_STR("height"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNCylinder alloc] init];
    }
    if (self) {
      NSCNCylinder *wrapper = new NSCNCylinder();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else if (info.Length() <= 0) {
      Nan::ThrowError("SCNCylinder::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNCylinder::radiusGetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self radius]));
    return;
  }
}

NAN_SETTER(NSCNCylinder::radiusSetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    [self setRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCylinder::heightGetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNCylinder::heightSetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCylinder::radialSegmentCountGetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self radialSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCylinder::radialSegmentCountSetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    [self setRadialSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCylinder::heightSegmentCountGetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCylinder::heightSegmentCountSetter) {
  JS_UNWRAP(SCNCylinder, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

