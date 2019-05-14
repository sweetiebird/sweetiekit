//
//  NMKCoordinateRegion.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKCoordinateRegion_h
#define NMKCoordinateRegion_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKCoordinateRegion : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKCoordinateRegion();
  virtual ~NMKCoordinateRegion();

  static NAN_METHOD(New);
};

#endif /* NMKCoordinateRegion_h */