//
//  NAVDepthData.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVDepthData.h"

#define instancetype AVDepthData
#define js_value_instancetype js_value_AVDepthData

NAVDepthData::NAVDepthData() {}
NAVDepthData::~NAVDepthData() {}

JS_INIT_CLASS(AVDepthData, NSObject);
  JS_ASSIGN_STATIC_METHOD(depthDataFromDictionaryRepresentationError);
  JS_ASSIGN_PROTO_METHOD(depthDataByConvertingToDepthDataType);
  JS_ASSIGN_PROTO_METHOD(depthDataByApplyingExifOrientation);
  JS_ASSIGN_PROTO_METHOD(depthDataByReplacingDepthDataMapWithPixelBufferError);
  JS_ASSIGN_PROTO_METHOD(dictionaryRepresentationForAuxiliaryDataType);
  JS_ASSIGN_PROTO_PROP_READONLY(availableDepthDataTypes);
  JS_ASSIGN_PROTO_PROP_READONLY(depthDataType);
  JS_ASSIGN_PROTO_PROP_READONLY(depthDataMap);
  JS_ASSIGN_PROTO_PROP_READONLY(depthDataQuality);
  JS_ASSIGN_PROTO_PROP_READONLY(isDepthDataFiltered);
  JS_ASSIGN_PROTO_PROP_READONLY(depthDataAccuracy);
  JS_ASSIGN_PROTO_PROP_READONLY(cameraCalibrationData);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVDepthData, NSObject);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVDepthDataQuality) {
    JS_ASSIGN_ENUM(AVDepthDataQualityLow, NSInteger); //    = 0,
    JS_ASSIGN_ENUM(AVDepthDataQualityHigh, NSInteger); //   = 1,
  //} API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) __WATCHOS_PROHIBITED;

  //typedef NS_ENUM(NSInteger, AVDepthDataAccuracy) {
    JS_ASSIGN_ENUM(AVDepthDataAccuracyRelative, NSInteger); //    = 0,
    JS_ASSIGN_ENUM(AVDepthDataAccuracyAbsolute, NSInteger); //    = 1,
  //} API_AVAILABLE(macos(10.13), ios(11.0), tvos(11.0)) __WATCHOS_PROHIBITED;

JS_INIT_CLASS_END(AVDepthData, NSObject);

NAN_METHOD(NAVDepthData::New) {
  JS_RECONSTRUCT(AVDepthData);
  @autoreleasepool {
    AVDepthData* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVDepthData *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVDepthData *wrapper = new NAVDepthData();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVDepthData::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVDepthData::depthDataFromDictionaryRepresentationError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, imageSourceAuxDataInfoDictionary);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([AVDepthData depthDataFromDictionaryRepresentation: imageSourceAuxDataInfoDictionary error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAUAudioUnit.h" // for OSType

NAN_METHOD(NAVDepthData::depthDataByConvertingToDepthDataType) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(OSType, depthDataType);
    JS_SET_RETURN(js_value_instancetype([self depthDataByConvertingToDepthDataType: depthDataType]));
  }
}

#include "NCIImage.h" // for CGImagePropertyOrientation

NAN_METHOD(NAVDepthData::depthDataByApplyingExifOrientation) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImagePropertyOrientation, exifOrientation);
    JS_SET_RETURN(js_value_instancetype([self depthDataByApplyingExifOrientation: exifOrientation]));
  }
}

NAN_METHOD(NAVDepthData::depthDataByReplacingDepthDataMapWithPixelBufferError) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self depthDataByReplacingDepthDataMapWithPixelBuffer: pixelBuffer error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVDepthData::dictionaryRepresentationForAuxiliaryDataType) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    declare_args();
    NSString* auxDataType = nil;
    JS_SET_RETURN(js_value_NSDictionary([self dictionaryRepresentationForAuxiliaryDataType: &auxDataType]));
    if (info[JS_ARGC]->IsObject()) {
      JS_OBJ(info[JS_ARGC])->Set(JS_STR("value"), js_value_NSString(auxDataType));
    }
  }
}

NAN_GETTER(NAVDepthData::availableDepthDataTypesGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self availableDepthDataTypes]));
  }
}

NAN_GETTER(NAVDepthData::depthDataTypeGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_OSType([self depthDataType]));
  }
}

NAN_GETTER(NAVDepthData::depthDataMapGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self depthDataMap]));
  }
}

NAN_GETTER(NAVDepthData::depthDataQualityGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVDepthDataQuality([self depthDataQuality]));
  }
}

NAN_GETTER(NAVDepthData::isDepthDataFilteredGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDepthDataFiltered]));
  }
}

NAN_GETTER(NAVDepthData::depthDataAccuracyGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVDepthDataAccuracy([self depthDataAccuracy]));
  }
}

#include "NAVCameraCalibrationData.h"

NAN_GETTER(NAVDepthData::cameraCalibrationDataGetter) {
  JS_UNWRAP(AVDepthData, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVCameraCalibrationData([self cameraCalibrationData]));
  }
}

