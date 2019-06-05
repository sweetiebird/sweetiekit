//
//  NMKDirectionsRequest.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKDirectionsRequest_h
#define NMKDirectionsRequest_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKDirectionsRequest : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKDirectionsRequest();
  virtual ~NMKDirectionsRequest();

  static NAN_METHOD(New);
};

#endif /* NMKDirectionsRequest_h */