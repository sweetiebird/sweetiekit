//
//  NAVAudioSessionChannelDescription.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioSessionChannelDescription_h
#define NAVAudioSessionChannelDescription_h    

#include "NNSObject.h"

#define js_value_AVAudioSessionChannelDescription(x) js_value_wrapper(x, AVAudioSessionChannelDescription)
#define to_value_AVAudioSessionChannelDescription(x) to_value_wrapper(x, AVAudioSessionChannelDescription)
#define is_value_AVAudioSessionChannelDescription(x) is_value_wrapper(x, AVAudioSessionChannelDescription)

JS_WRAP_CLASS(AVAudioSessionChannelDescription, NSObject);
  JS_PROP_READONLY(channelName);
  JS_PROP_READONLY(owningPortUID);
  JS_PROP_READONLY(channelNumber);
  JS_PROP_READONLY(channelLabel);
JS_WRAP_CLASS_END(AVAudioSessionChannelDescription);

#endif /* NAVAudioSessionChannelDescription_h */
