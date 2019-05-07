//
//  NARWorldTrackingConfiguration.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NARWorldTrackingConfiguration_h
#define NARWorldTrackingConfiguration_h

#import <UIKit/UIKit.h>
#import "NSKView.h"
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NARWorldTrackingConfiguration : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NARWorldTrackingConfiguration();
  virtual ~NARWorldTrackingConfiguration();

  static NAN_METHOD(New);
};

#endif /* NARWorldTrackingConfiguration_h */
