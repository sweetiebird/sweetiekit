//
//  NUIViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#include "NUIResponder.h"

// UIKit enums
#define js_value_UIModalPresentationStyle(x) JS_ENUM(UIModalPresentationStyle, NSInteger, x)
#define to_value_UIModalPresentationStyle(x) TO_ENUM(UIModalPresentationStyle, NSInteger, x)

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
  JS_PROP(navigationController);
  JS_PROP(navigationItem);
  JS_PROP(modalPresentationStyle);
  JS_PROP(popoverPresentationController);
  JS_PROP(preferredContentSize);
};

#endif /* NUIViewController_h */
