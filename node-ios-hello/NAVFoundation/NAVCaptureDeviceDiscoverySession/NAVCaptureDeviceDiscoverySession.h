//
//  NAVCaptureDeviceDiscoverySession.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureDeviceDiscoverySession_h
#define NAVCaptureDeviceDiscoverySession_h    

#include "NNSObject.h"

#define js_value_AVCaptureDeviceDiscoverySession(x) js_value_wrapper(x, AVCaptureDeviceDiscoverySession)
#define to_value_AVCaptureDeviceDiscoverySession(x) to_value_wrapper(x, AVCaptureDeviceDiscoverySession)
#define is_value_AVCaptureDeviceDiscoverySession(x) is_value_wrapper(x, AVCaptureDeviceDiscoverySession)

JS_WRAP_CLASS(AVCaptureDeviceDiscoverySession, NSObject);
  JS_STATIC_METHOD(discoverySessionWithDeviceTypesMediaTypePosition);
  JS_PROP_READONLY(devices);
  #if TARGET_OS_IPHONE_13_0
    JS_PROP_READONLY(supportedMultiCamDeviceSets);
  #endif
JS_WRAP_CLASS_END(AVCaptureDeviceDiscoverySession);

#endif /* NAVCaptureDeviceDiscoverySession_h */
