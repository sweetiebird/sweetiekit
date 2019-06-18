//
//  NUIViewController.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIViewController.h"
#include "NUINavigationController.h"
#include "NUIViewControllerTransitioningDelegate.h"
#include "NUIView.h"
#include "NUIBarButtonItem.h"
#include "NUITabBarItem.h"
#include "NUINavigationItem.h"
#include "NUIPopoverPresentationController.h"

NUIViewController::NUIViewController() {}
NUIViewController::~NUIViewController() {}

JS_INIT_CLASS(UIViewController, UIResponder);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "view", View);
  JS_SET_METHOD(proto, "present", PresentViewController);
  JS_SET_METHOD(proto, "dismiss", DismissViewController);
  JS_SET_PROP(proto, "transitioningDelegate", TransitioningDelegate);
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
  // static members (ctor)
  JS_INIT_CTOR(UIViewController, UIResponder);
  // constants (exports)
  
//typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
  JS_ASSIGN_ENUM(UIModalTransitionStyleCoverVertical, NSInteger); // = 0,
  JS_ASSIGN_ENUM(UIModalTransitionStyleFlipHorizontal, NSInteger); // __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalTransitionStyleCrossDissolve, NSInteger); //,
  JS_ASSIGN_ENUM(UIModalTransitionStylePartialCurl, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//};

//typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
  JS_ASSIGN_ENUM(UIModalPresentationFullScreen, NSInteger); // = 0,
  JS_ASSIGN_ENUM(UIModalPresentationPageSheet, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalPresentationFormSheet, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
  JS_ASSIGN_ENUM(UIModalPresentationCurrentContext, NSInteger); // NS_ENUM_AVAILABLE_IOS(3_2),
  JS_ASSIGN_ENUM(UIModalPresentationCustom, NSInteger); // NS_ENUM_AVAILABLE_IOS(7_0),
  JS_ASSIGN_ENUM(UIModalPresentationOverFullScreen, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0),
  JS_ASSIGN_ENUM(UIModalPresentationOverCurrentContext, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0),
  JS_ASSIGN_ENUM(UIModalPresentationPopover, NSInteger); // NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
#ifdef __TVOS__
  JS_ASSIGN_ENUM(UIModalPresentationBlurOverFullScreen, NSInteger); // __TVOS_AVAILABLE(11_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
#endif
  JS_ASSIGN_ENUM(UIModalPresentationNone, NSInteger); // NS_ENUM_AVAILABLE_IOS(7_0) = -1,
//};

JS_INIT_CLASS_END(UIViewController, UIResponder);

NAN_METHOD(NUIViewController::New) {
  JS_RECONSTRUCT(UIViewController);
  @autoreleasepool {
    UIViewController* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIViewController *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [UIViewController alloc]; // TODO: init causes layout issues
    }
    if (self) {
      NUIViewController *wrapper = new NUIViewController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIViewController::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUIViewController::ViewGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self view]));
    return;
  }
}

NAN_METHOD(NUIViewController::PresentViewController)
{
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    sweetiekit::JSFunction cb(info[2]);
    [self presentViewController:to_value_UIViewController(info[0])
     animated:(info[1]->IsBoolean() ? TO_BOOL(info[1]) : true)
     completion:^{
        dispatch_main(^{
          cb("NUIViewController::PresentViewController");
        });
     }];
  }
}

NAN_METHOD(NUIViewController::DismissViewController)
{
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    sweetiekit::JSFunction cb(info[2]);
    [self
     dismissViewControllerAnimated:(info[0]->IsBoolean() ? TO_BOOL(info[0]) : true)
     completion:^{
        dispatch_main(^{
          cb("NUIViewController::DismissViewController");
        });
     }];
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

NAN_SETTER(NUIViewController::ToolbarItemsSetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    [self setToolbarItems:to_value_NSArray<UIBarButtonItem*>(value)
          animated:YES];
  }
}

NAN_GETTER(NUIViewController::ToolbarItemsGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIBarButtonItem*>([self toolbarItems]));
  }
}

NAN_SETTER(NUIViewController::TabBarItemSetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    [self setTabBarItem:to_value_UITabBarItem(value)];
  }
}

NAN_GETTER(NUIViewController::TabBarItemGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_UITabBarItem([self tabBarItem]));
  }
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
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationController([self navigationController]));
  }
}

NAN_GETTER(NUIViewController::navigationItemGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_UINavigationItem([self navigationItem]));
  }
}

NAN_GETTER(NUIViewController::modalPresentationStyleGetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  JS_SET_RETURN(js_value_UIModalPresentationStyle([ui modalPresentationStyle]));
}

NAN_SETTER(NUIViewController::modalPresentationStyleSetter) {
  Nan::HandleScope scope;
  
  JS_UNWRAP(UIViewController, ui);
  
  @autoreleasepool {
    UIModalPresentationStyle result = (value->IsInt32() ? to_value_UIModalPresentationStyle(value) : UIModalPresentationPopover);
    [ui setModalPresentationStyle:result];
  }
}

NAN_GETTER(NUIViewController::popoverPresentationControllerGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_UIPopoverPresentationController([self popoverPresentationController]));
  }
}

NAN_GETTER(NUIViewController::preferredContentSizeGetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self preferredContentSize]));
  }
}

NAN_SETTER(NUIViewController::preferredContentSizeSetter) {
  JS_UNWRAP(UIViewController, self);
  @autoreleasepool {
    [self setPreferredContentSize:to_value_CGSize(value)];
  }
}
