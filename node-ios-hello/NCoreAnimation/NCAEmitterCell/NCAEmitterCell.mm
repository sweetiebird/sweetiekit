//
//  CAEmitterCell.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NCAEmitterCell.h"
#include "NUIImage.h"

Nan::Persistent<FunctionTemplate> NCAEmitterCell::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NCAEmitterCell::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("CAEmitterCell"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_ASSIGN_PROP(proto, contents);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();
  Nan::SetMethod(ctorFn, "emitterCell", emitterCell);

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NCAEmitterCell::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NCAEmitterCell *ui = new NCAEmitterCell();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge CAEmitterCell *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[CAEmitterCell alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NCAEmitterCell::NCAEmitterCell () {}
NCAEmitterCell::~NCAEmitterCell () {}

NAN_METHOD(NCAEmitterCell::emitterCell) {
  Nan::EscapableHandleScope scope;

  Local<Value> argv[] = {
  };
  Local<Object> obj = JS_TYPE(NCAEmitterCell)->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  NCAEmitterCell *ui = ObjectWrap::Unwrap<NCAEmitterCell>(obj);

  @autoreleasepool {
    ui->SetNSObject([CAEmitterCell emitterCell]);
  }

  JS_SET_RETURN(obj);
}

NAN_GETTER(NCAEmitterCell::contentsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ca contents], NNSObject::type)));
}

NAN_SETTER(NCAEmitterCell::contentsSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(CAEmitterCell, ca);
  
  Local<Object> obj = JS_OBJ(value);
  NUIImage *img = ObjectWrap::Unwrap<NUIImage>(obj);

  @autoreleasepool {
    [ca setContents:img->As<UIImage>()];
  }
}

