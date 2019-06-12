//
//  NUIPresentationController.mm
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPresentationController.h"

NUIPresentationController::NUIPresentationController() {}
NUIPresentationController::~NUIPresentationController() {}

JS_INIT_CLASS(UIPresentationController, NSObject);
  // instance members (proto)
  JS_SET_PROP(proto, "frameOfPresentedViewInContainerViewCallback", FrameOfPresentedViewInContainerView);
  JS_SET_PROP(proto, "presentationTransitionWillBeginCallback", PresentationTransitionWillBegin);
  JS_SET_PROP(proto, "dismissalTransitionWillBeginCallback", DismissalTransitionWillBegin);
  JS_SET_PROP(proto, "containerWillLayoutSubviewsCallback", ContainerWillLayoutSubviews);
  JS_SET_PROP(proto, "sizeForChildContentContainerCallback", SizeForChildContentContainer);
  JS_SET_PROP_READONLY(proto, "containerView", ContainerView);
  JS_SET_PROP_READONLY(proto, "presentedView", PresentedView);
  // static members (ctor)
  JS_INIT_CTOR(UIPresentationController, NSObject);
JS_INIT_CLASS_END(UIPresentationController, NSObject);

#include "NUIViewController.h"

NAN_METHOD(NUIPresentationController::New) {
  JS_RECONSTRUCT(UIPresentationController);
  
  Local<Object> obj = info.This();
  
  NUIPresentationController *view = new NUIPresentationController();
  
  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIPresentationController *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      NUIViewController *presented = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));
      NUIViewController *presenting = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[1]));
      view->SetNSObject([[UIPresentationController alloc] initWithPresentedViewController:presented->As<UIViewController>() presentingViewController:presenting->As<UIViewController>()]);
    }
  }
  view->Wrap(obj);
  
  JS_SET_RETURN(obj);
}

NAN_SETTER(NUIPresentationController::FrameOfPresentedViewInContainerViewSetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_frameOfPresentedView.Reset(Local<Function>::Cast(value));
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIPresentationController* p = pres->As<UIPresentationController>();
//      [p setFrameOfPresentedViewCallback:^ CGRect (void) {
//        Local<Value> value = pres->_frameOfPresentedView("NUIPresentationController::FrameOfPresentedViewInContainerViewSetter");
//          double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
//          double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
//          double x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
//          double y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
//          return CGRectMake(x, y, width, height);
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::FrameOfPresentedViewInContainerViewGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  
  info.GetReturnValue().Set(pres->_frameOfPresentedView.GetValue());
}

NAN_SETTER(NUIPresentationController::PresentationTransitionWillBeginSetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_presentationTransitionWillBegin.Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIPresentationController* p = pres->As<UIPresentationController>();
//      [p setPresentationTransitionWillBeginCallback: ^ (void) {
//        pres->_presentationTransitionWillBegin("NUIPresentationController::PresentationTransitionWillBeginSetter");
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::PresentationTransitionWillBeginGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());

  info.GetReturnValue().Set(pres->_presentationTransitionWillBegin.GetValue());
}

NAN_SETTER(NUIPresentationController::DismissalTransitionWillBeginSetter) {
  Nan::HandleScope scope;

  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_dismissalTransitionWillBegin.Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIPresentationController* p = pres->As<UIPresentationController>();
//      [p setDismissalTransitionWillBeginCallback: ^ (void) {
//        pres->_dismissalTransitionWillBegin("NUIPresentationController::DismissalTransitionWillBeginSetter");
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::DismissalTransitionWillBeginGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  
  info.GetReturnValue().Set(pres->_dismissalTransitionWillBegin.GetValue());
}

NAN_SETTER(NUIPresentationController::ContainerWillLayoutSubviewsSetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_containerWillLayoutSubviews.Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIPresentationController* p = pres->As<UIPresentationController>();
//      [p setContainerWillLayoutSubviewsCallback: ^ (void) {
//        pres->_containerWillLayoutSubviews("NUIPresentationController::ContainerWillLayoutSubviewsSetter");
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::ContainerWillLayoutSubviewsGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  
  info.GetReturnValue().Set(pres->_containerWillLayoutSubviews.GetValue());
}

NAN_SETTER(NUIPresentationController::SizeForChildContentContainerSetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  pres->_containerWillLayoutSubviews.Reset(Local<Function>::Cast(value));

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIPresentationController* p = pres->As<UIPresentationController>();
//      [p setSizeForChildContentContainerCallback:^ CGSize (id<UIContentContainer> _Nonnull contentContainer, CGSize parentSize) {
//      Local<Value> value = pres->_sizeForChildContentContainer("NUIPresentationController::SizeForChildContentContainerSetter");
//          double width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
//          double height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
//          return CGSizeMake(width, height);
//      }];
    });
  }
}

NAN_GETTER(NUIPresentationController::SizeForChildContentContainerGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  
  info.GetReturnValue().Set(pres->_sizeForChildContentContainer.GetValue());
}

#include "NUIView.h"

NAN_GETTER(NUIPresentationController::ContainerViewGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  UIView *container = [pres->As<UIPresentationController>() containerView];
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor(container, NUIView::type));
}

NAN_GETTER(NUIPresentationController::PresentedViewGetter) {
  Nan::HandleScope scope;
  
  NUIPresentationController *pres = ObjectWrap::Unwrap<NUIPresentationController>(info.This());
  UIView *presented = [pres->As<UIPresentationController>() presentedView];
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor(presented, NUIView::type));
}

