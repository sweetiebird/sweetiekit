//
//  NCIFilter.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIFilter.h"

#define instancetype CIFilter
#define js_value_instancetype js_value_CIFilter

NCIFilter::NCIFilter() {}
NCIFilter::~NCIFilter() {}

JS_INIT_CLASS(CIFilter, NSObject);
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIFilter, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CIFilter, NSObject);

NAN_METHOD(NCIFilter::New) {
  JS_RECONSTRUCT(CIFilter);
  @autoreleasepool {
    CIFilter* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIFilter *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIFilter alloc] init];
    }
    if (self) {
      NCIFilter *wrapper = new NCIFilter();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIFilter::New: invalid arguments");
    }
  }
}
