//
//  NNSUserDefaults.h
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUserDefaults_h
#define NNSUserDefaults_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NNSUserDefaults : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NNSUserDefaults();
  virtual ~NNSUserDefaults();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_GETTER(StandardUserDefaultsGetter);
  static NAN_METHOD(Synchronize);
  static NAN_METHOD(SetValueForKey);
  static NAN_METHOD(ObjectForKey);
  static NAN_METHOD(StringForKey);
  
};


#endif /* NNSUserDefaults_h */
