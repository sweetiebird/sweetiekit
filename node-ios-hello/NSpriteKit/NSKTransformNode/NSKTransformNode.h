//
//  NSKTransformNode.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/28/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKTransformNode_h
#define NSKTransformNode_h    

#import <UIKit/UIKit.h>
#include "NSKNode.h"

class NSKTransformNode : public NSKNode {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKTransformNode();
  virtual ~NSKTransformNode();

  JS_METHOD(New);
  JS_PROP(xRotation);
  JS_PROP(yRotation);
  JS_PROP(eulerAngles);
  JS_PROP(rotationMatrix);
  JS_PROP(quaternion);
};

#endif /* NSKTransformNode_h */
