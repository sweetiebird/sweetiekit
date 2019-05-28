//
//  NUIApplication.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIApplication_h
#define NUIApplication_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIApplication : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIApplication();
  virtual ~NUIApplication();

  static NAN_METHOD(New);
  static NAN_METHOD(shared);
  
  static NAN_METHOD(Destroy);
  static NAN_GETTER(KeyWindowGetter);
  
  static NAN_METHOD(Main);
  
  static NAN_METHOD(screenShot);

private:
  static UIWindow* tmp_UIWindow;
  
};


#endif /* NUIApplication_h */
