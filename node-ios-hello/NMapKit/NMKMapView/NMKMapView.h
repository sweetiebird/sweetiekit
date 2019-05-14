//
//  NMKMapView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKMapView_h
#define NMKMapView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKMapView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKMapView();
  virtual ~NMKMapView();

  static NAN_METHOD(New);
  static NAN_METHOD(SetRegion);
  static NAN_METHOD(AddAnnotation);
};

#endif /* NMKMapView_h */
