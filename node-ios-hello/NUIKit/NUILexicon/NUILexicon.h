//
//  NUILexicon.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILexicon_h
#define NUILexicon_h    

#include "NNSObject.h"

#define js_value_UILexicon(x) js_value_wrapper(x, UILexicon)
#define to_value_UILexicon(x) to_value_wrapper(x, UILexicon)
#define is_value_UILexicon(x) is_value_wrapper(x, UILexicon)

JS_WRAP_CLASS(UILexicon, NSObject);
  JS_PROP_READONLY(entries);
JS_WRAP_CLASS_END(UILexicon);

#endif /* NUILexicon_h */
