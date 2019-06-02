//
//  NSAttributedString.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSAttributedString.h"

NNSAttributedString::NNSAttributedString () {}
NNSAttributedString::~NNSAttributedString () {}

JS_INIT_CLASS(NSAttributedString, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSAttributedString, NSObject);
JS_INIT_CLASS_END(NSAttributedString, NSObject);

NAN_METHOD(NNSAttributedString::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NNSAttributedString *ui = new NNSAttributedString();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge NSAttributedString *)(info[0].As<External>()->Value()));
  } else if (info.Length() == 1) {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      Nan::ThrowError("Invalid argument");
    }
    NSString* string = [NSString stringWithUTF8String:str.c_str()];
    @autoreleasepool {
      ui->SetNSObject([[NSAttributedString alloc] initWithString:string]);
    }
  } else if (info.Length() == 2) {
    std::string str;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      str = *utf8Value;
    } else {
      Nan::ThrowError("Invalid argument");
    }
    NSString* string = [NSString stringWithUTF8String:str.c_str()];

    Local<Object> attrs = JS_OBJ(info[1]);
    NSMutableDictionary<NSAttributedStringKey, id> *dict = [[NSMutableDictionary<NSAttributedStringKey, id> alloc] init];

    sweetiekit::forEachEntryInObject(attrs, ^(Local<Value> key, Local<Value> value) {
      @autoreleasepool {
        Nan::HandleScope scope;
        NSString* nsKey = NJSStringToNSString(key);
        id nsValue = sweetiekit::FromJS(value);
        dict[nsKey] = nsValue;
      }
    });

    @autoreleasepool {
      ui->SetNSObject([[NSAttributedString alloc] initWithString:string attributes:dict]);
    }
  } else {
    @autoreleasepool {
      ui->SetNSObject([[NSAttributedString alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}
