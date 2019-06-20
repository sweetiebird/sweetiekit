//
//  NUITextPosition.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextPosition_h
#define NUITextPosition_h    

#include "NNSObject.h"

#define js_value_UITextPosition(x) js_value_wrapper(x, UITextPosition)
#define to_value_UITextPosition(x) to_value_wrapper(x, UITextPosition)
#define is_value_UITextPosition(x) is_value_wrapper(x, UITextPosition)

JS_WRAP_CLASS(UITextPosition, NSObject);
  // TODO: declare UITextPosition methods and properties
JS_WRAP_CLASS_END(UITextPosition);

#endif /* NUITextPosition_h */