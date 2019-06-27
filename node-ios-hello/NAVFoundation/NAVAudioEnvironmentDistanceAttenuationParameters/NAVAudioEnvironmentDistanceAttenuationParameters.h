//
//  NAVAudioEnvironmentDistanceAttenuationParameters.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioEnvironmentDistanceAttenuationParameters_h
#define NAVAudioEnvironmentDistanceAttenuationParameters_h    

#include "NNSObject.h"

#define js_value_AVAudioEnvironmentDistanceAttenuationParameters(x) js_value_wrapper(x, AVAudioEnvironmentDistanceAttenuationParameters)
#define to_value_AVAudioEnvironmentDistanceAttenuationParameters(x) to_value_wrapper(x, AVAudioEnvironmentDistanceAttenuationParameters)
#define is_value_AVAudioEnvironmentDistanceAttenuationParameters(x) is_value_wrapper(x, AVAudioEnvironmentDistanceAttenuationParameters)

JS_WRAP_CLASS(AVAudioEnvironmentDistanceAttenuationParameters, NSObject);
  JS_PROP(distanceAttenuationModel);
  JS_PROP(referenceDistance);
  JS_PROP(maximumDistance);
  JS_PROP(rolloffFactor);
JS_WRAP_CLASS_END(AVAudioEnvironmentDistanceAttenuationParameters);

#endif /* NAVAudioEnvironmentDistanceAttenuationParameters_h */
