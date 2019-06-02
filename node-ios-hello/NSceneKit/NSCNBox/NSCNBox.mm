//
//  SCNBox.m
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#include "NSCNBox.h"

NSCNBox::NSCNBox () {}
NSCNBox::~NSCNBox () {}

Nan::Persistent<FunctionTemplate> NSCNBox::type;

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
  Local<Object> type(JS_OBJ(ctorFn));
  JS_ASSIGN_METHOD(type, boxWithWidthHeightLengthChamferRadius);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

SCNBox*
SCNBox_boxWithWidthHeightLengthChamferRadius(
  Local<Value> width, 
  Local<Value> height,
  Local<Value> length,
  Local<Value> chamferRadius)
{
  return [SCNBox
            boxWithWidth:TO_FLOAT(width)
            height:TO_FLOAT(height)
            length:TO_FLOAT(length)
            chamferRadius:TO_FLOAT(chamferRadius)];
}

NAN_METHOD(NSCNBox::boxWithWidthHeightLengthChamferRadius) {
  @autoreleasepool
  {
    Local<Value> argv[] = {
      Nan::New<External>((__bridge void*)
        SCNBox_boxWithWidthHeightLengthChamferRadius(info[0], info[1], info[2], info[3]))
    };
    JS_SET_RETURN(JS_NEW_ARGV(NSCNBox, argv));
  }
}

NAN_METHOD(NSCNBox::New) {
  @autoreleasepool {
   if (!info.IsConstructCall()) {
      // Invoked as plain function `SCNBox(...)`, turn into construct call.
      JS_SET_RETURN_NEW(SCNBox, info);
      return;
    }
    SCNBox* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SCNBox *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 4) {
      self = SCNBox_boxWithWidthHeightLengthChamferRadius(info[0], info[1], info[2], info[3]);
    } else if (info.Length() >= 1 && info[0]->IsObject() && JS_HAS(JS_OBJ(info[0]), JS_STR("width"))) {
      self = SCNBox_boxWithWidthHeightLengthChamferRadius(
          JS_OBJ(info[0])->Get(JS_STR("width")),
          JS_OBJ(info[0])->Get(JS_STR("height")),
          JS_OBJ(info[0])->Get(JS_STR("length")),
          JS_OBJ(info[0])->Get(JS_STR("chamferRadius"))
        );
    } else if (info.Length() <= 0) {
      self = [[SCNBox alloc] init];
    }
    if (self) {
      NSCNBox *wrapper = new NSCNBox();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNBox::New: invalid arguments");
    }
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
