//
//  NUINavigationController.mm
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUINavigationController.h"

NUINavigationController::NUINavigationController() {}
NUINavigationController::~NUINavigationController() {}

JS_INIT_CLASS(UINavigationController, UIViewController);
  // instance members (proto)
  JS_SET_METHOD(proto, "pushViewController", PushViewController);
  JS_SET_METHOD(proto, "popViewController", PopViewController);
  JS_SET_METHOD(proto, "popToRootViewController", PopToRootViewController);
  JS_SET_METHOD(proto, "popToViewController", PopToViewController);
  JS_SET_METHOD(proto, "setViewControllers", SetViewControllers);
  JS_ASSIGN_PROP_READONLY(proto, topViewController);
  JS_ASSIGN_PROP_READONLY(proto, visibleViewController);
  JS_ASSIGN_PROP(proto, viewControllers);
  JS_ASSIGN_PROP(proto, navigationBarHidden);
  JS_SET_PROP(proto, "isNavigationBarHidden", navigationBarHidden);
  JS_ASSIGN_PROP_READONLY(proto, navigationBar);
  JS_ASSIGN_PROP(proto, toolbarHidden);
  JS_SET_PROP(proto, "isToolbarHidden", toolbarHidden);
  JS_ASSIGN_PROP_READONLY(proto, toolbar);
  JS_ASSIGN_PROP(proto, delegate);
  JS_ASSIGN_PROP_READONLY(proto, interactivePopGestureRecognizer);
  JS_ASSIGN_PROP(proto, hidesBarsWhenKeyboardAppears);
  JS_ASSIGN_PROP(proto, hidesBarsOnSwipe);
  JS_ASSIGN_PROP_READONLY(proto, barHideOnSwipeGestureRecognizer);
  JS_ASSIGN_PROP(proto, hidesBarsWhenVerticallyCompact);
  JS_ASSIGN_PROP(proto, hidesBarsOnTap);
  JS_ASSIGN_PROP_READONLY(proto, barHideOnTapGestureRecognizer);

  // static members (ctor)
  JS_INIT_CTOR(UINavigationController, UIViewController);
JS_INIT_CLASS_END(UINavigationController, UIViewController);

NAN_METHOD(NUINavigationController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUINavigationController *ctrl = new NUINavigationController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UINavigationController *)(info[0].As<External>()->Value()));
  } else if (info.Length() > 0) {
    NUIViewController *child = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));

    @autoreleasepool {
      ctrl->SetNSObject([[UINavigationController alloc] initWithRootViewController:child->As<UIViewController>()]);
    }
  } else {
    @autoreleasepool {
      ctrl->SetNSObject([[UINavigationController alloc] init]);
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NAN_METHOD(NUINavigationController::SetViewControllers) {
  NUINavigationController *vc = ObjectWrap::Unwrap<NUINavigationController>(Local<Object>::Cast(info.This()));

  Local<Array> array = Local<Array>::Cast(info[0]);
  bool animated = TO_BOOL(info[1]);
  
  NSMutableArray *controllers = [NSMutableArray array];

  for (unsigned int i = 0; i < array->Length(); i++ ) {
    if (Nan::Has(array, i).FromJust()) {
      NUIViewController *view = ObjectWrap::Unwrap<NUIViewController>(JS_OBJ(array->Get(i)));
      [controllers addObject:view->As<UIViewController>()];
    }
  }
  
  UINavigationController* c = vc->As<UINavigationController>();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [c setViewControllers:controllers animated:animated];
    });
  }
}

NAN_METHOD(NUINavigationController::PushViewController) {
  NUINavigationController *vc = ObjectWrap::Unwrap<NUINavigationController>(Local<Object>::Cast(info.This()));

  NUIViewController *child = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));

  bool animated = info[1]->IsBoolean() ? TO_BOOL(info[1]) : true;

  UINavigationController* c = vc->As<UINavigationController>();
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [c pushViewController:child->As<UIViewController>() animated:animated];
    });
  }
}

NAN_METHOD(NUINavigationController::PopViewController) {
  NUINavigationController *vc = ObjectWrap::Unwrap<NUINavigationController>(Local<Object>::Cast(info.This()));

  bool animated = info[0]->IsBoolean() ? TO_BOOL(info[0]) : true;

  UINavigationController* c = vc->As<UINavigationController>();
  
  __block UIViewController* obj = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      obj = [c popViewControllerAnimated:animated];
    });
  }

  if (obj != nullptr) {
    Local<Value> argv[] = {
      Nan::New<v8::External>((__bridge void*)obj)
    };
    Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(obj, NUIViewController::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
    info.GetReturnValue().Set(value);
  }
}

NAN_METHOD(NUINavigationController::PopToRootViewController) {
  NUINavigationController *vc = ObjectWrap::Unwrap<NUINavigationController>(Local<Object>::Cast(info.This()));

  bool animated = info[0]->IsBoolean() ? TO_BOOL(info[0]) : true;

  UINavigationController* c = vc->As<UINavigationController>();
  
  __block NSArray* controllers = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      controllers = [c popToRootViewControllerAnimated:animated];
      count = [controllers count];
    });
  }

  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    UIViewController* child = [controllers objectAtIndex:i];
    if (child != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)child)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(child, NUIViewController::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  info.GetReturnValue().Set(result);
}

NAN_METHOD(NUINavigationController::PopToViewController) {
  NUINavigationController *vc = ObjectWrap::Unwrap<NUINavigationController>(Local<Object>::Cast(info.This()));

  NUIViewController *child = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));

  bool animated = info[1]->IsBoolean() ? TO_BOOL(info[1]) : true;

  UINavigationController* c = vc->As<UINavigationController>();
  
  __block NSArray* controllers = nullptr;
  __block NSInteger count = 0;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      controllers = [c popToViewController:child->As<UIViewController>() animated:animated];
      count = [controllers count];
    });
  }

  auto result = Nan::New<Array>();

  for (NSInteger i = 0; i < count; i++) {
    UIViewController* child = [controllers objectAtIndex:i];
    if (child != nullptr) {
      Local<Value> argv[] = {
        Nan::New<v8::External>((__bridge void*)child)
      };
      Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(child, NUIViewController::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  info.GetReturnValue().Set(result);
}

NAN_GETTER(NUINavigationController::topViewControllerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self topViewController]));
  }
}

NAN_GETTER(NUINavigationController::visibleViewControllerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIViewController([self visibleViewController]));
  }
}

NAN_GETTER(NUINavigationController::viewControllersGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIViewController*>([self viewControllers]));
  }
}

NAN_SETTER(NUINavigationController::viewControllersSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIViewController*>, input);
    [self setViewControllers: input];
  }
}

NAN_GETTER(NUINavigationController::navigationBarHiddenGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isNavigationBarHidden]));
  }
}

NAN_SETTER(NUINavigationController::navigationBarHiddenSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setNavigationBarHidden: input];
  }
}

#include "NUINavigationBar.h"

NAN_GETTER(NUINavigationController::navigationBarGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationBar([self navigationBar]));
  }
}

NAN_GETTER(NUINavigationController::toolbarHiddenGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isToolbarHidden]));
  }
}

NAN_SETTER(NUINavigationController::toolbarHiddenSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setToolbarHidden: input];
  }
}

NAN_GETTER(NUINavigationController::toolbarGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* UIToolbar*/([self toolbar]));
  }
}

NAN_GETTER(NUINavigationController::delegateGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <UINavigationControllerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NUINavigationController::delegateSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <UINavigationControllerDelegate>*/, input);
    [self setDelegate: input];
  }
}

#include "NUIGestureRecognizer.h"

NAN_GETTER(NUINavigationController::interactivePopGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIGestureRecognizer([self interactivePopGestureRecognizer]));
  }
}

NAN_GETTER(NUINavigationController::hidesBarsWhenKeyboardAppearsGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsWhenKeyboardAppears]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsWhenKeyboardAppearsSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsWhenKeyboardAppears: input];
  }
}

NAN_GETTER(NUINavigationController::hidesBarsOnSwipeGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsOnSwipe]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsOnSwipeSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsOnSwipe: input];
  }
}

#include "NUITapGestureRecognizer.h"

NAN_GETTER(NUINavigationController::barHideOnSwipeGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPanGestureRecognizer([self barHideOnSwipeGestureRecognizer]));
  }
}

NAN_GETTER(NUINavigationController::hidesBarsWhenVerticallyCompactGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsWhenVerticallyCompact]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsWhenVerticallyCompactSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsWhenVerticallyCompact: input];
  }
}

NAN_GETTER(NUINavigationController::hidesBarsOnTapGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBarsOnTap]));
  }
}

NAN_SETTER(NUINavigationController::hidesBarsOnTapSetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBarsOnTap: input];
  }
}

NAN_GETTER(NUINavigationController::barHideOnTapGestureRecognizerGetter) {
  JS_UNWRAP(UINavigationController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITapGestureRecognizer([self barHideOnTapGestureRecognizer]));
  }
}

/*

#include "NUINavigationItem.h"

NAN_GETTER(NUIViewController::navigationItemGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItem([self navigationItem]));
  }
}

NAN_GETTER(NUIViewController::hidesBottomBarWhenPushedGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self hidesBottomBarWhenPushed]));
  }
}

NAN_SETTER(NUIViewController::hidesBottomBarWhenPushedSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHidesBottomBarWhenPushed: input];
  }
}

NAN_GETTER(NUIViewController::navigationControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationController([self navigationController]));
  }
}

NAN_GETTER(NUIViewController::toolbarItemsGetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItem*>([self toolbarItems]));
  }
}

NAN_SETTER(NUIViewController::toolbarItemsSetter) {
  JS_UNWRAP(UIViewController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<UIBarButtonItem*>, input);
    [self setToolbarItems: input];
  }
}
*/
