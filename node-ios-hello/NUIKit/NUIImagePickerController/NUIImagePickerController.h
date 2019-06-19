//
//  NUIImagePickerController.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerController_h
#define NUIImagePickerController_h

#include "NUINavigationController.h"

#define js_value_UIImagePickerController(x) js_value_wrapper(x, UIImagePickerController)
#define to_value_UIImagePickerController(x) to_value_wrapper(x, UIImagePickerController)
#define is_value_UIImagePickerController(x) is_value_wrapper(x, UIImagePickerController)

#define js_value_UIImagePickerControllerSourceType(x) JS_ENUM(UIImagePickerControllerSourceType, NSInteger, x)
#define to_value_UIImagePickerControllerSourceType(x) TO_ENUM(UIImagePickerControllerSourceType, NSInteger, x)
#define is_value_UIImagePickerControllerSourceType(x) IS_ENUM(UIImagePickerControllerSourceType, NSInteger, x)

#define js_value_UIImagePickerControllerQualityType(x) JS_ENUM(UIImagePickerControllerQualityType, NSInteger, x)
#define to_value_UIImagePickerControllerQualityType(x) TO_ENUM(UIImagePickerControllerQualityType, NSInteger, x)
#define is_value_UIImagePickerControllerQualityType(x) IS_ENUM(UIImagePickerControllerQualityType, NSInteger, x)

#define js_value_UIImagePickerControllerCameraCaptureMode(x) JS_ENUM(UIImagePickerControllerCameraCaptureMode, NSInteger, x)
#define to_value_UIImagePickerControllerCameraCaptureMode(x) TO_ENUM(UIImagePickerControllerCameraCaptureMode, NSInteger, x)
#define is_value_UIImagePickerControllerCameraCaptureMode(x) IS_ENUM(UIImagePickerControllerCameraCaptureMode, NSInteger, x)

#define js_value_UIImagePickerControllerCameraDevice(x) JS_ENUM(UIImagePickerControllerCameraDevice, NSInteger, x)
#define to_value_UIImagePickerControllerCameraDevice(x) TO_ENUM(UIImagePickerControllerCameraDevice, NSInteger, x)
#define is_value_UIImagePickerControllerCameraDevice(x) IS_ENUM(UIImagePickerControllerCameraDevice, NSInteger, x)

#define js_value_UIImagePickerControllerCameraFlashMode(x) JS_ENUM(UIImagePickerControllerCameraFlashMode, NSInteger, x)
#define to_value_UIImagePickerControllerCameraFlashMode(x) TO_ENUM(UIImagePickerControllerCameraFlashMode, NSInteger, x)
#define is_value_UIImagePickerControllerCameraFlashMode(x) IS_ENUM(UIImagePickerControllerCameraFlashMode, NSInteger, x)

#define js_value_UIImagePickerControllerImageURLExportPreset(x) JS_ENUM(UIImagePickerControllerImageURLExportPreset, NSInteger, x)
#define to_value_UIImagePickerControllerImageURLExportPreset(x) TO_ENUM(UIImagePickerControllerImageURLExportPreset, NSInteger, x)
#define is_value_UIImagePickerControllerImageURLExportPreset(x) IS_ENUM(UIImagePickerControllerImageURLExportPreset, NSInteger, x)

#define js_value_UIImagePickerControllerInfoKey(x) JS_ENUM(UIImagePickerControllerInfoKey, NSString, x)
#define to_value_UIImagePickerControllerInfoKey(x) TO_ENUM(UIImagePickerControllerInfoKey, NSString, x)
#define is_value_UIImagePickerControllerInfoKey(x) IS_ENUM(UIImagePickerControllerInfoKey, NSString, x)

JS_WRAP_CLASS(UIImagePickerController, UINavigationController);
  JS_STATIC_METHOD(isSourceTypeAvailable);
  JS_STATIC_METHOD(availableMediaTypesForSourceType);
  JS_STATIC_METHOD(isCameraDeviceAvailable);
  JS_STATIC_METHOD(isFlashAvailableForCameraDevice);
  JS_STATIC_METHOD(availableCaptureModesForCameraDevice);
  JS_METHOD(takePicture);
  JS_METHOD(startVideoCapture);
  JS_METHOD(stopVideoCapture);
  JS_PROP(delegate);
  JS_PROP(sourceType);
  JS_PROP(mediaTypes);
  JS_PROP(allowsEditing);
  JS_PROP(allowsImageEditing);
  JS_PROP(imageExportPreset);
  JS_PROP(videoMaximumDuration);
  JS_PROP(videoQuality);
  JS_PROP(videoExportPreset);
  JS_PROP(showsCameraControls);
  JS_PROP(cameraOverlayView);
  JS_PROP(cameraViewTransform);
  JS_PROP(cameraCaptureMode);
  JS_PROP(cameraDevice);
  JS_PROP(cameraFlashMode);
JS_WRAP_CLASS_END(UIImagePickerController);

#endif /* NUIImagePickerController_h */
