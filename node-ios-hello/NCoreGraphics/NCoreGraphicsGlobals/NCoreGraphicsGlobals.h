//
//  NCoreGraphicsGlobals.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCoreGraphicsGlobals_h
#define NCoreGraphicsGlobals_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCoreGraphicsGlobals : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCoreGraphicsGlobals();
  virtual ~NCoreGraphicsGlobals();

  static NAN_METHOD(New);
  static NAN_METHOD(UIGraphicsBeginImageContextWithOptions);
  static NAN_METHOD(UIGraphicsGetImageFromCurrentImageContext);
  static NAN_METHOD(UIGraphicsEndImageContext);
};

#endif /* NCoreGraphicsGlobals_h */
