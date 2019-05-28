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

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNSphere::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNSphere *ui = new NSCNSphere();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNSphere *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNSphere alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
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

