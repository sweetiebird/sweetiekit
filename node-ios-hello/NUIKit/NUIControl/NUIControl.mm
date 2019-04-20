//
//  NUIControl.m
//  node-ios-hello
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "NUIControl.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUIControl::type;

NUIControl::NUIControl () {}
NUIControl::~NUIControl () {}

std::pair<Local<Object>, Local<FunctionTemplate>> NUIControl::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIView::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UIControl"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP_READONLY(proto, "state", State);
  JS_SET_PROP(proto, "selected", Selected);
  JS_SET_PROP(proto, "enabled", Enabled);
  JS_SET_PROP(proto, "highlighted", Highlighted);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUIControl::New) {
  Nan::HandleScope scope;

  Local<Object> viewObj = info.This();

  NUIControl *view = new NUIControl();

  if (info[0]->IsExternal()) {
    view->SetNSObject((__bridge UIControl *)(info[0].As<External>()->Value()));
  } else {
    Nan::ThrowError("NUIControl::New must receive a UIControl");
  }
  view->Wrap(viewObj);

  JS_SET_RETURN(viewObj);
}

NAN_GETTER(NUIControl::EnabledGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block bool isEnabled = false;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isEnabled = [ui isEnabled];
    });
  }
  
  JS_SET_RETURN(JS_BOOL(isEnabled));
}

NAN_SETTER(NUIControl::EnabledSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  bool isEnabled = value->IsBoolean() ? TO_BOOL(value) : true;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setEnabled:isEnabled];
    });
  }
}

NAN_GETTER(NUIControl::StateGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block const char* theState = "normal";
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      UIControlState state = [ui state];
      if (state == UIControlStateNormal) {
        theState = "normal";
      }
      else if (state == UIControlStateHighlighted) {
        theState = "highlighted";
      }
      else if (state == UIControlStateDisabled) {
        theState = "disabled";
      }
      else if (state == UIControlStateSelected) {
        theState = "selected";
      }
      else if (state == UIControlStateFocused) {
        theState = "focused";
      }
      else if (state == UIControlStateApplication) {
        theState = "application";
      } else {
        iOSLog0("Unknown UIControlState");
      }
    });
  }
  JS_SET_RETURN(JS_STR(theState));
}

NAN_GETTER(NUIControl::SelectedGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block bool isSelected = false;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isSelected = [ui isSelected];
    });
  }
  
  JS_SET_RETURN(JS_BOOL(isSelected));
}

NAN_SETTER(NUIControl::SelectedSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  bool isSelected = value->IsBoolean() ? TO_BOOL(value) : true;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setSelected:isSelected];
    });
  }
}

NAN_GETTER(NUIControl::HighlightedGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block bool isHighlighted = false;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isHighlighted = [ui isHighlighted];
    });
  }
  
  JS_SET_RETURN(JS_BOOL(isHighlighted));
}

NAN_SETTER(NUIControl::HighlightedSetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  bool isHighlighted = value->IsBoolean() ? TO_BOOL(value) : true;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [ui setHighlighted:isHighlighted];
    });
  }
}
