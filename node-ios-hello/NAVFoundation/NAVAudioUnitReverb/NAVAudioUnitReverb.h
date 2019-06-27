//
//  NAVAudioUnitReverb.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioUnitReverb_h
#define NAVAudioUnitReverb_h    

#include "NAVAudioUnitEffect.h"

#define js_value_AVAudioUnitReverb(x) js_value_wrapper(x, AVAudioUnitReverb)
#define to_value_AVAudioUnitReverb(x) to_value_wrapper(x, AVAudioUnitReverb)
#define is_value_AVAudioUnitReverb(x) is_value_wrapper(x, AVAudioUnitReverb)

#define js_value_AVAudioUnitReverbPreset(x) JS_ENUM(AVAudioUnitReverbPreset, NSInteger, x)
#define to_value_AVAudioUnitReverbPreset(x) TO_ENUM(AVAudioUnitReverbPreset, NSInteger, x)
#define is_value_AVAudioUnitReverbPreset(x) IS_ENUM(AVAudioUnitReverbPreset, NSInteger, x)


JS_WRAP_CLASS(AVAudioUnitReverb, AVAudioUnitEffect);
  JS_METHOD(loadFactoryPreset);
  JS_PROP(wetDryMix);
JS_WRAP_CLASS_END(AVAudioUnitReverb);

#endif /* NAVAudioUnitReverb_h */
