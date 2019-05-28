//
//  SKTransformNode.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NSKNode.h"
#include "NSKTransformNode.h"

Nan::Persistent<FunctionTemplate> NSKTransformNode::type;

NSKTransformNode::NSKTransformNode () {}
NSKTransformNode::~NSKTransformNode () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSKTransformNode::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSKNode::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SKTransformNode"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  JS_ASSIGN_PROP(proto, xRotation);
  JS_ASSIGN_PROP(proto, yRotation);
  JS_ASSIGN_PROP(proto, eulerAngles);
  JS_ASSIGN_PROP(proto, rotationMatrix);
  JS_ASSIGN_PROP(proto, quaternion);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSKTransformNode::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSKTransformNode *ui = new NSKTransformNode();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge SKTransformNode *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[SKTransformNode alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_GETTER(NSKTransformNode::xRotationGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self xRotation]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::xRotationSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setXRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKTransformNode::yRotationGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self yRotation]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::yRotationSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setYRotation: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSKTransformNode::eulerAnglesGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_vector_float3([self eulerAngles]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::eulerAnglesSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setEulerAngles: to_value_vector_float3(value)];
  }
}

NAN_GETTER(NSKTransformNode::rotationMatrixGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_matrix_float3x3([self rotationMatrix]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::rotationMatrixSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setRotationMatrix: to_value_matrix_float3x3(value)];
  }
}

NAN_GETTER(NSKTransformNode::quaternionGetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_simd_quatf([self quaternion]));
    return;
  }
}

NAN_SETTER(NSKTransformNode::quaternionSetter) {
  JS_UNWRAP(SKTransformNode, self);
  @autoreleasepool
  {
    [self setQuaternion: to_value_simd_quatf(value)];
  }
}
