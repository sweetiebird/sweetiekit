//
//  NVNImageRequestHandler.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNImageRequestHandler.h"

#import <Vision/VNRequestHandler.h>

#define instancetype VNImageRequestHandler
#define js_value_instancetype js_value_VNImageRequestHandler

NVNImageRequestHandler::NVNImageRequestHandler() {}
NVNImageRequestHandler::~NVNImageRequestHandler() {}

JS_INIT_CLASS(VNImageRequestHandler, NSObject);
  JS_ASSIGN_PROTO_METHOD(initWithCVPixelBufferOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCVPixelBufferOrientationOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCGImageOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCGImageOrientationOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCIImageOptions);
  JS_ASSIGN_PROTO_METHOD(initWithCIImageOrientationOptions);
  JS_ASSIGN_PROTO_METHOD(initWithURLOptions);
  JS_ASSIGN_PROTO_METHOD(initWithURLOrientationOptions);
  JS_ASSIGN_PROTO_METHOD(initWithDataOptions);
  JS_ASSIGN_PROTO_METHOD(initWithDataOrientationOptions);
  JS_ASSIGN_PROTO_METHOD(performRequestsError);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNImageRequestHandler, NSObject);
  // constant values (exports)

  JS_ASSIGN_ENUM(VNImageOptionProperties, VNImageOption); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNImageOptionCameraIntrinsics, VNImageOption); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));
  JS_ASSIGN_ENUM(VNImageOptionCIContext, VNImageOption); //  API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0));

JS_INIT_CLASS_END(VNImageRequestHandler, NSObject);

NAN_METHOD(NVNImageRequestHandler::New) {
  JS_RECONSTRUCT(VNImageRequestHandler);
  @autoreleasepool {
    VNImageRequestHandler* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNImageRequestHandler *)(info[0].As<External>()->Value());
    }
    if (self) {
      NVNImageRequestHandler *wrapper = new NVNImageRequestHandler();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNImageRequestHandler::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithCVPixelBufferOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCVPixelBuffer: pixelBuffer options: options]));
  }
}

#include "NCGImageProperties.h"

NAN_METHOD(NVNImageRequestHandler::initWithCVPixelBufferOrientationOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCVPixelBuffer: pixelBuffer orientation: orientation options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithCGImageOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCGImage: image options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithCGImageOrientationOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImageRef, image);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCGImage: image orientation: orientation options: options]));
  }
}

#include "NCIImage.h"

NAN_METHOD(NVNImageRequestHandler::initWithCIImageOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, image);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCIImage: image options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithCIImageOrientationOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(CIImage, image);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithCIImage: image orientation: orientation options: options]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NVNImageRequestHandler::initWithURLOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, imageURL);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: imageURL options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithURLOrientationOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, imageURL);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: imageURL orientation: orientation options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithDataOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, imageData);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithData: imageData options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::initWithDataOrientationOptions) {
  JS_UNWRAP_OR_ALLOC(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, imageData);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_pointer(NSDictionary/* <VNImageOption, id>*/, options);
    JS_SET_RETURN(js_value_instancetype([self initWithData: imageData orientation: orientation options: options]));
  }
}

NAN_METHOD(NVNImageRequestHandler::performRequestsError) {
  JS_UNWRAP(VNImageRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests error: &error]));
    js_panic_NSError(error);
  }
}
