//
//  NSKLabelNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKLabelNode_h
#define NSKLabelNode_h

#include "NSKNode.h"

#define js_value_SKLabelNode(x) js_value_wrapper_known(x, SKLabelNode)
#define to_value_SKLabelNode(x) to_value_wrapper(x, SKLabelNode)

class NSKLabelNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKLabelNode();
  virtual ~NSKLabelNode();

  static NAN_METHOD(New);
  JS_PROP(text);
  JS_PROP(attributedText);
  JS_PROP(preferredMaxLayoutWidth);
  JS_PROP(numberOfLines);
  JS_PROP(fontName);
};


#endif /* NSKLabelNode_h */
