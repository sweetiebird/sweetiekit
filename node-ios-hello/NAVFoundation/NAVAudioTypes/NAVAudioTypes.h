//
//  NAVAudioTypes.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioTypes_h
#define NAVAudioTypes_h    

#include "NNSObject.h"

JS_DECLARE_STRUCT(AVAudio3DPoint);
JS_DECLARE_STRUCT(AVAudio3DVector);
//
//#define js_value_AVAudio3DVector js_value_AVAudio3DPoint
//#define to_value_AVAudio3DVector to_value_AVAudio3DPoint
//#define is_value_AVAudio3DVector is_value_AVAudio3DPoint

JS_DECLARE_STRUCT(AVAudio3DVectorOrientation);
JS_DECLARE_STRUCT(AVAudio3DAngularOrientation);

JS_WRAP_GLOBALS(AVAudioTypes);
  // TODO: declare AVAudioTypes globals
JS_WRAP_GLOBALS_END(AVAudioTypes);

#endif /* NAVAudioTypes_h */
