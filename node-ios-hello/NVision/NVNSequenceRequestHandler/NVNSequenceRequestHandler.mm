//
//  NVNSequenceRequestHandler.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNSequenceRequestHandler.h"

#import <Vision/VNRequestHandler.h>

#define instancetype VNSequenceRequestHandler
#define js_value_instancetype js_value_VNSequenceRequestHandler

NVNSequenceRequestHandler::NVNSequenceRequestHandler() {}
NVNSequenceRequestHandler::~NVNSequenceRequestHandler() {}

JS_INIT_CLASS(VNSequenceRequestHandler, NSObject);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCVPixelBufferError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCVPixelBufferOrientationError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCGImageError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCGImageOrientationError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCIImageError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnCIImageOrientationError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnImageURLError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnImageURLOrientationError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnImageDataError);
  JS_ASSIGN_PROTO_METHOD(performRequestsOnImageDataOrientationError);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNSequenceRequestHandler, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(VNSequenceRequestHandler, NSObject);

NAN_METHOD(NVNSequenceRequestHandler::New) {
  JS_RECONSTRUCT(VNSequenceRequestHandler);
  @autoreleasepool {
    VNSequenceRequestHandler* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNSequenceRequestHandler *)(info[0].As<External>()->Value());
    }
    if (self) {
      NVNSequenceRequestHandler *wrapper = new NVNSequenceRequestHandler();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNSequenceRequestHandler::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCVPixelBufferError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCVPixelBuffer: pixelBuffer error: &error]));
    js_panic_NSError(error);
  }
}

#include "NCGImageProperties.h"

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCVPixelBufferOrientationError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCVPixelBuffer: pixelBuffer orientation: orientation error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCGImageError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_value(CGImageRef, image);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCGImage: image error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCGImageOrientationError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_value(CGImageRef, image);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCGImage: image orientation: orientation error: &error]));
    js_panic_NSError(error);
  }
}

#include "NCIImage.h"

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCIImageError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(CIImage, image);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCIImage: image error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnCIImageOrientationError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(CIImage, image);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onCIImage: image orientation: orientation error: &error]));
    js_panic_NSError(error);
  }
}

#include "NNSURL.h"

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnImageURLError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(NSURL, imageURL);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onImageURL: imageURL error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnImageURLOrientationError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(NSURL, imageURL);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onImageURL: imageURL orientation: orientation error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnImageDataError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(NSData, imageData);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onImageData: imageData error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NVNSequenceRequestHandler::performRequestsOnImageDataOrientationError) {
  JS_UNWRAP(VNSequenceRequestHandler, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<VNRequest*>, requests);
    declare_pointer(NSData, imageData);
    declare_value(CGImagePropertyOrientation, orientation);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self performRequests: requests onImageData: imageData orientation: orientation error: &error]));
    js_panic_NSError(error);
  }
}

