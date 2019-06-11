//
//  NAUAudioUnitPreset.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUAudioUnitPreset_h
#define NAUAudioUnitPreset_h    

#include "NNSObject.h"

#define js_value_AUAudioUnitPreset(x) js_value_wrapper(x, AUAudioUnitPreset)
#define to_value_AUAudioUnitPreset(x) to_value_wrapper(x, AUAudioUnitPreset)
#define is_value_AUAudioUnitPreset(x) is_value_wrapper(x, AUAudioUnitPreset)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AUAudioUnitPreset, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AUAudioUnitPreset);

#endif /* NAUAudioUnitPreset_h */