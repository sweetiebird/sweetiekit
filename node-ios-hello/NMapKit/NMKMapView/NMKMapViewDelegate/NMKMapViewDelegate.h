//
//  NMKMapViewDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapViewDelegate_h
#define NMKMapViewDelegate_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKMapViewDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKMapViewDelegate();
  virtual ~NMKMapViewDelegate();

  static NAN_METHOD(New);
};

#endif /* NMKMapViewDelegate_h */