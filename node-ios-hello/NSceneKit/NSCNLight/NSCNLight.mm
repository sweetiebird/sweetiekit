//
//  NSCNLight.m
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <SceneKit/SceneKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NSCNLight.h"
#import "node_ios_hello-Swift.h"

Nan::Persistent<FunctionTemplate> NSCNLight::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NSCNLight::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("SCNLight"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "type", Type);
  JS_SET_PROP(proto, "color", Color);
  JS_SET_PROP(proto, "spotInnerAngle", SpotInnerAngle);
  JS_SET_PROP(proto, "spotOuterAngle", SpotOuterAngle);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NSCNLight::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NSCNLight *lt = new NSCNLight();

  if (info[0]->IsExternal()) {
    lt->SetNSObject((__bridge SCNLight *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      lt->SetNSObject([SCNLight light]);
    }
  }
  lt->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

NSCNLight::NSCNLight () {}
NSCNLight::~NSCNLight () {}

NAN_GETTER(NSCNLight::TypeGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  JS_SET_RETURN(JS_STR([[light type] UTF8String]));
}

NAN_SETTER(NSCNLight::TypeSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  std::string str;
  if (value->IsString()) {
    Nan::Utf8String utf8Value(Local<String>::Cast(value));
    str = *utf8Value;
  } else {
    Nan::ThrowError("invalid argument");
  }

  NSString *type = [NSString stringWithUTF8String:str.c_str()];

  SCNLightType lightType = SCNLightType(type);

  [light setType:lightType];
}

NAN_GETTER(NSCNLight::ColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  __block CGFloat red = 0;
  __block CGFloat green = 0;
  __block CGFloat blue = 0;
  __block CGFloat alpha = 1;
  @autoreleasepool {
    UIColor *color = [UIColor colorWithCGColor:(CGColorRef)[light color]];
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("red"), JS_NUM(red));
  result->Set(JS_STR("green"), JS_NUM(green));
  result->Set(JS_STR("blue"), JS_NUM(blue));
  result->Set(JS_STR("alpha"), JS_NUM(alpha));

  JS_SET_RETURN(result);
}

NAN_SETTER(NSCNLight::ColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  double red = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("red")));
  double green = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("green")));
  double blue = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("blue")));
  double alpha = JS_HAS(JS_OBJ(value), JS_STR("alpha")) ? TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("alpha"))) : 1.0;
  
  UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];

  @autoreleasepool {
    [light setColor:color];
  }
}

NAN_GETTER(NSCNLight::SpotInnerAngleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light spotInnerAngle]));
}

NAN_SETTER(NSCNLight::SpotInnerAngleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float angle = TO_FLOAT(value);

  @autoreleasepool {
    [light setSpotInnerAngle:angle];
  }
}

NAN_GETTER(NSCNLight::SpotOuterAngleGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);
  
  JS_SET_RETURN(JS_FLOAT([light spotOuterAngle]));
}

NAN_SETTER(NSCNLight::SpotOuterAngleSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(SCNLight, light);

  float angle = TO_FLOAT(value);

  @autoreleasepool {
    [light setSpotOuterAngle:angle];
  }
}
