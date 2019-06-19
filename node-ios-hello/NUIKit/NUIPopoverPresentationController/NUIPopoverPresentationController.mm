//
//  UIPopoverPresentationController.mm
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIPopoverPresentationController.h"

NUIPopoverPresentationController::NUIPopoverPresentationController() {}
NUIPopoverPresentationController::~NUIPopoverPresentationController() {}

JS_INIT_CLASS(UIPopoverPresentationController, UIPresentationController);
  // instance members (proto)
// UIPopoverPresentationController
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(permittedArrowDirections);
  JS_ASSIGN_PROTO_PROP(sourceView);
  JS_ASSIGN_PROTO_PROP(sourceRect);
  JS_ASSIGN_PROTO_PROP(canOverlapSourceViewRect);
  JS_ASSIGN_PROTO_PROP(barButtonItem);
  JS_ASSIGN_PROTO_PROP_READONLY(arrowDirection);
  JS_ASSIGN_PROTO_PROP(passthroughViews);
  JS_ASSIGN_PROTO_PROP(backgroundColor);
  JS_ASSIGN_PROTO_PROP(popoverLayoutMargins);
  JS_ASSIGN_PROTO_PROP(popoverBackgroundViewClass);

  // static members (ctor)
  JS_INIT_CTOR(UIPopoverPresentationController, UIPresentationController);
  
  // constants (exports)

//typedef NS_OPTIONS(NSUInteger, UIPopoverArrowDirection) {
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionUp, NSUInteger); // = 1UL << 0,
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionDown, NSUInteger); // = 1UL << 1,
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionLeft, NSUInteger); // = 1UL << 2,
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionRight, NSUInteger); // = 1UL << 3,
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionAny, NSUInteger); // = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown | UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight,
  JS_ASSIGN_ENUM(UIPopoverArrowDirectionUnknown, NSUInteger); // = NSUIntegerMax
//};
  
JS_INIT_CLASS_END(UIPopoverPresentationController, UIPresentationController);

#include "NUIViewController.h"

NAN_METHOD(NUIPopoverPresentationController::New) {
  JS_RECONSTRUCT(UIPopoverPresentationController);
  @autoreleasepool {
    UIPopoverPresentationController* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIPopoverPresentationController *)(info[0].As<External>()->Value());
    }
    if (self) {
      NUIPopoverPresentationController *wrapper = new NUIPopoverPresentationController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIPopoverPresentationController::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIPopoverPresentationController::delegateGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UIPopoverPresentationControllerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::delegateSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UIPopoverPresentationControllerDelegate>*/, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"UIPopoverPresentationController::delegate"];
  }
}

NAN_GETTER(NUIPopoverPresentationController::permittedArrowDirectionsGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPopoverArrowDirection([self permittedArrowDirections]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::permittedArrowDirectionsSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIPopoverArrowDirection, input);
    [self setPermittedArrowDirections: input];
  }
}

#include "NUIView.h"

NAN_GETTER(NUIPopoverPresentationController::sourceViewGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self sourceView]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::sourceViewSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIView, input);
    [self setSourceView: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::sourceRectGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self sourceRect]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::sourceRectSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setSourceRect: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::canOverlapSourceViewRectGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canOverlapSourceViewRect]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::canOverlapSourceViewRectSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCanOverlapSourceViewRect: input];
  }
}

#include "NUIBarButtonItem.h"

NAN_GETTER(NUIPopoverPresentationController::barButtonItemGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIBarButtonItem([self barButtonItem]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::barButtonItemSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIBarButtonItem, input);
    [self setBarButtonItem: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::arrowDirectionGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPopoverArrowDirection([self arrowDirection]));
  }
}

NAN_GETTER(NUIPopoverPresentationController::passthroughViewsGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIView*>([self passthroughViews]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::passthroughViewsSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIView*>, input);
    [self setPassthroughViews: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::backgroundColorGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self backgroundColor]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::backgroundColorSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setBackgroundColor: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::popoverLayoutMarginsGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self popoverLayoutMargins]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::popoverLayoutMarginsSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setPopoverLayoutMargins: input];
  }
}

NAN_GETTER(NUIPopoverPresentationController::popoverBackgroundViewClassGetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id /*Class<UIPopoverBackgroundViewMethods>*/([self popoverBackgroundViewClass]));
  }
}

NAN_SETTER(NUIPopoverPresentationController::popoverBackgroundViewClassSetter) {
  JS_UNWRAP(UIPopoverPresentationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id /*Class<UIPopoverBackgroundViewMethods>*/, input);
    [self setPopoverBackgroundViewClass: input];
  }
}

