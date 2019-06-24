//
//  NCIKernel.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NCIKernel.h"

#define instancetype CIKernel
#define js_value_instancetype js_value_CIKernel

NCIKernel::NCIKernel() {}
NCIKernel::~NCIKernel() {}

JS_INIT_CLASS(CIKernel, NSObject);
  JS_ASSIGN_STATIC_METHOD(kernelsWithString);
  JS_ASSIGN_STATIC_METHOD(kernelWithString);
  JS_ASSIGN_STATIC_METHOD(kernelWithFunctionNameFromMetalLibraryDataError);
  JS_ASSIGN_STATIC_METHOD(kernelWithFunctionNameFromMetalLibraryDataOutputPixelFormatError);
  JS_ASSIGN_PROTO_METHOD(setROISelector);
  JS_ASSIGN_PROTO_METHOD(applyWithExtentRoiCallbackArguments);
  JS_ASSIGN_PROTO_PROP_READONLY(name);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(CIKernel, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(CIKernel, NSObject);

NAN_METHOD(NCIKernel::New) {
  JS_RECONSTRUCT(CIKernel);
  @autoreleasepool {
    CIKernel* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge CIKernel *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[CIKernel alloc] init];
    }
    if (self) {
      NCIKernel *wrapper = new NCIKernel();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("CIKernel::New: invalid arguments");
    }
  }
}

NAN_METHOD(NCIKernel::kernelsWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_NSArray<CIKernel*>([CIKernel kernelsWithString: string]));
  }
}

NAN_METHOD(NCIKernel::kernelWithString) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, string);
    JS_SET_RETURN(js_value_instancetype([CIKernel kernelWithString: string]));
  }
}

NAN_METHOD(NCIKernel::kernelWithFunctionNameFromMetalLibraryDataError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(NSData, data);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([CIKernel kernelWithFunctionName: name fromMetalLibraryData: data error: &error]));
    js_panic_NSError(error);
  }
}

#include "NCIImage.h"

NAN_METHOD(NCIKernel::kernelWithFunctionNameFromMetalLibraryDataOutputPixelFormatError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    declare_pointer(NSData, data);
    declare_value(CIFormat, format);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([CIKernel kernelWithFunctionName: name fromMetalLibraryData: data outputPixelFormat: format error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NCIKernel::setROISelector) {
  JS_UNWRAP(CIKernel, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(SEL, method);
    [self setROISelector: method];
  }
}

NAN_METHOD(NCIKernel::applyWithExtentRoiCallbackArguments) {
  JS_UNWRAP(CIKernel, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, extent);
    declare_callback(callback);
    declare_nullable_pointer(NSArray<id>, args);
    JS_SET_RETURN(js_value_CIImage([self applyWithExtent: extent roiCallback:^CGRect(int index, CGRect destRect) {
      __block CGRect result(CGRectZero);
      dispatch_main(^{
        if (callback) {
          Local<Value> JS_RESULT([callback jsFunction]->Call("NCIKernel::applyWithExtentRoiCallbackArguments",
            js_value_int(index),
            js_value_CGRect(destRect)));
          if (is_value_CGRect(JS_RESULT)) {
            result = to_value_CGRect(JS_RESULT);
          }
        }
      });
      return result;
    } arguments: args]));
  }
}

NAN_GETTER(NCIKernel::nameGetter) {
  JS_UNWRAP(CIKernel, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self name]));
  }
}
