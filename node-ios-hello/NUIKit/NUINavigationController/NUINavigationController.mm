//
//  NUINavigationController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "defines.h"
#include "NUINavigationController.h"
#include "NUIViewController.h"

Nan::Persistent<FunctionTemplate> NUINavigationController::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUINavigationController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIViewController::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UINavigationController"));
  ctor->Inherit(Nan::New(NUIViewController::type));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetMethod(proto, "pushViewController", PushViewController);
  Nan::SetMethod(proto, "popViewController", PopViewController);
  Nan::SetMethod(proto, "popToRootViewController", PopToRootViewController);
  Nan::SetMethod(proto, "popToViewController", PopToViewController);
  Nan::SetMethod(proto, "setViewControllers", SetViewControllers);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUINavigationController::New) {
  Nan::HandleScope scope;

  Local<Object> ctrlObj = info.This();

  NUINavigationController *ctrl = new NUINavigationController();

  if (info[0]->IsExternal()) {
    ctrl->SetNSObject((__bridge UINavigationController *)(info[0].As<External>()->Value()));
  } else {
    NUIViewController *child = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));

    @autoreleasepool {
      dispatch_sync(dispatch_get_main_queue(), ^ {
        ctrl->SetNSObject([[UINavigationController alloc] initWithRootViewController:child->As<UIViewController>()]);
      });
    }
  }
  ctrl->Wrap(ctrlObj);

  info.GetReturnValue().Set(ctrlObj);
}

NUINavigationController::NUINavigationController () {}
NUINavigationController::~NUINavigationController () {}

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
