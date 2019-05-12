//
//  NUITableViewManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewManager_h
#define NUITableViewManager_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NUITableViewManager : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUITableViewManager();
  virtual ~NUITableViewManager();

  static NAN_METHOD(New);
  JS_PROP(DidSelectRowAt);
  JS_PROP(NumberOfSections);
  sweetiekit::JSFunction _numberRowsInSection;
  sweetiekit::JSFunction _numberSections;
  sweetiekit::JSFunction _cellForRowAt;
  sweetiekit::JSFunction _didSelectRowAt;
  sweetiekit::JSFunction _titleForSection;
};

#endif /* NUITableViewManager_h */
