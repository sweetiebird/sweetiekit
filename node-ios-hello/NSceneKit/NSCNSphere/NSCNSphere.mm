//
//  SCNSphere.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNSphere.h"

NSCNSphere::NSCNSphere() {}
NSCNSphere::~NSCNSphere() {}

JS_INIT_CLASS(SCNSphere, SCNGeometry);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, radius);
  JS_ASSIGN_PROP(proto, geodesic);
  JS_ASSIGN_PROP(proto, segmentCount);
  // static members (ctor)
  JS_INIT_CTOR(SCNSphere, SCNGeometry);
  JS_ASSIGN_METHOD(ctor, sphereWithRadius);
JS_INIT_CLASS_END(SCNSphere, SCNGeometry);

SCNSphere*
SCNSphere_sphereWithRadius(
  Local<Value> radius)
{
  return [SCNSphere
            sphereWithRadius:TO_FLOAT(radius)];
}

NAN_METHOD(NSCNSphere::sphereWithRadius) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNSphere_sphereWithRadius(info[0]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNSphere, argv));
  }
}

NAN_METHOD(NSCNSphere::New) {
  JS_RECONSTRUCT(SCNSphere);
  @autoreleasepool {
    SCNSphere* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNSphere *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && info[0]->IsNumber()) {
      self = SCNSphere_sphereWithRadius(info[0]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("radius"))) {
      self = SCNSphere_sphereWithRadius(
          JS_OBJ(info[0])->Get(JS_STR("radius"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNSphere alloc] init];
    }
    if (self) {
      NSCNSphere *wrapper = new NSCNSphere();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNSphere::New: invalid arguments");
    }
  }
}

NAN_GETTER(NSCNSphere::radiusGetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self radius]));
    return;
  }
}

NAN_SETTER(NSCNSphere::radiusSetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    [self setRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNSphere::geodesicGetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_BOOL([self isGeodesic]));
    return;
  }
}

NAN_SETTER(NSCNSphere::geodesicSetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    [self setGeodesic: TO_BOOL(value)];
  }
}

NAN_GETTER(NSCNSphere::segmentCountGetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self segmentCount]));
    return;
  }
}

NAN_SETTER(NSCNSphere::segmentCountSetter) {
  JS_UNWRAP(SCNSphere, self);
  @autoreleasepool
  {
    [self setSegmentCount: to_value_NSInteger(value)];
  }
}

