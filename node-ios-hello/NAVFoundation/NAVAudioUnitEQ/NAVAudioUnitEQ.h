//
//  NAVAudioUnitEQ.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioUnitEQ_h
#define NAVAudioUnitEQ_h    

#include "NAVAudioUnitEffect.h"

#define js_value_AVAudioUnitEQ(x) js_value_wrapper(x, AVAudioUnitEQ)
#define to_value_AVAudioUnitEQ(x) to_value_wrapper(x, AVAudioUnitEQ)
#define is_value_AVAudioUnitEQ(x) is_value_wrapper(x, AVAudioUnitEQ)

#define js_value_AVAudioUnitEQFilterType(x) JS_ENUM(AVAudioUnitEQFilterType, NSInteger, x)
#define to_value_AVAudioUnitEQFilterType(x) TO_ENUM(AVAudioUnitEQFilterType, NSInteger, x)
#define is_value_AVAudioUnitEQFilterType(x) IS_ENUM(AVAudioUnitEQFilterType, NSInteger, x)

JS_WRAP_CLASS(AVAudioUnitEQ, AVAudioUnitEffect);
  JS_METHOD(initWithNumberOfBands);
  JS_PROP_READONLY(bands);
  JS_PROP(globalGain);
JS_WRAP_CLASS_END(AVAudioUnitEQ);

#endif /* NAVAudioUnitEQ_h */
