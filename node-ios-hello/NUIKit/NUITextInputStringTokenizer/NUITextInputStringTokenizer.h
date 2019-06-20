//
//  NUITextInputStringTokenizer.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextInputStringTokenizer_h
#define NUITextInputStringTokenizer_h    

#include "NNSObject.h"

#define js_value_UITextInputStringTokenizer(x) js_value_wrapper(x, UITextInputStringTokenizer)
#define to_value_UITextInputStringTokenizer(x) to_value_wrapper(x, UITextInputStringTokenizer)
#define is_value_UITextInputStringTokenizer(x) is_value_wrapper(x, UITextInputStringTokenizer)

JS_WRAP_CLASS(UITextInputStringTokenizer, NSObject);
// UITextInputTokenizer
  JS_METHOD(rangeEnclosingPositionWithGranularityInDirection);
  JS_METHOD(isPositionAtBoundaryInDirection);
  JS_METHOD(positionFromPositionToBoundaryInDirection);
  JS_METHOD(isPositionWithinTextUnitInDirection);
// UITextInputStringTokenizer
  JS_METHOD(initWithTextInput);
JS_WRAP_CLASS_END(UITextInputStringTokenizer);

#endif /* NUITextInputStringTokenizer_h */
