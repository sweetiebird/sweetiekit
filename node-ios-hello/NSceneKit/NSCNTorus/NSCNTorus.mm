//
//  SCNTorus.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNTorus.h"

Nan::Persistent<FunctionTemplate> NSCNTorus::type;

NSCNTorus::NSCNTorus () {}
NSCNTorus::~NSCNTorus () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNTorus::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNTorus"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, ringRadius);
  JS_ASSIGN_PROP(proto, pipeRadius);
  JS_ASSIGN_PROP(proto, ringSegmentCount);
  JS_ASSIGN_PROP(proto, pipeSegmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNTorus::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNTorus *ui = new NSCNTorus();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNTorus *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNTorus alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
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

