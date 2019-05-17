//
//  NUICollectionReusableView.h
//  node-ios-hello
//
//  Created by Shawn Presser on 5/16/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUICollectionReusableView_h
#define NUICollectionReusableView_h    

#import <UIKit/UIKit.h>
#include "NUIView.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUICollectionReusableView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUICollectionReusableView();
  virtual ~NUICollectionReusableView();

  static NAN_METHOD(New);
  JS_PROP(reuseIdentifier);
};

#endif /* NUICollectionReusableView_h */
