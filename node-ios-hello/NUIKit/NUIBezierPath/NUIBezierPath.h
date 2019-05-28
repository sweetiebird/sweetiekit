//
//  NUIBezierPath.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-16.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIBezierPath_h
#define NUIBezierPath_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

#define js_value_UIBezierPath(x) js_value_wrapper(x, UIBezierPath)
#define to_value_UIBezierPath(x) to_value_wrapper(x, UIBezierPath)

class NUIBezierPath : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIBezierPath();
  virtual ~NUIBezierPath();

  static NAN_METHOD(New);
  static NAN_METHOD(bezierPath);
  static NAN_METHOD(bezierPathWithRect);
  static NAN_METHOD(bezierPathWithOvalInRect);
  static NAN_METHOD(bezierPathWithArcCenter);
  static NAN_METHOD(moveToPoint);
  
  JS_PROP(lineWidth);
};

#endif /* NUIBezierPath_h */
