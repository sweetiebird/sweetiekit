//
//  NCIColorKernel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIColorKernel.h"

#define instancetype CIColorKernel
#define js_value_instancetype js_value_CIColorKernel

NCIColorKernel::NCIColorKernel() {}
NCIColorKernel::~NCIColorKernel() {}

JS_INIT_CLASS(CIColorKernel, CIKernel);
  JS_ASSIGN_STATIC_METHOD(kernelWithString);
  JS_ASSIGN_PROTO_METHOD(applyWithExtentArguments);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIColorKernel, CIKernel);
  // constant values (exports)
JS_INIT_CLASS_END(CIColorKernel, CIKernel);

NAN_METHOD(NCIColorKernel::New) {
  JS_RECONSTRUCT(CIColorKernel);
  @autoreleasepool {
    CIColorKernel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIColorKernel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIColorKernel alloc] init];
    }
    if (self) {
      NCIColorKernel *wrapper = new NCIColorKernel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIColorKernel::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIColorKernel::kernelWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([CIColorKernel kernelWithString: string]));
  }
}

#include "NCIImage.h"

NAN_METHOD(NCIColorKernel::applyWithExtentArguments) {
  JS_UNWRAP(CIColorKernel, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, extent);
    declare_nullable_pointer(NSArray<id>, args);
    JS_SET_RETURN(js_value_CIImage([self applyWithExtent: extent arguments: args]));
  }
}
