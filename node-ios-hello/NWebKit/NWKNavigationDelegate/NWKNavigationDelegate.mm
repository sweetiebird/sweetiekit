//
//  NWKNavigationDelegate.mm
//
//  Created by Emily Kolar on 2019-6-7.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#import <WebKit/WebKit.h>
#include "NWKNavigationDelegate.h"
#include "NWKWebView.h"

NWKNavigationDelegate::NWKNavigationDelegate() {}
NWKNavigationDelegate::~NWKNavigationDelegate() {}

JS_INIT_CLASS(WKNavigationDelegate, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(didFinishNavigation);
  // static members (ctor)
  JS_INIT_CTOR(WKNavigationDelegate, NSObject);
JS_INIT_CLASS_END(WKNavigationDelegate, NSObject);

NAN_METHOD(NWKNavigationDelegate::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      JS_SET_RETURN_NEW(WKNavigationDelegate, info);
      return;
    }
    SWKNavigationDelegate* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge SWKNavigationDelegate *)(info[0].As<External>()->Value());
    } else {
      self = [[SWKNavigationDelegate alloc] init];
    }
    if (self) {
      NWKNavigationDelegate *wrapper = new NWKNavigationDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NWKNavigationDelegate::New: invalid arguments");
    }
  }
}

NAN_GETTER(NWKNavigationDelegate::didFinishNavigationGetter) {
  Nan::HandleScope scope;
  
  Nan::ThrowError("NWKNavigationDelegate::didFinishNavigationGetter not yet implemented");
}

NAN_SETTER(NWKNavigationDelegate::didFinishNavigationSetter) {
  JS_UNWRAP_SWIFT(WKNavigationDelegate, self);
  @autoreleasepool {
    declare_setter();
    declare_persistent_function(cb, @"sweetiekit.WKNavigationDelegate.didFinishNavigation");
    [self setDidFinishNavigation:^(WKWebView * _Nonnull webView, WKNavigation * _Nonnull nav)
    {
      dispatch_main(^ {
        [cb jsFunction]->Call("NWKNavigationDelegate::didFinishNavigationSetter",
          js_value_id(webView),
          js_value_id(nav));
      });
    }];
  }

}
