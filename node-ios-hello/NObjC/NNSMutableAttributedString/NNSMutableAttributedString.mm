//
//  NSMutableAttributedString.mm
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSMutableAttributedString.h"

NNSMutableAttributedString::NNSMutableAttributedString () {}
NNSMutableAttributedString::~NNSMutableAttributedString () {}

Nan::Persistent<FunctionTemplate> NNSMutableAttributedString::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NNSMutableAttributedString::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSAttributedString::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("NSMutableAttributedString"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "addAttribute", addAttribute);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NNSMutableAttributedString::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSMutableAttributedString *ui = new NNSMutableAttributedString();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSMutableAttributedString *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 1) {
    NSString* string = NJSStringToNSString(info[0]);
    if (string == nullptr) {
      Nan::ThrowError("Invalid argument");
      return;
    }
    @autoreleasepool {
      ui->SetNSObject([[NSMutableAttributedString alloc] initWithString:string]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[NSMutableAttributedString alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NAN_METHOD(NNSMutableAttributedString::addAttribute) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(NSMutableAttributedString, ns);
  
  @autoreleasepool {
    NSString* name = NJSStringToNSString(info[0]);
    id value = sweetiekit::FromJS(info[1]);
    NSUInteger loc = TO_UINT32(JS_OBJ(info[2])->Get(JS_STR("location")));
    NSUInteger len = TO_UINT32(JS_OBJ(info[2])->Get(JS_STR("length")));
    [ns addAttribute:name value:value range:NSMakeRange(loc, len)];
  }
}
