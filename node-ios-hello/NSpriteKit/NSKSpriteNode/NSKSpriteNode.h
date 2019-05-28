//
//  NSKSpriteNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/11/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKSpriteNode_h
#define NSKSpriteNode_h

#import "NSKNode.h"

#define js_value_SKSpriteNode(x) js_value_wrapper_known(x, SKSpriteNode)
#define to_value_SKSpriteNode(x) to_value_wrapper(x, SKSpriteNode)

class NSKSpriteNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKSpriteNode();
  virtual ~NSKSpriteNode();

  static NAN_METHOD(New);
  JS_PROP(size);
  JS_PROP(colorBlendFactor);
  JS_PROP(color);
  JS_METHOD(scaleToSize);
};

#endif /* NSKSpriteNode_h */
