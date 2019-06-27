//
//  NAVAudioUnitEffect.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioUnitEffect_h
#define NAVAudioUnitEffect_h    

#include "NAVAudioUnit.h"

#define js_value_AVAudioUnitEffect(x) js_value_wrapper(x, AVAudioUnitEffect)
#define to_value_AVAudioUnitEffect(x) to_value_wrapper(x, AVAudioUnitEffect)
#define is_value_AVAudioUnitEffect(x) is_value_wrapper(x, AVAudioUnitEffect)

JS_WRAP_CLASS(AVAudioUnitEffect, AVAudioUnit);
  JS_METHOD(initWithAudioComponentDescription);
  JS_PROP(bypass);
JS_WRAP_CLASS_END(AVAudioUnitEffect);

#endif /* NAVAudioUnitEffect_h */
