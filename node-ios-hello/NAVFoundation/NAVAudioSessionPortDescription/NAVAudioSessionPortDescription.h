//
//  NAVAudioSessionPortDescription.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioSessionPortDescription_h
#define NAVAudioSessionPortDescription_h    

#include "NNSObject.h"

#define js_value_AVAudioSessionPortDescription(x) js_value_wrapper(x, AVAudioSessionPortDescription)
#define to_value_AVAudioSessionPortDescription(x) to_value_wrapper(x, AVAudioSessionPortDescription)
#define is_value_AVAudioSessionPortDescription(x) is_value_wrapper(x, AVAudioSessionPortDescription)

JS_WRAP_CLASS(AVAudioSessionPortDescription, NSObject);
  JS_METHOD(setPreferredDataSourceError);
  JS_PROP_READONLY(portType);
  JS_PROP_READONLY(portName);
  JS_PROP_READONLY(UID);
  JS_PROP_READONLY(hasHardwareVoiceCallProcessing);
  JS_PROP_READONLY(channels);
  JS_PROP_READONLY(dataSources);
  JS_PROP_READONLY(selectedDataSource);
  JS_PROP_READONLY(preferredDataSource);
JS_WRAP_CLASS_END(AVAudioSessionPortDescription);

#endif /* NAVAudioSessionPortDescription_h */
