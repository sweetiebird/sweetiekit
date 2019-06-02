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

#define js_value_UIPresentationController(x) js_value_wrapper(x, UIPresentationController)
#define to_value_UIPresentationController(x) to_value_wrapper(x, UIPresentationController)
#define is_value_UIPresentationController(x) is_value_wrapper(x, UIPresentationController)

JS_WRAP_CLASS(UIPresentationController, NSObject);
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
JS_WRAP_CLASS_END(UIPresentationController);

#endif /* NUIPresentationController_h */
