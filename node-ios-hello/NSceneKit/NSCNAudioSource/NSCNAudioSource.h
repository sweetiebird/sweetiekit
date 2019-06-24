//
//  NSCNAudioSource.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNAudioSource_h
#define NSCNAudioSource_h    

#include "NNSObject.h"

#define js_value_SCNAudioSource(x) js_value_wrapper(x, SCNAudioSource)
#define to_value_SCNAudioSource(x) to_value_wrapper(x, SCNAudioSource)
#define is_value_SCNAudioSource(x) is_value_wrapper(x, SCNAudioSource)

JS_WRAP_CLASS(SCNAudioSource, NSObject);
  // TODO: declare SCNAudioSource methods and properties
JS_WRAP_CLASS_END(SCNAudioSource);

#endif /* NSCNAudioSource_h */