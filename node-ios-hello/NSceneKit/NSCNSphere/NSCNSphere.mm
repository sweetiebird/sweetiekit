//
//  SCNSphere.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNSphere.h"

Nan::Persistent<FunctionTemplate> NSCNSphere::type;

NSCNSphere::NSCNSphere () {}
NSCNSphere::~NSCNSphere () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNSphere::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNSphere"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, radius);
  JS_ASSIGN_PROP(proto, geodesic);
  JS_ASSIGN_PROP(proto, segmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Local<Object> type(JS_OBJ(ctorFn)); type = type;
  JS_ASSIGN_METHOD(type, sphereWithRadius);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

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
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNSphere(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNSphere, info);
      return;
    }
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

