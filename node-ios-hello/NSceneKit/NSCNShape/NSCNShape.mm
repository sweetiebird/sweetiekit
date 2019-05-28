//
//  SCNShape.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNShape.h"

Nan::Persistent<FunctionTemplate> NSCNShape::type;

NSCNShape::NSCNShape () {}
NSCNShape::~NSCNShape () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNShape::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNShape"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, path);
  JS_ASSIGN_PROP(proto, extrusionDepth);
  JS_ASSIGN_PROP(proto, chamferMode);
  JS_ASSIGN_PROP(proto, chamferRadius);
  JS_ASSIGN_PROP(proto, chamferProfile);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNShape::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNShape *ui = new NSCNShape();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNShape *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNShape alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

#include "NUIBezierPath.h"

NAN_GETTER(NSCNShape::pathGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIBezierPath([self path]));
    return;
  }
}

NAN_SETTER(NSCNShape::pathSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setPath: to_value_UIBezierPath(value)];
  }
}

NAN_GETTER(NSCNShape::extrusionDepthGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self extrusionDepth]));
    return;
  }
}

NAN_SETTER(NSCNShape::extrusionDepthSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setExtrusionDepth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNShape::chamferModeGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_SCNChamferMode([self chamferMode]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferModeSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferMode: to_value_SCNChamferMode(value)];
  }
}

NAN_GETTER(NSCNShape::chamferRadiusGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self chamferRadius]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferRadiusSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNShape::chamferProfileGetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIBezierPath([self chamferProfile]));
    return;
  }
}

NAN_SETTER(NSCNShape::chamferProfileSetter) {
  JS_UNWRAP(SCNShape, self);
  @autoreleasepool
  {
    [self setChamferProfile: to_value_UIBezierPath(value)];
  }
}
