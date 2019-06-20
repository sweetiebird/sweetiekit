//
//  NUIDictationPhrase.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIDictationPhrase_h
#define NUIDictationPhrase_h    

#include "NNSObject.h"

#define js_value_UIDictationPhrase(x) js_value_wrapper(x, UIDictationPhrase)
#define to_value_UIDictationPhrase(x) to_value_wrapper(x, UIDictationPhrase)
#define is_value_UIDictationPhrase(x) is_value_wrapper(x, UIDictationPhrase)

JS_WRAP_CLASS(UIDictationPhrase, NSObject);
  JS_PROP_READONLY(text);
  JS_PROP_READONLY(alternativeInterpretations);
JS_WRAP_CLASS_END(UIDictationPhrase);

#endif /* NUIDictationPhrase_h */
