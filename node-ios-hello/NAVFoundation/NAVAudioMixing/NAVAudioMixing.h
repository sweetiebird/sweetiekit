//
//  NAVAudioMixing.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioMixing_h
#define NAVAudioMixing_h    

#include "NAVAudioStereoMixing.h"
#include "NAVAudio3DMixing.h"

#define js_value_AVAudioMixing(x) js_protocol_wrapper(x, AVAudioMixing)
#define to_value_AVAudioMixing(x) to_protocol_wrapper(x, AVAudioMixing)
#define is_value_AVAudioMixing(x) is_protocol_wrapper(x, AVAudioMixing)

#define js_value_AVAudio3DMixingRenderingAlgorithm(x) JS_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)
#define to_value_AVAudio3DMixingRenderingAlgorithm(x) TO_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)
#define is_value_AVAudio3DMixingRenderingAlgorithm(x) IS_ENUM(AVAudio3DMixingRenderingAlgorithm, NSInteger, x)


JS_WRAP_PROTOCOL(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);
  // TODO: declare AVAudioMixing methods and properties
JS_WRAP_PROTOCOL_END(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);

#if __OBJC__
@interface AVAudioMixingType : NSObject<AVAudioMixing, AVAudio3DMixing>
@end
#endif

#endif /* NAVAudioMixing_h */
