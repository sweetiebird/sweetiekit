//
//  NRPPreviewViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewController_h
#define NRPPreviewViewController_h    

#import <UIKit/UIKit.h>
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NRPPreviewViewController : public NUIViewController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NRPPreviewViewController();
  virtual ~NRPPreviewViewController();

  static NAN_METHOD(New);
  JS_PROP(previewControllerDelegate);
  Nan::Persistent<Value> _delegate;
};

#endif /* NRPPreviewViewController_h */
