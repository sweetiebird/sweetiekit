//
//  NMKAnnotationView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKAnnotationView_h
#define NMKAnnotationView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKAnnotationView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKAnnotationView();
  virtual ~NMKAnnotationView();

  static NAN_METHOD(New);
  JS_PROP(Image);
  JS_PROP(Annotation);
};

#endif /* NMKAnnotationView_h */
