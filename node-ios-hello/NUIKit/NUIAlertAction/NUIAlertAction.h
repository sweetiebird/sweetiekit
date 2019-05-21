//
//  NUIAlertAction.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIAlertAction_h
#define NUIAlertAction_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIAlertAction : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIAlertAction();
  virtual ~NUIAlertAction();

  static NAN_METHOD(New);
};


#endif /* NUIAlertAction_h */
