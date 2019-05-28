//
//  NSKCameraNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKCameraNode_h
#define NSKCameraNode_h  

#include "NNSObject.h"

#define js_value_SKCameraNode(x) js_value_wrapper_known(x, SKCameraNode)
#define to_value_SKCameraNode(x) to_value_wrapper(x, SKCameraNode)

class NSKCameraNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKCameraNode();
  virtual ~NSKCameraNode();

  static NAN_METHOD(New);
};

#endif /* NSKCameraNode_h */
