//
//  NUITextSelectionRect.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextSelectionRect_h
#define NUITextSelectionRect_h    

#include "NNSObject.h"

#define js_value_UITextSelectionRect(x) js_value_wrapper(x, UITextSelectionRect)
#define to_value_UITextSelectionRect(x) to_value_wrapper(x, UITextSelectionRect)
#define is_value_UITextSelectionRect(x) is_value_wrapper(x, UITextSelectionRect)

JS_WRAP_CLASS(UITextSelectionRect, NSObject);
  // TODO: declare UITextSelectionRect methods and properties
JS_WRAP_CLASS_END(UITextSelectionRect);

#endif /* NUITextSelectionRect_h */