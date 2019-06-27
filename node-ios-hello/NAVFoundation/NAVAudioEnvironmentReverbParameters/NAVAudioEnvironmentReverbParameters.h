//
//  NAVAudioEnvironmentReverbParameters.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioEnvironmentReverbParameters_h
#define NAVAudioEnvironmentReverbParameters_h    

#include "NNSObject.h"

#define js_value_AVAudioEnvironmentReverbParameters(x) js_value_wrapper(x, AVAudioEnvironmentReverbParameters)
#define to_value_AVAudioEnvironmentReverbParameters(x) to_value_wrapper(x, AVAudioEnvironmentReverbParameters)
#define is_value_AVAudioEnvironmentReverbParameters(x) is_value_wrapper(x, AVAudioEnvironmentReverbParameters)

JS_WRAP_CLASS(AVAudioEnvironmentReverbParameters, NSObject);
  JS_METHOD(loadFactoryReverbPreset);
  JS_PROP(enable);
  JS_PROP(level);
  JS_PROP_READONLY(filterParameters);
JS_WRAP_CLASS_END(AVAudioEnvironmentReverbParameters);

#endif /* NAVAudioEnvironmentReverbParameters_h */
