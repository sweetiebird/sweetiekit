//
//  CAShapeLayer.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-25.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NNSObject.h"
#include "NCALayer.h"
#include "NCAShapeLayer.h"
#include "NUIBezierPath.h"

Nan::Persistent<FunctionTemplate> NCAShapeLayer::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCAShapeLayer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NCALayer::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CAShapeLayer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, lineWidth);
  JS_ASSIGN_PROP(proto, fillColor);
  JS_ASSIGN_PROP(proto, strokeColor);
  JS_ASSIGN_PROP(proto, path);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCAShapeLayer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCAShapeLayer *ui = new NCAShapeLayer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAShapeLayer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAShapeLayer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NCAShapeLayer::NCAShapeLayer () {}
NCAShapeLayer::~NCAShapeLayer () {}

NAN_GETTER(NCAShapeLayer::lineWidthGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);
  
  JS_SET_RETURN(JS_NUM([ca lineWidth]));
  
}

NAN_SETTER(NCAShapeLayer::lineWidthSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);

  @autoreleasepool {
    float val = TO_FLOAT(value);
    [ca setLineWidth:val];
  }
}

NAN_GETTER(NCAShapeLayer::fillColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);
  
  JS_SET_RETURN(sweetiekit::JSObjFromCGColor([ca fillColor]));
}

NAN_SETTER(NCAShapeLayer::fillColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);

  @autoreleasepool {
    CGColorRef color = sweetiekit::CGColorRefFromJSColor(JS_OBJ(value));
    [ca setFillColor:color];
  }
}

NAN_GETTER(NCAShapeLayer::strokeColorGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);
  
  JS_SET_RETURN(sweetiekit::JSObjFromCGColor([ca strokeColor]));
}

NAN_SETTER(NCAShapeLayer::strokeColorSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);

  @autoreleasepool {
    CGColorRef color = sweetiekit::CGColorRefFromJSColor(JS_OBJ(value));
    [ca setStrokeColor:color];
  }
}

NAN_GETTER(NCAShapeLayer::pathGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);
  
  UIBezierPath *bp = [UIBezierPath bezierPathWithCGPath:[ca path]];

  JS_SET_RETURN(sweetiekit::GetWrapperFor(bp, NUIBezierPath::type));
}

NAN_SETTER(NCAShapeLayer::pathSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(CAShapeLayer, ca);

  Local<Object> obj = JS_OBJ(value);
  NUIBezierPath *p = ObjectWrap::Unwrap<NUIBezierPath>(obj);

  @autoreleasepool {
    [ca setPath:p->As<UIBezierPath>().CGPath];
  }
}
