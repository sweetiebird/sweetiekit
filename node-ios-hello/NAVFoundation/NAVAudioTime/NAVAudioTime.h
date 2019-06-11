//
//  NAVAudioTime.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioTime_h
#define NAVAudioTime_h    

#include "NNSObject.h"

#define js_value_AVAudioTime(x) js_value_wrapper(x, AVAudioTime)
#define to_value_AVAudioTime(x) to_value_wrapper(x, AVAudioTime)
#define is_value_AVAudioTime(x) is_value_wrapper(x, AVAudioTime)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioTime, NSObject);
  //JS_METHOD(iosMethodName);
  //JS_PROP(iosPropertyName);
JS_WRAP_CLASS_END(AVAudioTime);

#endif /* NAVAudioTime_h */