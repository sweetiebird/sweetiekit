//
//  NSCNScene.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/13/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNScene_h
#define NSCNScene_h

#import <SceneKit/SceneKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNScene : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNScene();
  virtual ~NSCNScene();

  static NAN_METHOD(New);
  JS_PROP(RootNode);
};

#endif /* NSCNScene_h */
