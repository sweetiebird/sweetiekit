//
//  NCALayer.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCALayer_h
#define NCALayer_h

#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NCALayer : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCALayer();
  virtual ~NCALayer();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(AddAnimation);
  static NAN_METHOD(addSublayer);
  static NAN_METHOD(renderInContext);
  JS_PROP(CornerRadius);
  JS_PROP(BorderWidth);
  JS_PROP(BorderColor);
  JS_PROP(ShadowOffset);
  JS_PROP(ShadowColor);
  JS_PROP(ShadowRadius);
  JS_PROP(Position);
  JS_PROP(MasksToBounds);
  JS_PROP(shadowOpacity);
};


#endif /* NCALayer_h */
