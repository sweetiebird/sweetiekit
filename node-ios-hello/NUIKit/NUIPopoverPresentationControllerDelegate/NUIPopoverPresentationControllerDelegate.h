//
//  NUIPopoverPresentationControllerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPopoverPresentationControllerDelegate_h
#define NUIPopoverPresentationControllerDelegate_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIPopoverPresentationControllerDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIPopoverPresentationControllerDelegate();
  virtual ~NUIPopoverPresentationControllerDelegate();

  static NAN_METHOD(New);
  JS_PROP(adaptivePresentationStyle);

  sweetiekit::JSFunction _adaptivePresentationStyle;
};

#endif /* NUIPopoverPresentationControllerDelegate_h */
