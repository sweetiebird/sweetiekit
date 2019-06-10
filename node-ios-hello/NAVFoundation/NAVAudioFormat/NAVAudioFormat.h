//
//  NAVAudioFormat.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioFormat_h
#define NAVAudioFormat_h    

#include "NNSObject.h"

#define js_value_AVAudioFormat(x) js_value_wrapper(x, AVAudioFormat)
#define to_value_AVAudioFormat(x) to_value_wrapper(x, AVAudioFormat)
#define is_value_AVAudioFormat(x) is_value_wrapper(x, AVAudioFormat)

JS_WRAP_CLASS(AVAudioFormat, NSObject);
JS_WRAP_CLASS_END(AVAudioFormat);

#endif /* NAVAudioFormat_h */
