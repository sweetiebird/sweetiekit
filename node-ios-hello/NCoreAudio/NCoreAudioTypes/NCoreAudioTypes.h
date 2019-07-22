//
//  NCoreAudioTypes.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCoreAudioTypes_h
#define NCoreAudioTypes_h    

#include "NNSObject.h"

#define js_value_CoreAudioTypes(x) js_value_wrapper(x, CoreAudioTypes)
#define to_value_CoreAudioTypes(x) to_value_wrapper(x, CoreAudioTypes)
#define is_value_CoreAudioTypes(x) is_value_wrapper(x, CoreAudioTypes)

JS_DECLARE_STRUCT(AudioStreamPacketDescription);
JS_DECLARE_STRUCT(AudioStreamBasicDescription);
JS_DECLARE_STRUCT(AudioComponentDescription);

#ifdef __OBJC__
@interface CoreAudioTypes : NSObject
@end
#endif

JS_WRAP_CLASS(CoreAudioTypes, NSObject);
JS_WRAP_CLASS_END(CoreAudioTypes);

#endif /* NCoreAudioTypes_h */
