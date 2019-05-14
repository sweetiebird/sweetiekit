//
//  NMKView.h
//  node-ios-hello
//
//  Created by undefined on 2019-5-14.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKView_h
#define NMKView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NMKView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NMKView();
  virtual ~NMKView();

  static NAN_METHOD(New);
};

#endif /* NMKView_h */