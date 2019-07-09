//
//  NAVCaptureAudioChannel.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVCaptureAudioChannel_h
#define NAVCaptureAudioChannel_h    

#include "NNSObject.h"

#define js_value_AVCaptureAudioChannel(x) js_value_wrapper(x, AVCaptureAudioChannel)
#define to_value_AVCaptureAudioChannel(x) to_value_wrapper(x, AVCaptureAudioChannel)
#define is_value_AVCaptureAudioChannel(x) is_value_wrapper(x, AVCaptureAudioChannel)

JS_WRAP_CLASS(AVCaptureAudioChannel, NSObject);
  JS_PROP_READONLY(averagePowerLevel);
  JS_PROP_READONLY(peakHoldLevel);
  JS_PROP(volume);
  JS_PROP(isEnabled);
JS_WRAP_CLASS_END(AVCaptureAudioChannel);

#endif /* NAVCaptureAudioChannel_h */
