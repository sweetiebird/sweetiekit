//
//  NAVAudioUnit.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioUnit_h
#define NAVAudioUnit_h    

#include "NAVAudioNode.h"

#define js_value_AVAudioUnit(x) js_value_wrapper(x, AVAudioUnit)
#define to_value_AVAudioUnit(x) to_value_wrapper(x, AVAudioUnit)
#define is_value_AVAudioUnit(x) is_value_wrapper(x, AVAudioUnit)

JS_WRAP_CLASS(AVAudioUnit, AVAudioNode);
  JS_STATIC_METHOD(instantiateWithComponentDescriptionOptionsCompletionHandler);
  JS_METHOD(loadAudioUnitPresetAtURLError);
  JS_PROP_READONLY(audioComponentDescription);
  JS_PROP_READONLY(audioUnit);
  JS_PROP_READONLY(AUAudioUnit);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(manufacturerName);
  JS_PROP_READONLY(version);
JS_WRAP_CLASS_END(AVAudioUnit);

#endif /* NAVAudioUnit_h */
