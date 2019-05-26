//
//  NCAShapeLayer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-25.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCAShapeLayer_h
#define NCAShapeLayer_h    

#import <UIKit/UIKit.h>
#include "NCALayer.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCAShapeLayer : public NCALayer {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCAShapeLayer();
  virtual ~NCAShapeLayer();

  static NAN_METHOD(New);
  JS_PROP(lineWidth);
  JS_PROP(fillColor);
  JS_PROP(strokeColor);
  JS_PROP(path);
};

#endif /* NCAShapeLayer_h */
