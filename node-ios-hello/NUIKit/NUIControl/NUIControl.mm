//
//  NUIControl.mm
//
//  Created by BB on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIControl.h"

NUIControl::NUIControl() {}
NUIControl::~NUIControl() {}

JS_INIT_CLASS(UIControl, UIView);
  // instance members (proto)
  JS_SET_PROP_READONLY(proto, "state", State);
  JS_SET_PROP(proto, "isSelected", Selected);
  JS_SET_PROP(proto, "isEnabled", Enabled);
  JS_SET_PROP(proto, "isHighlighted", Highlighted);
  JS_SET_PROP_READONLY(proto, "isTracking", Tracking);
  JS_SET_PROP_READONLY(proto, "isTouchInside", TouchInside);
  JS_ASSIGN_METHOD(proto, addTarget);
  JS_ASSIGN_METHOD(proto, removeTarget);
  // static members (ctor)
  JS_INIT_CTOR(UIControl, UIView);
JS_INIT_CLASS_END(UIControl, UIView);

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

NAN_GETTER(NUIControl::TrackingGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block bool isTracking = false;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isTracking = [ui isTracking];
    });
  }
  
  JS_SET_RETURN(JS_BOOL(isTracking));
}

NAN_GETTER(NUIControl::TouchInsideGetter) {
  Nan::HandleScope scope;
  JS_UNWRAP(UIControl, ui);
  
  __block bool isTouchInside = false;
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      isTouchInside = [ui isTouchInside];
    });
  }
  
  JS_SET_RETURN(JS_BOOL(isTouchInside));
}

NAN_METHOD(NUIControl::addTarget) {
  Nan::EscapableHandleScope scope;

  NUIControl *ctrl = ObjectWrap::Unwrap<NUIControl>(Local<Object>::Cast(info.This()));

  __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[0]);

  SUITarget* target = [[SUITarget alloc] init];
  
  [target setCallbackClosure:^(id _Nullable) {
    Nan::HandleScope scope;
    (*fn)("NUIControl::addTarget");
  }];

  [target setDeinitClosure:^() {
    Nan::HandleScope scope;
    delete fn; fn = nullptr;
    iOSLog0("fn deleted");
  }];

  UIControlEvents events = UIControlEvents(TO_UINT32(info[1]));

  UIControl *ui = ctrl->As<UIControl>();
  
  [ui addTarget:target action:[target callbackSelector] forControlEvents:events];
  
  [ui associateValue:target withKey:@"sweetiekit.nuicontrol.target"];

  ctrl->SetNSObject(ui);
}

NAN_METHOD(NUIControl::removeTarget) {
  Nan::EscapableHandleScope scope;

  NUIControl *ctrl = ObjectWrap::Unwrap<NUIControl>(Local<Object>::Cast(info.This()));

  UIControl *ui = ctrl->As<UIControl>();

  id t = (SUITarget*)[ui associatedValueForKey:@"sweetiekit.nuicontrol.target"];

  UIControlEvents events = UIControlEvents(TO_UINT32(info[1]));
  
  [ui removeTarget:t action:[t callbackSelector] forControlEvents:events];

  [ui dissociateValueForKey:@"sweetiekit.nuicontrol.target"];

  ctrl->SetNSObject(ui);
}
