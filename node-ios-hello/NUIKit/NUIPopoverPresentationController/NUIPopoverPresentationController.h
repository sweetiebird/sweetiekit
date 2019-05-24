//
//  NUIPopoverPresentationController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverPresentationController_h
#define NUIPopoverPresentationController_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIPopoverPresentationController : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIPopoverPresentationController();
  virtual ~NUIPopoverPresentationController();

  static NAN_METHOD(New);
  JS_PROP(permittedArrowDirections);
  JS_PROP(sourceView);
  JS_PROP(sourceRect);
};

#endif /* NUIPopoverPresentationController_h */
