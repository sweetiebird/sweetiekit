//
//  NCLGeocoder.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLGeocoder_h
#define NCLGeocoder_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCLGeocoder : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCLGeocoder();
  virtual ~NCLGeocoder();

  static NAN_METHOD(New);
  static NAN_METHOD(geocodeAddressString);
};

#endif /* NCLGeocoder_h */
