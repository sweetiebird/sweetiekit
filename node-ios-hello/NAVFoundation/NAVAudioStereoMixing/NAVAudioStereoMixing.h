//
//  NAVAudioStereoMixing.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioStereoMixing_h
#define NAVAudioStereoMixing_h    

#include "NNSObject.h"

#define js_value_AVAudioStereoMixing(x) js_protocol_wrapper(x, AVAudioStereoMixing)
#define to_value_AVAudioStereoMixing(x) to_protocol_wrapper(x, AVAudioStereoMixing)
#define is_value_AVAudioStereoMixing(x) is_protocol_wrapper(x, AVAudioStereoMixing)

JS_WRAP_PROTOCOL(AVAudioStereoMixing, NSObject);
  // TODO: declare AVAudioStereoMixing methods and properties
JS_WRAP_PROTOCOL_END(AVAudioStereoMixing, NSObject);

#if __OBJC__
@interface AVAudioStereoMixingType : NSObject<AVAudioStereoMixing>
@end
#endif

#endif /* NAVAudioStereoMixing_h */