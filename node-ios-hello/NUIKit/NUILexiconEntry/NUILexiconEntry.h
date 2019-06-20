//
//  NUILexiconEntry.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILexiconEntry_h
#define NUILexiconEntry_h    

#include "NNSObject.h"

#define js_value_UILexiconEntry(x) js_value_wrapper(x, UILexiconEntry)
#define to_value_UILexiconEntry(x) to_value_wrapper(x, UILexiconEntry)
#define is_value_UILexiconEntry(x) is_value_wrapper(x, UILexiconEntry)

JS_WRAP_CLASS(UILexiconEntry, NSObject);
  JS_PROP_READONLY(documentText);
  JS_PROP_READONLY(userInput);
JS_WRAP_CLASS_END(UILexiconEntry);

#endif /* NUILexiconEntry_h */
