//
//  NAVAudioConnectionPoint.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioConnectionPoint_h
#define NAVAudioConnectionPoint_h    

#include "NNSObject.h"

#define js_value_AVAudioConnectionPoint(x) js_value_wrapper(x, AVAudioConnectionPoint)
#define to_value_AVAudioConnectionPoint(x) to_value_wrapper(x, AVAudioConnectionPoint)
#define is_value_AVAudioConnectionPoint(x) is_value_wrapper(x, AVAudioConnectionPoint)

// SpriteKit enums
//#define js_value_SCNMovabilityHint(x) JS_ENUM(SCNMovabilityHint, NSInteger, x)
//#define to_value_SCNMovabilityHint(x) TO_ENUM(SCNMovabilityHint, NSInteger, x)
//#define is_value_SCNMovabilityHint(x) IS_ENUM(SCNMovabilityHint, NSInteger, x)

JS_WRAP_CLASS(AVAudioConnectionPoint, NSObject);
  JS_METHOD(initWithNodeBus);
  JS_PROP_READONLY(node);
  JS_PROP_READONLY(bus);
JS_WRAP_CLASS_END(AVAudioConnectionPoint);

#endif /* NAVAudioConnectionPoint_h */
