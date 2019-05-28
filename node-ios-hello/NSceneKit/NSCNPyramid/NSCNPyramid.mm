//
//  SCNPyramid.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNPyramid.h"

Nan::Persistent<FunctionTemplate> NSCNPyramid::type;

NSCNPyramid::NSCNPyramid () {}
NSCNPyramid::~NSCNPyramid () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNPyramid::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNPyramid"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, length);
  JS_ASSIGN_PROP(proto, widthSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, lengthSegmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNPyramid::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNPyramid *ui = new NSCNPyramid();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNPyramid *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNPyramid alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

NAN_GETTER(NSCNPyramid::widthGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::widthSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::heightGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::heightSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::lengthGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self length]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::lengthSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setLength: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPyramid::widthSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self widthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::widthSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setWidthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPyramid::heightSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::heightSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPyramid::lengthSegmentCountGetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self lengthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPyramid::lengthSegmentCountSetter) {
  JS_UNWRAP(SCNPyramid, self);
  @autoreleasepool
  {
    [self setLengthSegmentCount: to_value_NSInteger(value)];
  }
}
