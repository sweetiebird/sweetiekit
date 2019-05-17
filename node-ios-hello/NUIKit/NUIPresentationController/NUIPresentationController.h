//
//  NUIPresentationController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPresentationController_h
#define NUIPresentationController_h

#include "NNSObject.h"

using namespace v8;
using namespace node;

class NUIPresentationController : public NNSObject {
public:
  
  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);
  
  NUIPresentationController();
  virtual ~NUIPresentationController();
  
  static NAN_METHOD(New);
  JS_PROP(FrameOfPresentedViewInContainerView);
  JS_PROP(PresentationTransitionWillBegin);
  JS_PROP(DismissalTransitionWillBegin);
  JS_PROP(ContainerWillLayoutSubviews);
  JS_PROP(SizeForChildContentContainer);
  JS_PROP(ContainerView);
  JS_PROP(PresentedView);
  sweetiekit::JSFunction _frameOfPresentedView;
  sweetiekit::JSFunction _presentationTransitionWillBegin;
  sweetiekit::JSFunction _dismissalTransitionWillBegin;
  sweetiekit::JSFunction _containerWillLayoutSubviews;
  sweetiekit::JSFunction _sizeForChildContentContainer;
};

#endif /* NUIPresentationController_h */
