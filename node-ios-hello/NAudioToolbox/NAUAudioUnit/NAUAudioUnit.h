//
//  NAUAudioUnit.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAUAudioUnit_h
#define NAUAudioUnit_h    

#include "NNSObject.h"

#define js_value_AUAudioUnit(x) js_value_wrapper(x, AUAudioUnit)
#define to_value_AUAudioUnit(x) to_value_wrapper(x, AUAudioUnit)
#define is_value_AUAudioUnit(x) is_value_wrapper(x, AUAudioUnit)

// AudioToolbox constants
#define js_value_AUEventSampleTime js_value_int64_t
#define to_value_AUEventSampleTime to_value_int64_t
#define is_value_AUEventSampleTime is_value_int64_t

JS_WRAP_CLASS(AUAudioUnit, NSObject);
JS_WRAP_CLASS_END(AUAudioUnit);

#endif /* NAUAudioUnit_h */
