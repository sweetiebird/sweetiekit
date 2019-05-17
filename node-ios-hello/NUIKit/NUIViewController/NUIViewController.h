//
//  NUIViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#import <UIKit/UIKit.h>
#include "NUIResponder.h"

class NUIViewController : public NUIResponder {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIViewController();
  virtual ~NUIViewController();

  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_GETTER(ViewGetter);
  static NAN_METHOD(PresentViewController);
  static NAN_METHOD(DismissViewController);
  JS_PROP(TransitioningDelegate);
  JS_PROP(ModalPresentationStyle);
  JS_PROP(ToolbarItems);
  JS_PROP(TabBarItem);
  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
};

#endif /* NUIViewController_h */
