//
//  NUITextField.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITextField.h"

std::pair<Local<Object>, Local<FunctionTemplate>> NUITextField::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITextField"));

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITextField::New) {
  Nan::HandleScope scope;

  Local<Object> tfObj = info.This();

  NUITextField *field = new NUITextField();

  double x = TO_DOUBLE(info[0]);
  double y = TO_DOUBLE(info[1]);
  double width = TO_DOUBLE(info[2]);
  double height = TO_DOUBLE(info[3]);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
        field->SetNSObject([[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)]);
    });
  }
  field->Wrap(tfObj);

  info.GetReturnValue().Set(tfObj);
}

NUITextField::NUITextField () {}
NUITextField::~NUITextField () {}

