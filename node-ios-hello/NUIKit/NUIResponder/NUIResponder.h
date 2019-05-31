//
//  NUIResponder.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIResponder_h
#define NUIResponder_h

#include "defines.h"
#include "NNSObject.h"

using namespace v8;
using namespace node;

class NUIResponder : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIResponder();
  virtual ~NUIResponder();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_METHOD(touchesBeganWithEvent);
  static NAN_METHOD(touchesMovedWithEvent);
  static NAN_METHOD(touchesEndedWithEvent);
  JS_PROP(nextResponder);
  JS_PROP(canBecomeFirstResponder);
  JS_PROP(canResignFirstResponder);
  JS_PROP(isFirstResponder);
  JS_PROP(undoManager);
  // UIKeyCommand
//  JS_PROP(input);
//  JS_PROP(modifierFlags);
//  JS_PROP(discoverabilityTitle);
  // UIResponder
  JS_PROP(keyCommands);
  JS_PROP(inputView);
  JS_PROP(inputAccessoryView);
  JS_PROP(inputAssistantItem);
  JS_PROP(inputViewController);
  JS_PROP(inputAccessoryViewController);
  JS_PROP(textInputMode);
  JS_PROP(textInputContextIdentifier);
  JS_PROP(userActivity);
  JS_PROP(touchesBegan);
  JS_PROP(touchesMoved);
  JS_PROP(touchesEnded);
};

#endif /* NUIResponder_h */
