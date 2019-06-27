//
//  NAVAudio3DMixing.h
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudio3DMixing_h
#define NAVAudio3DMixing_h    

#include "NNSObject.h"

#define js_value_AVAudio3DMixing(x) js_protocol_wrapper(x, AVAudio3DMixing)
#define to_value_AVAudio3DMixing(x) to_protocol_wrapper(x, AVAudio3DMixing)
#define is_value_AVAudio3DMixing(x) is_protocol_wrapper(x, AVAudio3DMixing)

JS_WRAP_PROTOCOL(AVAudio3DMixing, NSObject);
  // TODO: declare AVAudio3DMixing methods and properties
JS_WRAP_PROTOCOL_END(AVAudio3DMixing, NSObject);

#if __OBJC__
@interface AVAudio3DMixingType : NSObject<AVAudio3DMixing>
@end
#endif

#endif /* NAVAudio3DMixing_h */