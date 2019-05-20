//
//  CAEmitterLayer.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>

#include "defines.h"
#include "NCALayer.h"
#include "NCAEmitterLayer.h"
#include "NCAEmitterCell.h"

Nan::Persistent<FunctionTemplate> NCAEmitterLayer::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCAEmitterLayer::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NCALayer::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CAEmitterLayer"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, emitterCells);
  JS_ASSIGN_PROP(proto, emitterPosition);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCAEmitterLayer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCAEmitterLayer *ui = new NCAEmitterLayer();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAEmitterLayer *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAEmitterLayer alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NCAEmitterLayer::NCAEmitterLayer () {}
NCAEmitterLayer::~NCAEmitterLayer () {}

NAN_GETTER(NCAEmitterLayer::emitterCellsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterLayer, ca);
  
  JS_SET_RETURN(JS_NUM([ca velocity]));
}

NAN_SETTER(NCAEmitterLayer::emitterCellsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterLayer, ca);

  Local<Array> array = Local<Array>::Cast(value);
  
  NSMutableArray *cells = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NCAEmitterCell *cell = ObjectWrap::Unwrap<NCAEmitterCell>(JS_OBJ(array->Get(i)));
      [cells addObject:cell->As<CAEmitterCell>()];
    }
  }

  @autoreleasepool {
    [ca setEmitterCells:cells];
  }
}

NAN_GETTER(NCAEmitterLayer::emitterPositionGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterLayer, ca);
  
  CGPoint pt = [ca emitterPosition];

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(pt.x));
  result->Set(JS_STR("y"), JS_NUM(pt.y));

  JS_SET_RETURN(result);
}

NAN_SETTER(NCAEmitterLayer::emitterPositionSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterLayer, ca);

  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    [ca setEmitterPosition:CGPointMake(x, y)];
  }
}