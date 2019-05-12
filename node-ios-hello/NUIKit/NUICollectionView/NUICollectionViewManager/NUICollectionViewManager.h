//
//  NUICollectionViewManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionViewManager_h
#define NUICollectionViewManager_h

#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NUICollectionViewManager : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUICollectionViewManager();
  virtual ~NUICollectionViewManager();

  static NAN_METHOD(New);
  JS_PROP(DidSelectItemAt);
  sweetiekit::JSFunction _numberItemsInSection;
  sweetiekit::JSFunction _cellForItemAt;
  sweetiekit::JSFunction _didSelectItemAt;
};

#endif /* NUICollectionViewManager_h */
