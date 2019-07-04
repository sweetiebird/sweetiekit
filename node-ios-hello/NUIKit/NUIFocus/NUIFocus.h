//
//  NUIFocus.h
//
//  Created by Shawn Presser on 7/3/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIFocus_h
#define NUIFocus_h    

#include "NNSObject.h"

#define js_value_UIFocusHeading(x) JS_ENUM(UIFocusHeading, NSUInteger, x)
#define to_value_UIFocusHeading(x) TO_ENUM(UIFocusHeading, NSUInteger, x)
#define is_value_UIFocusHeading(x) IS_ENUM(UIFocusHeading, NSUInteger, x)

#define js_value_UIFocusSoundIdentifier(x) JS_ENUM(UIFocusSoundIdentifier, NSString, x)
#define to_value_UIFocusSoundIdentifier(x) TO_ENUM(UIFocusSoundIdentifier, NSString, x)
#define is_value_UIFocusSoundIdentifier(x) IS_ENUM(UIFocusSoundIdentifier, NSString, x)

JS_WRAP_GLOBALS(UIFocus);
  // TODO: declare UIFocus globals
JS_WRAP_GLOBALS_END(UIFocus);

#endif /* NUIFocus_h */
