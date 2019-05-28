//
//  SCNPlane.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNPlane.h"

Nan::Persistent<FunctionTemplate> NSCNPlane::type;

NSCNPlane::NSCNPlane () {}
NSCNPlane::~NSCNPlane () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNPlane::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNPlane"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, widthSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, cornerRadius);
  JS_ASSIGN_PROP(proto, cornerSegmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNPlane::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNPlane *ui = new NSCNPlane();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNPlane *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNPlane alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

NAN_GETTER(NSCNPlane::widthGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNPlane::widthSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::heightGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNPlane::heightSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::widthSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self widthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::widthSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setWidthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPlane::heightSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::heightSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNPlane::cornerRadiusGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self cornerRadius]));
    return;
  }
}

NAN_SETTER(NSCNPlane::cornerRadiusSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setCornerRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNPlane::cornerSegmentCountGetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self cornerSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNPlane::cornerSegmentCountSetter) {
  JS_UNWRAP(SCNPlane, self);
  @autoreleasepool
  {
    [self setCornerSegmentCount: to_value_NSInteger(value)];
  }
}
