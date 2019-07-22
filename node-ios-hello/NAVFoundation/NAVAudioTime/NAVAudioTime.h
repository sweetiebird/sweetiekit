//
//  NAVAudioTime.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioTime_h
#define NAVAudioTime_h    

#include "NNSObject.h"

#define js_value_AVAudioTime(x) js_value_wrapper(x, AVAudioTime)
#define to_value_AVAudioTime(x) to_value_wrapper(x, AVAudioTime)
#define is_value_AVAudioTime(x) is_value_wrapper(x, AVAudioTime)

JS_WRAP_CLASS(AVAudioTime, NSObject);
  JS_STATIC_METHOD(timeWithAudioTimeStampSampleRate);
  JS_STATIC_METHOD(timeWithHostTime);
  JS_STATIC_METHOD(timeWithSampleTimeAtRate);
  JS_STATIC_METHOD(timeWithHostTimeSampleTimeAtRate);
  JS_STATIC_METHOD(hostTimeForSeconds);
  JS_STATIC_METHOD(secondsForHostTime);
  JS_METHOD(initWithAudioTimeStampSampleRate);
  JS_METHOD(initWithHostTime);
  JS_METHOD(initWithSampleTimeAtRate);
  JS_METHOD(initWithHostTimeSampleTimeAtRate);
  JS_METHOD(extrapolateTimeFromAnchor);
  JS_PROP_READONLY(isHostTimeValid);
  JS_PROP_READONLY(hostTime);
  JS_PROP_READONLY(isSampleTimeValid);
  JS_PROP_READONLY(sampleTime);
  JS_PROP_READONLY(sampleRate);
  JS_PROP_READONLY(audioTimeStamp);
JS_WRAP_CLASS_END(AVAudioTime);

#endif /* NAVAudioTime_h */
