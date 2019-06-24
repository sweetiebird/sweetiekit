//
//  NAVCameraCalibrationData.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCameraCalibrationData.h"

#define instancetype AVCameraCalibrationData
#define js_value_instancetype js_value_AVCameraCalibrationData

NAVCameraCalibrationData::NAVCameraCalibrationData() {}
NAVCameraCalibrationData::~NAVCameraCalibrationData() {}

JS_INIT_CLASS(AVCameraCalibrationData, NSObject);
  JS_ASSIGN_PROTO_PROP_READONLY(intrinsicMatrix);
  JS_ASSIGN_PROTO_PROP_READONLY(intrinsicMatrixReferenceDimensions);
  JS_ASSIGN_PROTO_PROP_READONLY(extrinsicMatrix);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelSize);
  JS_ASSIGN_PROTO_PROP_READONLY(lensDistortionLookupTable);
  JS_ASSIGN_PROTO_PROP_READONLY(inverseLensDistortionLookupTable);
  JS_ASSIGN_PROTO_PROP_READONLY(lensDistortionCenter);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCameraCalibrationData, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVCameraCalibrationData, NSObject);

NAN_METHOD(NAVCameraCalibrationData::New) {
  JS_RECONSTRUCT(AVCameraCalibrationData);
  @autoreleasepool {
    AVCameraCalibrationData* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCameraCalibrationData *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCameraCalibrationData *wrapper = new NAVCameraCalibrationData();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCameraCalibrationData::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVCameraCalibrationData::intrinsicMatrixGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_matrix_float3x3([self intrinsicMatrix]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::intrinsicMatrixReferenceDimensionsGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self intrinsicMatrixReferenceDimensions]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::extrinsicMatrixGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_matrix_float4x3([self extrinsicMatrix]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::pixelSizeGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self pixelSize]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::lensDistortionLookupTableGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self lensDistortionLookupTable]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::inverseLensDistortionLookupTableGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self inverseLensDistortionLookupTable]));
  }
}

NAN_GETTER(NAVCameraCalibrationData::lensDistortionCenterGetter) {
  JS_UNWRAP(AVCameraCalibrationData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self lensDistortionCenter]));
  }
}
