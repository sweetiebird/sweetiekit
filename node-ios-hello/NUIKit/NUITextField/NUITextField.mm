//
//  NUITextField.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUITextField.h"

Local<Object> NUITextField::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITextField"));

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();

  return scope.Escape(Nan::GetFunction(ctor).ToLocalChecked());
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
        field->textField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
    });
  }
  field->Wrap(tfObj);

  Nan::SetAccessor(tfObj, JS_STR("frame"), FrameGetter, FrameSetter);

  info.GetReturnValue().Set(tfObj);
}

NAN_GETTER(NUITextField::FrameGetter) {
  Nan::HandleScope scope;

  NUITextField *field = ObjectWrap::Unwrap<NUITextField>(info.This());
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT(field->GetFrame().size.width));
  result->Set(JS_STR("height"), JS_FLOAT(field->GetFrame().size.height));
  result->Set(JS_STR("x"), JS_FLOAT(field->GetFrame().origin.x));
  result->Set(JS_STR("y"), JS_FLOAT(field->GetFrame().origin.y));

  info.GetReturnValue().Set(result);
}

NAN_SETTER(NUITextField::FrameSetter) {
  Nan::HandleScope scope;

  NUITextField *field = ObjectWrap::Unwrap<NUITextField>(info.This());

  double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
  double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
  double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
  double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [field->textField frame] = CGRectMake(x, y, width, height);
    });
  }
}

CGRect NUITextField::GetFrame() {
  if (textField) {
   return [textField frame];
  } else {
    return CGRectMake(0, 0, 0, 0);
  }
}

Local<Object> makeUITextField() {
  Isolate *isolate = Isolate::GetCurrent();

  Nan::EscapableHandleScope scope;

  return scope.Escape(NUITextField::Initialize(isolate));
}

NUITextField::NUITextField () {}
NUITextField::~NUITextField () {}

