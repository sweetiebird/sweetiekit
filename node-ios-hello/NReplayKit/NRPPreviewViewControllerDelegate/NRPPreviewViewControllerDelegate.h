//
//  NRPPreviewViewControllerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewControllerDelegate_h
#define NRPPreviewViewControllerDelegate_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NRPPreviewViewControllerDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NRPPreviewViewControllerDelegate();
  virtual ~NRPPreviewViewControllerDelegate();

  static NAN_METHOD(New);
  JS_PROP(previewControllerDidFinish);
  sweetiekit::JSFunction _didFinish;
};

#endif /* NRPPreviewViewControllerDelegate_h */
