//
//  NAVAudioSessionDataSourceDescription.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioSessionDataSourceDescription_h
#define NAVAudioSessionDataSourceDescription_h    

#include "NNSObject.h"

#define js_value_AVAudioSessionDataSourceDescription(x) js_value_wrapper(x, AVAudioSessionDataSourceDescription)
#define to_value_AVAudioSessionDataSourceDescription(x) to_value_wrapper(x, AVAudioSessionDataSourceDescription)
#define is_value_AVAudioSessionDataSourceDescription(x) is_value_wrapper(x, AVAudioSessionDataSourceDescription)

JS_WRAP_CLASS(AVAudioSessionDataSourceDescription, NSObject);
  JS_METHOD(setPreferredPolarPatternError);
  JS_PROP_READONLY(dataSourceID);
  JS_PROP_READONLY(dataSourceName);
  JS_PROP_READONLY(location);
  JS_PROP_READONLY(orientation);
  JS_PROP_READONLY(supportedPolarPatterns);
  JS_PROP_READONLY(selectedPolarPattern);
  JS_PROP_READONLY(preferredPolarPattern);
JS_WRAP_CLASS_END(AVAudioSessionDataSourceDescription);

#endif /* NAVAudioSessionDataSourceDescription_h */
