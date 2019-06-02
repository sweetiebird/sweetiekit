//
//  NUILabel.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUILabel_h
#define NUILabel_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUILabel : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUILabel();
  virtual ~NUILabel();

  static NAN_METHOD(New);
  static NAN_METHOD(Alloc);
  static NAN_METHOD(Destroy);
  static NAN_GETTER(TextGetter);
  static NAN_SETTER(TextSetter);
  JS_METHOD(initWithXYWidthHeight);
  JS_PROP(NumberOfLines);
  JS_PROP(Font);
  JS_PROP(TextColor);
  JS_PROP(HighlightedTextColor);
  JS_PROP(IsHighlighted);
  JS_PROP(textAlignment);
  JS_PROP(attributedText);
};

#endif /* NUILabel_h */
