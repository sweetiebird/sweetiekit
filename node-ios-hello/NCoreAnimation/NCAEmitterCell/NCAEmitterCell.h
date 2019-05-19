//
//  NCAEmitterCell.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAEmitterCell_h
#define NCAEmitterCell_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCAEmitterCell : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCAEmitterCell();
  virtual ~NCAEmitterCell();

  static NAN_METHOD(New);
  static NAN_METHOD(emitterCell);
  
  JS_PROP(contents);
};

#endif /* NCAEmitterCell_h */
