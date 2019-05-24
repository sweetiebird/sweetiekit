//
//  NUIViewController.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUIViewController.h"
#include "NUINavigationController.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUIView.h"
#include "NUIBarButtonItem.h"
#include "NUITabBarItem.h"
#include "NUINavigationItem.h"
#include "NUIPopoverPresentationController.h"

Nan::Persistent<FunctionTemplate> NUIViewController::type;

NUIViewController::NUIViewController () {}
NUIViewController::~NUIViewController () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIViewController::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIResponder::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIViewController"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  Nan::SetAccessor(proto, JS_STR("view"), ViewGetter);
  Nan::SetMethod(proto, "present", PresentViewController);
  Nan::SetMethod(proto, "dismiss", DismissViewController);
  JS_SET_PROP(proto, "transitioningDelegate", TransitioningDelegate);
  JS_SET_PROP(proto, "modalPresentationStyle", ModalPresentationStyle);
  JS_SET_PROP(proto, "toolbarItems", ToolbarItems);
  JS_SET_PROP(proto, "tabBarItem", TabBarItem);
  JS_ASSIGN_PROP(proto, modalPresentationStyle);
  JS_ASSIGN_PROP(proto, viewDidAppear);
  JS_ASSIGN_PROP(proto, viewWillAppear);
  JS_ASSIGN_PROP(proto, viewDidDisappear);
  JS_ASSIGN_PROP(proto, viewWillDisappear);
  JS_ASSIGN_PROP(proto, preferredContentSize);
  JS_ASSIGN_PROP_READONLY(proto, navigationController);
  JS_ASSIGN_PROP_READONLY(proto, navigationItem);
  JS_ASSIGN_PROP_READONLY(proto, popoverPresentationController);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIViewController::New) {
  Nan::HandleScope scope;

  Local<Object> controllerObj = info.This();

  NUIViewController *ctrl = new NUIViewController();
  
  UIViewController* vc = info[0]->IsExternal() ? (__bridge UIViewController *)(info[0].As<External>()->Value())  : [UIViewController alloc];

  ctrl->SetNSObject(vc);
  [ctrl->As<UIViewController>() addTargetClosureWithClosure:^(UITextField* field){
    const char* text = [[field text] UTF8String];
    iOSLog0(text);
    //sweetiekit::Resolve(cb);
    return true;
  }];
  ctrl->Wrap(controllerObj);

  info.GetReturnValue().Set(controllerObj);
}

NAN_GETTER(NUIViewController::ViewGetter) {
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  
  __block UIView* view = nullptr;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      view = [ctrl->As<UIViewController>() view];
    });
  }

  Local<Value> argv[] = {
    Nan::New<v8::External>((__bridge void*)view)
  };
  Local<Object> viewObj = JS_TYPE(NUIView)->NewInstance(Isolate::GetCurrent()->GetCurrentContext(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();

  info.GetReturnValue().Set(viewObj);
}

NAN_METHOD(NUIViewController::PresentViewController)
{
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>();
  
  NUIViewController *vc = ObjectWrap::Unwrap<NUIViewController>(Local<Object>::Cast(info[0]));
  bool animated = info[1]->IsBoolean() ? TO_BOOL(info[1]) : true;
  if (info[2]->IsFunction()) {
    cb->Reset(Local<Function>::Cast(info[2]));
  }

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^{
      [ctrl->As<UIViewController>() presentViewController:vc->As<UIViewController>() animated:animated completion:^{
        Nan::HandleScope scope;
        sweetiekit::Resolve(cb, true);
      }];
    });
  }
}

NAN_METHOD(NUIViewController::DismissViewController)
{
  Nan::HandleScope scope;

  NUIViewController *ctrl = ObjectWrap::Unwrap<NUIViewController>(info.This());
  Nan::Persistent<Function>* cb = new Nan::Persistent<Function>();
  
  bool animated = info[0]->IsBoolean() ? TO_BOOL(info[0]) : true;
  if (info[1]->IsFunction()) {
    cb->Reset(Local<Function>::Cast(info[1]));
  }

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^{
      [ctrl->As<UIViewController>() dismissViewControllerAnimated:animated
       completion:^{
        sweetiekit::Resolve(cb, true);
      }];
    });
  }
}

NAN_SETTER(NUIViewController::TransitioningDelegateSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ctrl);
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      Local<Object> obj = JS_OBJ(value);
      NUIViewControllerTransitioningDelegate *del = ObjectWrap::Unwrap<NUIViewControllerTransitioningDelegate>(obj);
      [ctrl setTransitioningDelegate:del->As<SUIViewControllerTransitioningDelegate>()];
    });
  }
}

NAN_GETTER(NUIViewController::TransitioningDelegateGetter) {
  Nan::HandleScope scope;
  
//  NUIViewControllerTransitioningDelegate *del = ObjectWrap::Unwrap<NUIViewControllerTransitioningDelegate>(info.This());
//
//  info.GetReturnValue().Set(del->_presentationControllerFor.GetValue());
}

NAN_SETTER(NUIViewController::ModalPresentationStyleSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ctrl);


  std::string style;
  if (!NJSStringGetUTF8String(value, style)) {
    Nan::ThrowError("invalid argument");
  }

  UIModalPresentationStyle modalStyle = style == "custom" ? UIModalPresentationCustom : UIModalPresentationFullScreen;

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ctrl setModalPresentationStyle:modalStyle];
    });
  }
}

NAN_GETTER(NUIViewController::ModalPresentationStyleGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("TODO NUIViewController::ModalPresentationStyleGetter");
//  NUIViewControllerTransitioningDelegate *del = ObjectWrap::Unwrap<NUIViewControllerTransitioningDelegate>(info.This());
//
//  info.GetReturnValue().Set(del->_presentationControllerFor.GetValue());
}

NAN_SETTER(NUIViewController::ToolbarItemsSetter) {
  Nan::HandleScope scope;

  JS_UNWRAP(UIViewController, ui);

  NSMutableArray* items = [[NSMutableArray alloc] init];

  if (value->IsObject()) {
    Local<Object> object = JS_OBJ(value);
    MaybeLocal<Array> maybe_props = object->GetOwnPropertyNames(JS_CONTEXT());
    if (!maybe_props.IsEmpty()) {
      Local<Array> props = maybe_props.ToLocalChecked();
      for (uint32_t i=0; i < props->Length(); i++) {
        Local<Value> key = props->Get(i);
        Local<Value> val = object->Get(key);
        JS_UNWRAPPED(JS_OBJ(val), UIBarButtonItem, c);
        [items addObject:c];
      }
    }

    [ui setToolbarItems:items];
  }
}

NAN_GETTER(NUIViewController::ToolbarItemsGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);

  auto result = Nan::New<Array>();
  NSInteger count = [[ui toolbarItems] count];

  for (NSInteger i = 0; i < count; i++) {
    UIBarButtonItem* item = [[ui toolbarItems] objectAtIndex:i];
    if (item != nullptr) {
      Local<Value> value = sweetiekit::GetWrapperFor(item, NUIBarButtonItem::type);
      Nan::Set(result, static_cast<uint32_t>(i), value);
    }
  }

  JS_SET_RETURN(result);
}

NAN_SETTER(NUIViewController::TabBarItemSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);

  NUITabBarItem *itemObj = ObjectWrap::Unwrap<NUITabBarItem>(Local<Object>::Cast(value));

  @autoreleasepool {
    [ui setTabBarItem:itemObj->As<UITabBarItem>()];
  }
}

NAN_GETTER(NUIViewController::TabBarItemGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui tabBarItem], NUITabBarItem::type));
}

NAN_GETTER(NUIViewController::viewDidAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewDidAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidAppear"];
  }
}

NAN_GETTER(NUIViewController::viewWillAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillAppear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewWillAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillAppear"];
  }
}

NAN_GETTER(NUIViewController::viewDidDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewDidDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewDidDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidDisappear"];
  }
}

NAN_GETTER(NUIViewController::viewWillDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_viewWillDisappear"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(scope.Escape(handle));
    }
  }
}

NAN_SETTER(NUIViewController::viewWillDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillDisappear"];
  }
}

NAN_GETTER(NUIViewController::navigationControllerGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui navigationController], NUINavigationController::type)));
}

NAN_GETTER(NUIViewController::navigationItemGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIViewController, ui);
  
  JS_SET_RETURN(JS_OBJ(sweetiekit::GetWrapperFor([ui navigationItem], NUINavigationItem::type)));
}

NAN_GETTER(NUIViewController::modalPresentationStyleGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  Nan::ThrowError("NUIViewController::modalPresentationStyleGetter not implemented");
}

NAN_SETTER(NUIViewController::modalPresentationStyleSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    double styleVal = TO_DOUBLE(value);
    [ui setModalPresentationStyle:UIModalPresentationPopover];
  }
}

NAN_GETTER(NUIViewController::popoverPresentationControllerGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);

  JS_SET_RETURN(sweetiekit::GetWrapperFor([ui popoverPresentationController], NUIPopoverPresentationController::type));
}

NAN_SETTER(NUIViewController::preferredContentSizeSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    double w = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
    double h = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
    [ui setPreferredContentSize:CGSizeMake(w, h)];
  }
}

NAN_GETTER(NUIViewController::preferredContentSizeGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);

  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("width"), JS_FLOAT([ui preferredContentSize].width));
  result->Set(JS_STR("height"), JS_FLOAT([ui preferredContentSize].height));
  
  JS_SET_RETURN(result);
}
