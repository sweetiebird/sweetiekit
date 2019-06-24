//
//  NAVCameraCalibrationData.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCameraCalibrationData_h
#define NAVCameraCalibrationData_h    

#include "NNSObject.h"

#define js_value_AVCameraCalibrationData(x) js_value_wrapper(x, AVCameraCalibrationData)
#define to_value_AVCameraCalibrationData(x) to_value_wrapper(x, AVCameraCalibrationData)
#define is_value_AVCameraCalibrationData(x) is_value_wrapper(x, AVCameraCalibrationData)

JS_WRAP_CLASS(AVCameraCalibrationData, NSObject);
  JS_PROP_READONLY(intrinsicMatrix);
  JS_PROP_READONLY(intrinsicMatrixReferenceDimensions);
  JS_PROP_READONLY(extrinsicMatrix);
  JS_PROP_READONLY(pixelSize);
  JS_PROP_READONLY(lensDistortionLookupTable);
  JS_PROP_READONLY(inverseLensDistortionLookupTable);
  JS_PROP_READONLY(lensDistortionCenter);
JS_WRAP_CLASS_END(AVCameraCalibrationData);

#endif /* NAVCameraCalibrationData_h */
