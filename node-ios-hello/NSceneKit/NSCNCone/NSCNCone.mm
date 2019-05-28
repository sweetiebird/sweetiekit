//
//  SCNCone.mm
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNCone.h"

Nan::Persistent<FunctionTemplate> NSCNCone::type;

NSCNCone::NSCNCone () {}
NSCNCone::~NSCNCone () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNCone::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNCone"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, topRadius);
  JS_ASSIGN_PROP(proto, bottomRadius);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, radialSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNCone::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNCone *ui = new NSCNCone();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNCone *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNCone alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

NAN_GETTER(NSCNCone::topRadiusGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self topRadius]));
    return;
  }
}

NAN_SETTER(NSCNCone::topRadiusSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setTopRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::bottomRadiusGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self bottomRadius]));
    return;
  }
}

NAN_SETTER(NSCNCone::bottomRadiusSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setBottomRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::heightGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNCone::heightSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNCone::radialSegmentCountGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self radialSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCone::radialSegmentCountSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setRadialSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNCone::heightSegmentCountGetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNCone::heightSegmentCountSetter) {
  JS_UNWRAP(SCNCone, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

