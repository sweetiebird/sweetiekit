//
//  NCIWarpKernel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIWarpKernel.h"

#define instancetype CIWarpKernel
#define js_value_instancetype js_value_CIWarpKernel

NCIWarpKernel::NCIWarpKernel() {}
NCIWarpKernel::~NCIWarpKernel() {}

JS_INIT_CLASS(CIWarpKernel, CIKernel);
  JS_ASSIGN_STATIC_METHOD(kernelWithString);
  JS_ASSIGN_PROTO_METHOD(applyWithExtentRoiCallbackInputImageArguments);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIWarpKernel, CIKernel);
  // constant values (exports)
JS_INIT_CLASS_END(CIWarpKernel, CIKernel);

NAN_METHOD(NCIWarpKernel::New) {
  JS_RECONSTRUCT(CIWarpKernel);
  @autoreleasepool {
    CIWarpKernel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIWarpKernel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIWarpKernel alloc] init];
    }
    if (self) {
      NCIWarpKernel *wrapper = new NCIWarpKernel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIWarpKernel::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIWarpKernel::kernelWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([CIWarpKernel kernelWithString: string]));
  }
}

#include "NCIImage.h"

NAN_METHOD(NCIWarpKernel::applyWithExtentRoiCallbackInputImageArguments) {
  JS_UNWRAP(CIWarpKernel, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, extent);
    declare_callback(callback);
    declare_pointer(CIImage, image);
    declare_nullable_pointer(NSArray<id>, args);
    JS_SET_RETURN(js_value_CIImage([self applyWithExtent: extent roiCallback:^CGRect(int index, CGRect destRect) {
      __block CGRect result(CGRectZero);
      dispatch_main(^{
        if (callback) {
          Local<Value> JS_RESULT([callback jsFunction]->Call("NCIWarpKernel::applyWithExtentRoiCallbackInputImageArguments",
            js_value_int(index),
            js_value_CGRect(destRect)));
          if (is_value_CGRect(JS_RESULT)) {
            result = to_value_CGRect(JS_RESULT);
          }
        }
      });
      return result;
    } inputImage: image arguments: args]));
  }
}
