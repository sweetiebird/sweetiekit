//
//  NAVAudioUnitEQFilterParameters.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioUnitEQFilterParameters_h
#define NAVAudioUnitEQFilterParameters_h    

#include "NNSObject.h"

#define js_value_AVAudioUnitEQFilterParameters(x) js_value_wrapper(x, AVAudioUnitEQFilterParameters)
#define to_value_AVAudioUnitEQFilterParameters(x) to_value_wrapper(x, AVAudioUnitEQFilterParameters)
#define is_value_AVAudioUnitEQFilterParameters(x) is_value_wrapper(x, AVAudioUnitEQFilterParameters)

JS_WRAP_CLASS(AVAudioUnitEQFilterParameters, NSObject);
  JS_PROP(filterType);
  JS_PROP(frequency);
  JS_PROP(bandwidth);
  JS_PROP(gain);
  JS_PROP(bypass);
JS_WRAP_CLASS_END(AVAudioUnitEQFilterParameters);

#endif /* NAVAudioUnitEQFilterParameters_h */
