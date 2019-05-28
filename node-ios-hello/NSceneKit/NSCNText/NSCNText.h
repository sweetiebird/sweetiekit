//
//  NSCNText.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNText_h
#define NSCNText_h    

#include "NSCNGeometry.h"

#define js_value_SCNText(x) js_value_wrapper_known(x, SCNText)
#define to_value_SCNText(x) to_value_wrapper_known(x, SCNText)

class NSCNText : public NSCNGeometry {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNText();
  virtual ~NSCNText();

  static NAN_METHOD(New);
  JS_PROP(font);
  JS_PROP(string);
  JS_PROP(textSize);
};

#endif /* NSCNText_h */
