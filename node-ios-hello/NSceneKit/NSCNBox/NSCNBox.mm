//
//  SCNBox.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNBox.h"

Nan::Persistent<FunctionTemplate> NSCNBox::type;

NSCNBox::NSCNBox () {}
NSCNBox::~NSCNBox () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNBox::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NSCNGeometry::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNBox"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate(); proto = proto;
  JS_ASSIGN_PROP(proto, width);
  JS_ASSIGN_PROP(proto, height);
  JS_ASSIGN_PROP(proto, length);
  JS_ASSIGN_PROP(proto, chamferRadius);
  JS_ASSIGN_PROP(proto, widthSegmentCount);
  JS_ASSIGN_PROP(proto, heightSegmentCount);
  JS_ASSIGN_PROP(proto, lengthSegmentCount);
  JS_ASSIGN_PROP(proto, chamferSegmentCount);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNBox::New) {
  @autoreleasepool {
    Local<Object> obj = info.This();

    NSCNBox *ui = new NSCNBox();

    if (info[0]->IsExternal()) {
      ui->SetNSObject((__bridge SCNBox *)(info[0].As<External>()->Value()));
    } else {
      ui->SetNSObject([[SCNBox alloc] init]);
    }
    ui->Wrap(obj);

    JS_SET_RETURN(obj);
  }
}

NAN_GETTER(NSCNBox::widthGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self width]));
    return;
  }
}

NAN_SETTER(NSCNBox::widthSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setWidth: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNBox::heightGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self height]));
    return;
  }
}

NAN_SETTER(NSCNBox::heightSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setHeight: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNBox::lengthGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self length]));
    return;
  }
}

NAN_SETTER(NSCNBox::lengthSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setLength: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNBox::chamferRadiusGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(JS_FLOAT([self chamferRadius]));
    return;
  }
}

NAN_SETTER(NSCNBox::chamferRadiusSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setChamferRadius: TO_FLOAT(value)];
  }
}

NAN_GETTER(NSCNBox::widthSegmentCountGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self widthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNBox::widthSegmentCountSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setWidthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNBox::heightSegmentCountGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self heightSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNBox::heightSegmentCountSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setHeightSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNBox::lengthSegmentCountGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self lengthSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNBox::lengthSegmentCountSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setLengthSegmentCount: to_value_NSInteger(value)];
  }
}

NAN_GETTER(NSCNBox::chamferSegmentCountGetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self chamferSegmentCount]));
    return;
  }
}

NAN_SETTER(NSCNBox::chamferSegmentCountSetter) {
  JS_UNWRAP(SCNBox, self);
  @autoreleasepool
  {
    [self setChamferSegmentCount: to_value_NSInteger(value)];
  }
}
