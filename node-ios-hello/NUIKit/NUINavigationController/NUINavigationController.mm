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
  JS_SET_PROP(proto, "isToolbarHidden", IsToolbarHidden);
  JS_ASSIGN_PROP_READONLY(proto, navigationBar);
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

NAN_GETTER(NUINavigationController::IsToolbarHiddenGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationController, ui);

  JS_SET_RETURN(JS_BOOL([ui isToolbarHidden]));
}

NAN_SETTER(NUINavigationController::IsToolbarHiddenSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationController, ui);

  [ui setToolbarHidden:TO_BOOL(value)];
}

#include "NUINavigationBar.h"

NAN_GETTER(NUINavigationController::navigationBarGetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UINavigationController, ui);

  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui navigationBar], NUINavigationBar::type)));
}
