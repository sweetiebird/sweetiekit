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
  // constants
  
//typedef NS_OPTIONS(NSUInteger, UIControlEvents) {
  JS_ASSIGN_ENUM(UIControlEventTouchDown, NSUInteger); //                                          = 1 <<  0,      // on all touch downs
  JS_ASSIGN_ENUM(UIControlEventTouchDownRepeat, NSUInteger); //                                    = 1 <<  1,      // on multiple touchdowns (tap count > 1)
  JS_ASSIGN_ENUM(UIControlEventTouchDragInside, NSUInteger); //                                    = 1 <<  2,
  JS_ASSIGN_ENUM(UIControlEventTouchDragOutside, NSUInteger); //                                   = 1 <<  3,
  JS_ASSIGN_ENUM(UIControlEventTouchDragEnter, NSUInteger); //                                     = 1 <<  4,
  JS_ASSIGN_ENUM(UIControlEventTouchDragExit, NSUInteger); //                                      = 1 <<  5,
  JS_ASSIGN_ENUM(UIControlEventTouchUpInside, NSUInteger); //                                      = 1 <<  6,
  JS_ASSIGN_ENUM(UIControlEventTouchUpOutside, NSUInteger); //                                     = 1 <<  7,
  JS_ASSIGN_ENUM(UIControlEventTouchCancel, NSUInteger); //                                        = 1 <<  8,

  JS_ASSIGN_ENUM(UIControlEventValueChanged, NSUInteger); //                                       = 1 << 12,     // sliders, etc.
  JS_ASSIGN_ENUM(UIControlEventPrimaryActionTriggered, NSUInteger); //  NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 13,     // semantic action: for buttons, etc.

  JS_ASSIGN_ENUM(UIControlEventEditingDidBegin, NSUInteger); //                                    = 1 << 16,     // UITextField
  JS_ASSIGN_ENUM(UIControlEventEditingChanged, NSUInteger); //                                     = 1 << 17,
  JS_ASSIGN_ENUM(UIControlEventEditingDidEnd, NSUInteger); //                                      = 1 << 18,
  JS_ASSIGN_ENUM(UIControlEventEditingDidEndOnExit, NSUInteger); //                                = 1 << 19,     // 'return key' ending editing

  JS_ASSIGN_ENUM(UIControlEventAllTouchEvents, NSUInteger); //                                     = 0x00000FFF,  // for touch events
  JS_ASSIGN_ENUM(UIControlEventAllEditingEvents, NSUInteger); //                                   = 0x000F0000,  // for UITextField
  JS_ASSIGN_ENUM(UIControlEventApplicationReserved, NSUInteger); //                                = 0x0F000000,  // range available for application use
  JS_ASSIGN_ENUM(UIControlEventSystemReserved, NSUInteger); //                                     = 0xF0000000,  // range reserved for internal framework use
  JS_ASSIGN_ENUM(UIControlEventAllEvents, NSUInteger); //                                          = 0xFFFFFFFF
//};

//typedef NS_ENUM(NSInteger, UIControlContentVerticalAlignment) {
  JS_ASSIGN_ENUM(UIControlContentVerticalAlignmentCenter, NSInteger); //   = 0,
  JS_ASSIGN_ENUM(UIControlContentVerticalAlignmentTop, NSInteger); //      = 1,
  JS_ASSIGN_ENUM(UIControlContentVerticalAlignmentBottom, NSInteger); //   = 2,
  JS_ASSIGN_ENUM(UIControlContentVerticalAlignmentFill, NSInteger); //     = 3,
//};

//typedef NS_ENUM(NSInteger, UIControlContentHorizontalAlignment) {
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentCenter, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentLeft, NSInteger); //    = 1,
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentRight, NSInteger); //   = 2,
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentFill, NSInteger); //    = 3,
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentLeading, NSInteger); //   API_AVAILABLE(ios(11.0), tvos(11.0)) = 4,
  JS_ASSIGN_ENUM(UIControlContentHorizontalAlignmentTrailing, NSInteger); //  API_AVAILABLE(ios(11.0), tvos(11.0)) = 5,
//};

//typedef NS_OPTIONS(NSUInteger, UIControlState) {
  JS_ASSIGN_ENUM(UIControlStateNormal, NSUInteger); //        = 0,
  JS_ASSIGN_ENUM(UIControlStateHighlighted, NSUInteger); //   = 1 << 0,                  // used when UIControl isHighlighted is set
  JS_ASSIGN_ENUM(UIControlStateDisabled, NSUInteger); //      = 1 << 1,
  JS_ASSIGN_ENUM(UIControlStateSelected, NSUInteger); //      = 1 << 2,                  // flag usable by app (see below)
  JS_ASSIGN_ENUM(UIControlStateFocused, NSUInteger); //  NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 3, // Applicable only when the screen supports focus
  JS_ASSIGN_ENUM(UIControlStateApplication, NSUInteger); //   = 0x00FF0000,              // additional flags available for application use
  JS_ASSIGN_ENUM(UIControlStateReserved, NSUInteger); //      = 0xFF000000               // flags reserved for internal framework use
//};

JS_INIT_CLASS_END(UIControl, UIView);

NAN_METHOD(NUIControl::New) {
  JS_RECONSTRUCT(UIControl);

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

NSString* UIControlEventsName(UIControlEvents event)
{
  switch (event) {
  case UIControlEventTouchDown: //                                         = 1 <<  0,      // on all touch downs
    return @"UIControlEventTouchDown";
  case UIControlEventTouchDownRepeat: //                                   = 1 <<  1,      // on multiple touchdowns (tap count > 1)
    return @"UIControlEventTouchDownRepeat";
  case UIControlEventTouchDragInside: //                                   = 1 <<  2,
    return @"UIControlEventTouchDragInside";
  case UIControlEventTouchDragOutside: //                                  = 1 <<  3,
    return @"UIControlEventTouchDragOutside";
  case UIControlEventTouchDragEnter: //                                    = 1 <<  4,
    return @"UIControlEventTouchDragEnter";
  case UIControlEventTouchDragExit: //                                     = 1 <<  5,
    return @"UIControlEventTouchDragExit";
  case UIControlEventTouchUpInside: //                                     = 1 <<  6,
    return @"UIControlEventTouchUpInside";
  case UIControlEventTouchUpOutside: //                                    = 1 <<  7,
    return @"UIControlEventTouchUpOutside";
  case UIControlEventTouchCancel: //                                       = 1 <<  8,
    return @"UIControlEventTouchCancel";

  case UIControlEventValueChanged: //                                      = 1 << 12,     // sliders, etc.
    return @"UIControlEventTouchCancel";
  case UIControlEventPrimaryActionTriggered: //NS_ENUM_AVAILABLE_IOS(9_0) = 1 << 13,     // semantic action: for buttons, etc.
    return @"UIControlEventPrimaryActionTriggered";

  case UIControlEventEditingDidBegin: //                                   = 1 << 16,     // UITextField
    return @"UIControlEventEditingDidBegin";
  case UIControlEventEditingChanged: //                                    = 1 << 17,
    return @"UIControlEventEditingChanged";
  case UIControlEventEditingDidEnd: //                                     = 1 << 18,
    return @"UIControlEventEditingDidEnd";
  case UIControlEventEditingDidEndOnExit: //                               = 1 << 19,     // 'return key' ending editing
    return @"UIControlEventEditingDidEndOnExit";
  default:
    return @"UIControlEventUnknown";
  }
}

NAN_METHOD(NUIControl::addTarget) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[0]);

    UIControlEvents events = UIControlEvents(TO_UINT32(info[1]));

    SUITarget* target = [[SUITarget alloc] init];
    
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NUIControl::addTarget");
        }
      });
    }];

    [target setDeinitClosure:^() {
      dispatch_main(^{
        if (fn) {
          delete fn; fn = nullptr;
          iOSLog0("fn deleted");
        }
      });
    }];
    
    [self addTarget:target action:[target callbackSelector] forControlEvents:events];
    
    [self associateValue:target withKey:UIControlEventsName(events)];

    nself->SetNSObject(self);
  }
}

NAN_METHOD(NUIControl::removeTarget) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    UIControlEvents events = UIControlEvents(TO_UINT32(info[0]));

    SUITarget* target = (SUITarget*)[self associatedValueForKey:UIControlEventsName(events)];
    if (target) {
      
      [self removeTarget:target action:[target callbackSelector] forControlEvents:events];

      [self dissociateValueForKey:UIControlEventsName(events)];

      nself->SetNSObject(self);
    }
  }
}
