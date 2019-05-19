//
//  NCAEmitterLayer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAEmitterLayer_h
#define NCAEmitterLayer_h    

#import <UIKit/UIKit.h>
#include "NCALayer.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCAEmitterLayer : public NCALayer {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCAEmitterLayer();
  virtual ~NCAEmitterLayer();

  static NAN_METHOD(New);
  JS_PROP(emitterCells);
  JS_PROP(emitterPosition);
};

#endif /* NCAEmitterLayer_h */
