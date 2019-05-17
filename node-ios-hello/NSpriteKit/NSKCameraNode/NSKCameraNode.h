//
//  NSKCameraNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKCameraNode_h
#define NSKCameraNode_h    

#import <UIKit/UIKit.h>
#include "NSKNode.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKCameraNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKCameraNode();
  virtual ~NSKCameraNode();

  static NAN_METHOD(New);
};

#endif /* NSKCameraNode_h */