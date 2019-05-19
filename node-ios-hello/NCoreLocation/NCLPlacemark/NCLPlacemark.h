//
//  NCLPlacemark.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLPlacemark_h
#define NCLPlacemark_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCLPlacemark : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLPlacemark();
  virtual ~NCLPlacemark();

  static NAN_METHOD(New);
  JS_PROP(location);
};

#endif /* NCLPlacemark_h */
