//
//  NUINavigationItem.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUINavigationItem_h
#define NUINavigationItem_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUINavigationItem : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUINavigationItem();
  virtual ~NUINavigationItem();

  static NAN_METHOD(New);
  static NAN_METHOD(initWithTitle);
  
  JS_PROP(title);
  JS_PROP(backBarButtonItem);
  JS_PROP(titleView);
  JS_PROP(prompt);
};

#endif /* NUINavigationItem_h */
