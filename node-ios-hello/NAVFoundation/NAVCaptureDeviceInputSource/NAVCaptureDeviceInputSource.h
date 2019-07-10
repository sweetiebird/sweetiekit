//
//  NAVCaptureDeviceInputSource.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureDeviceInputSource_h
#define NAVCaptureDeviceInputSource_h    

#include "NNSObject.h"

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV

#define js_value_AVCaptureDeviceInputSource(x) js_value_wrapper(x, AVCaptureDeviceInputSource)
#define to_value_AVCaptureDeviceInputSource(x) to_value_wrapper(x, AVCaptureDeviceInputSource)
#define is_value_AVCaptureDeviceInputSource(x) is_value_wrapper(x, AVCaptureDeviceInputSource)

JS_WRAP_CLASS(AVCaptureDeviceInputSource, NSObject);
  JS_PROP_READONLY(inputSourceID);
  JS_PROP_READONLY(localizedName);
JS_WRAP_CLASS_END(AVCaptureDeviceInputSource);

#endif

#endif /* NAVCaptureDeviceInputSource_h */
