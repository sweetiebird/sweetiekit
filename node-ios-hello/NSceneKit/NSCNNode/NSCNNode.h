//
//  NSCNNode.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNNode_h
#define NSCNNode_h

#import <SceneKit/SceneKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNNode : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNNode();
  virtual ~NSCNNode();

  static NAN_METHOD(New);
  static NAN_METHOD(AddChildNode);
  static NAN_METHOD(Clone);
  JS_PROP(SimdTransform);
  JS_PROP(SimdWorldTransform);
  JS_PROP(Light);
  JS_PROP(Position);
  JS_PROP(EulerAngles);
  JS_PROP(scale);
  JS_PROP(geometry);
};

#endif /* NSCNNode_h */
