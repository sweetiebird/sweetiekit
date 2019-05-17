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
  JS_PROP(DidFinishRendering);
  JS_PROP(DidUpdateUserLocation);
  JS_PROP(ViewForAnnotation);
  JS_PROP(DidSelectViewForAnnotation);
  sweetiekit::JSFunction _didFinishRendering;
  sweetiekit::JSFunction _didUpdateUserLocation;
  sweetiekit::JSFunction _viewForAnnotation;
  sweetiekit::JSFunction _didSelectViewForAnnotation;
};

#endif /* NMKMapViewDelegate_h */
