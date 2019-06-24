//
//  NAVDepthData.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVDepthData_h
#define NAVDepthData_h    

#include "NNSObject.h"

#define js_value_AVDepthData(x) js_value_wrapper(x, AVDepthData)
#define to_value_AVDepthData(x) to_value_wrapper(x, AVDepthData)
#define is_value_AVDepthData(x) is_value_wrapper(x, AVDepthData)

#define js_value_AVDepthDataQuality(x) JS_ENUM(AVDepthDataQuality, NSInteger, x)
#define to_value_AVDepthDataQuality(x) TO_ENUM(AVDepthDataQuality, NSInteger, x)
#define is_value_AVDepthDataQuality(x) IS_ENUM(AVDepthDataQuality, NSInteger, x)

#define js_value_AVDepthDataAccuracy(x) JS_ENUM(AVDepthDataAccuracy, NSInteger, x)
#define to_value_AVDepthDataAccuracy(x) TO_ENUM(AVDepthDataAccuracy, NSInteger, x)
#define is_value_AVDepthDataAccuracy(x) IS_ENUM(AVDepthDataAccuracy, NSInteger, x)

JS_WRAP_CLASS(AVDepthData, NSObject);
  JS_STATIC_METHOD(depthDataFromDictionaryRepresentationError);
  JS_METHOD(depthDataByConvertingToDepthDataType);
  JS_METHOD(depthDataByApplyingExifOrientation);
  JS_METHOD(depthDataByReplacingDepthDataMapWithPixelBufferError);
  JS_METHOD(dictionaryRepresentationForAuxiliaryDataType);
  JS_PROP_READONLY(availableDepthDataTypes);
  JS_PROP_READONLY(depthDataType);
  JS_PROP_READONLY(depthDataMap);
  JS_PROP_READONLY(depthDataQuality);
  JS_PROP_READONLY(isDepthDataFiltered);
  JS_PROP_READONLY(depthDataAccuracy);
  JS_PROP_READONLY(cameraCalibrationData);
JS_WRAP_CLASS_END(AVDepthData);

#endif /* NAVDepthData_h */
