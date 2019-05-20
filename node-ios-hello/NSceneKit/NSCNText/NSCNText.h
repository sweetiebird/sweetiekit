//
//  NSCNText.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNText_h
#define NSCNText_h    

#import <UIKit/UIKit.h>
#include "NSCNGeometry.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNText : public NSCNGeometry {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNText();
  virtual ~NSCNText();

  static NAN_METHOD(New);
  JS_PROP(font);
};

#endif /* NSCNText_h */
