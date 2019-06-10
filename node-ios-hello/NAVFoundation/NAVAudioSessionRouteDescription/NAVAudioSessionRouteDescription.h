//
//  NAVAudioSessionRouteDescription.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioSessionRouteDescription_h
#define NAVAudioSessionRouteDescription_h    

#include "NNSObject.h"

#define js_value_AVAudioSessionRouteDescription(x) js_value_wrapper(x, AVAudioSessionRouteDescription)
#define to_value_AVAudioSessionRouteDescription(x) to_value_wrapper(x, AVAudioSessionRouteDescription)
#define is_value_AVAudioSessionRouteDescription(x) is_value_wrapper(x, AVAudioSessionRouteDescription)

JS_WRAP_CLASS(AVAudioSessionRouteDescription, NSObject);
  JS_PROP_READONLY(inputs);
  JS_PROP_READONLY(outputs);
JS_WRAP_CLASS_END(AVAudioSessionRouteDescription);

#endif /* NAVAudioSessionRouteDescription_h */
