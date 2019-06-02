//
//  UIBezierPath.mm
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIBezierPath.h"

NUIBezierPath::NUIBezierPath() {}
NUIBezierPath::~NUIBezierPath() {}

JS_INIT_CLASS(UIBezierPath, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROP(proto, lineWidth);
  JS_ASSIGN_METHOD(proto, moveToPoint);
  // static members (ctor)
  JS_INIT_CTOR(UIBezierPath, NSObject);
  JS_ASSIGN_METHOD(ctor, bezierPath);
  JS_ASSIGN_METHOD(ctor, bezierPathWithRect);
  JS_ASSIGN_METHOD(ctor, bezierPathWithOvalInRect);
  JS_ASSIGN_METHOD(ctor, bezierPathWithArcCenter);
JS_INIT_CLASS_END(UIBezierPath, NSObject);

NAN_METHOD(NUIBezierPath::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUIBezierPath *ui = new NUIBezierPath();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UIBezierPath *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UIBezierPath alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

// ======= static initializers

NAN_METHOD(NUIBezierPath::bezierPath) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIBezierPath)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIBezierPath *ui = ObjectWrap::Unwrap<NUIBezierPath>(obj);

  @autoreleasepool {
    ui->SetNSObject([UIBezierPath bezierPath]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIBezierPath::bezierPathWithRect) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIBezierPath)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIBezierPath *ui = ObjectWrap::Unwrap<NUIBezierPath>(obj);

  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    double w = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    ui->SetNSObject([UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIBezierPath::bezierPathWithOvalInRect) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIBezierPath)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIBezierPath *ui = ObjectWrap::Unwrap<NUIBezierPath>(obj);

  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    double w = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("height")));
    ui->SetNSObject([UIBezierPath bezierPathWithOvalInRect:CGRectMake(x, y, w, h)]);
  }

  JS_SET_RETURN(obj);
}

NAN_METHOD(NUIBezierPath::bezierPathWithArcCenter) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NUIBezierPath)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NUIBezierPath *ui = ObjectWrap::Unwrap<NUIBezierPath>(obj);

  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    CGPoint center = CGPointMake(x, y);
    double radius = TO_DOUBLE(info[1]);
    double startAngle = TO_DOUBLE(info[2]);
    double endAngle = TO_DOUBLE(info[3]);
    BOOL clockwise = TO_BOOL(info[4]);
    ui->SetNSObject([UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise]);
  }

  JS_SET_RETURN(obj);
}

// ======= methods

NAN_METHOD(NUIBezierPath::moveToPoint) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIBezierPath, ui);

  __block CGPoint pt;

  @autoreleasepool {
    double x = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("x")));
    double y = TO_DOUBLE(JS_OBJ(info[0])->Get(JS_STR("y")));
    pt = CGPointMake(x, y);
  }

  [ui moveToPoint:pt];
}

// ======= getters/setters

NAN_GETTER(NUIBezierPath::lineWidthGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIBezierPath, ui);
  
  __block CGFloat width;
  
  @autoreleasepool {
    width = [ui lineWidth];
  }
  
  JS_SET_RETURN(JS_FLOAT(width));
}

NAN_SETTER(NUIBezierPath::lineWidthSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIBezierPath, ui);
  
  @autoreleasepool {
    float width = TO_FLOAT(value);
    [ui setLineWidth:width];
  }
}
