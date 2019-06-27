//
//  NAVAudioMixingDestination.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioMixingDestination_h
#define NAVAudioMixingDestination_h    

#include "NAVAudioMixing.h"

#define js_value_AVAudioMixingDestination(x) js_value_wrapper(x, AVAudioMixingDestination)
#define to_value_AVAudioMixingDestination(x) to_value_wrapper(x, AVAudioMixingDestination)
#define is_value_AVAudioMixingDestination(x) is_value_wrapper(x, AVAudioMixingDestination)

JS_WRAP_CLASS(AVAudioMixingDestination, AVAudioMixing);
  JS_PROP_READONLY(connectionPoint);
JS_WRAP_CLASS_END(AVAudioMixingDestination);

#endif /* NAVAudioMixingDestination_h */
