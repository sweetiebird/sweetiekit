//
//  CAShapeLayer.mm
//
//  Created by Emily Kolar on 2019-5-25.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCAShapeLayer.h"
#include "NUIBezierPath.h"

NCAShapeLayer::NCAShapeLayer () {}
NCAShapeLayer::~NCAShapeLayer () {}

JS_INIT_CLASS(CAShapeLayer, CALayer);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, lineWidth);
  JS_ASSIGN_PROP(proto, fillColor);
  JS_ASSIGN_PROP(proto, strokeColor);
  JS_ASSIGN_PROP(proto, path);
  // static members (ctor)
  JS_INIT_CTOR(CAShapeLayer, CALayer);
JS_INIT_CLASS_END(CAShapeLayer, CALayer);

NAN_METHOD(NCAShapeLayer::New) {
  JS_RECONSTRUCT(CAShapeLayer);

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
