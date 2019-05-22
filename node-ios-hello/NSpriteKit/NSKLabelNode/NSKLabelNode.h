//
//  NSKLabelNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKLabelNode_h
#define NSKLabelNode_h

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "NSKNode.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKLabelNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKLabelNode();
  virtual ~NSKLabelNode();

  static NAN_METHOD(New);
  JS_PROP(Text);
  JS_PROP(preferredMaxLayoutWidth);
  JS_PROP(numberOfLines);
};


#endif /* NSKLabelNode_h */
