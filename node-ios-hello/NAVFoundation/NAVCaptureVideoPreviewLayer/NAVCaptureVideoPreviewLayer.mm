//
//  NAVCaptureVideoPreviewLayer.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureVideoPreviewLayer.h"

#define instancetype AVCaptureVideoPreviewLayer
#define js_value_instancetype js_value_AVCaptureVideoPreviewLayer

NAVCaptureVideoPreviewLayer::NAVCaptureVideoPreviewLayer() {}
NAVCaptureVideoPreviewLayer::~NAVCaptureVideoPreviewLayer() {}

JS_INIT_CLASS(AVCaptureVideoPreviewLayer, CALayer);
  JS_ASSIGN_STATIC_METHOD(layerWithSession);
  JS_ASSIGN_STATIC_METHOD(layerWithSessionWithNoConnection);
  JS_ASSIGN_PROTO_METHOD(initWithSession);
  JS_ASSIGN_PROTO_METHOD(initWithSessionWithNoConnection);
  JS_ASSIGN_PROTO_METHOD(setSessionWithNoConnection);
  JS_ASSIGN_PROTO_METHOD(captureDevicePointOfInterestForPoint);
  JS_ASSIGN_PROTO_METHOD(pointForCaptureDevicePointOfInterest);
  JS_ASSIGN_PROTO_METHOD(metadataOutputRectOfInterestForRect);
  JS_ASSIGN_PROTO_METHOD(rectForMetadataOutputRectOfInterest);
  JS_ASSIGN_PROTO_METHOD(transformedMetadataObjectForMetadataObject);
  JS_ASSIGN_PROTO_PROP(session);
  JS_ASSIGN_PROTO_PROP_READONLY(connection);
  JS_ASSIGN_PROTO_PROP(videoGravity);
  JS_ASSIGN_PROTO_PROP_READONLY(isPreviewing);
  JS_ASSIGN_PROTO_PROP_READONLY(isOrientationSupported);
  JS_ASSIGN_PROTO_PROP(orientation);
  JS_ASSIGN_PROTO_PROP_READONLY(isMirroringSupported);
  JS_ASSIGN_PROTO_PROP(automaticallyAdjustsMirroring);
  JS_ASSIGN_PROTO_PROP(isMirrored);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureVideoPreviewLayer, CALayer);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureVideoPreviewLayer, CALayer);

NAN_METHOD(NAVCaptureVideoPreviewLayer::New) {
  JS_RECONSTRUCT(AVCaptureVideoPreviewLayer);
  @autoreleasepool {
    AVCaptureVideoPreviewLayer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureVideoPreviewLayer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVCaptureVideoPreviewLayer alloc] init];
    }
    if (self) {
      NAVCaptureVideoPreviewLayer *wrapper = new NAVCaptureVideoPreviewLayer();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureVideoPreviewLayer::New: invalid arguments");
    }
  }
}

#include "NAVCaptureSession.h"

NAN_METHOD(NAVCaptureVideoPreviewLayer::layerWithSession) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureSession, session);
    JS_SET_RETURN(js_value_instancetype([AVCaptureVideoPreviewLayer layerWithSession: session]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::layerWithSessionWithNoConnection) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureSession, session);
    JS_SET_RETURN(js_value_instancetype([AVCaptureVideoPreviewLayer layerWithSessionWithNoConnection: session]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::initWithSession) {
  JS_UNWRAP_OR_ALLOC(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureSession, session);
    JS_SET_RETURN(js_value_instancetype([self initWithSession: session]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::initWithSessionWithNoConnection) {
  JS_UNWRAP_OR_ALLOC(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureSession, session);
    JS_SET_RETURN(js_value_instancetype([self initWithSessionWithNoConnection: session]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::setSessionWithNoConnection) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVCaptureSession, session);
    [self setSessionWithNoConnection: session];
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::captureDevicePointOfInterestForPoint) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, pointInLayer);
    JS_SET_RETURN(js_value_CGPoint([self captureDevicePointOfInterestForPoint: pointInLayer]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::pointForCaptureDevicePointOfInterest) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, captureDevicePointOfInterest);
    JS_SET_RETURN(js_value_CGPoint([self pointForCaptureDevicePointOfInterest: captureDevicePointOfInterest]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::metadataOutputRectOfInterestForRect) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rectInLayerCoordinates);
    JS_SET_RETURN(js_value_CGRect([self metadataOutputRectOfInterestForRect: rectInLayerCoordinates]));
  }
}

NAN_METHOD(NAVCaptureVideoPreviewLayer::rectForMetadataOutputRectOfInterest) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rectInMetadataOutputCoordinates);
    JS_SET_RETURN(js_value_CGRect([self rectForMetadataOutputRectOfInterest: rectInMetadataOutputCoordinates]));
  }
}

#include "NAVMetadataObject.h"

NAN_METHOD(NAVCaptureVideoPreviewLayer::transformedMetadataObjectForMetadataObject) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVMetadataObject, metadataObject);
    JS_SET_RETURN(js_value_AVMetadataObject([self transformedMetadataObjectForMetadataObject: metadataObject]));
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::sessionGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureSession([self session]));
  }
}

NAN_SETTER(NAVCaptureVideoPreviewLayer::sessionSetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(AVCaptureSession, input);
    [self setSession: input];
  }
}

#include "NAVCaptureConnection.h"

NAN_GETTER(NAVCaptureVideoPreviewLayer::connectionGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureConnection([self connection]));
  }
}

#include "NAVAnimation.h"

NAN_GETTER(NAVCaptureVideoPreviewLayer::videoGravityGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVLayerVideoGravity([self videoGravity]));
  }
}

NAN_SETTER(NAVCaptureVideoPreviewLayer::videoGravitySetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVLayerVideoGravity, input);
    [self setVideoGravity: input];
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::isPreviewingGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPreviewing]));
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::isOrientationSupportedGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isOrientationSupported]));
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::orientationGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCaptureVideoOrientation([self orientation]));
  }
}

NAN_SETTER(NAVCaptureVideoPreviewLayer::orientationSetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVCaptureVideoOrientation, input);
    [self setOrientation: input];
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::isMirroringSupportedGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMirroringSupported]));
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::automaticallyAdjustsMirroringGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self automaticallyAdjustsMirroring]));
  }
}

NAN_SETTER(NAVCaptureVideoPreviewLayer::automaticallyAdjustsMirroringSetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutomaticallyAdjustsMirroring: input];
  }
}

NAN_GETTER(NAVCaptureVideoPreviewLayer::isMirroredGetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMirrored]));
  }
}

NAN_SETTER(NAVCaptureVideoPreviewLayer::isMirroredSetter) {
  JS_UNWRAP(AVCaptureVideoPreviewLayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMirrored: input];
  }
}
