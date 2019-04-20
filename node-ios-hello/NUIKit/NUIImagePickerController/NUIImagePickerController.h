//
//  NUIImagePickerController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerController_h
#define NUIImagePickerController_h

#import <UIKit/UIKit.h>
#include "NUINavigationController.h"
#include "NUIViewController.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIImagePickerController : public NUINavigationController {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIImagePickerController();
  virtual ~NUIImagePickerController();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
//  static NAN_GETTER(DelegateGetter);
//  static NAN_SETTER(DelegateSetter);
};

#endif /* NUIImagePickerController_h */
