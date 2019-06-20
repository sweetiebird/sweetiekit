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
  JS_ASSIGN_PROTO_METHOD(beginTrackingWithTouchWithEvent);
  JS_ASSIGN_PROTO_METHOD(continueTrackingWithTouchWithEvent);
  JS_ASSIGN_PROTO_METHOD(endTrackingWithTouchWithEvent);
  JS_ASSIGN_PROTO_METHOD(cancelTrackingWithEvent);
  JS_ASSIGN_PROTO_METHOD(addTargetActionForControlEvents);
  JS_ASSIGN_PROTO_METHOD(removeTargetActionForControlEvents);
  JS_ASSIGN_PROTO_METHOD(allTargets);
  JS_ASSIGN_PROTO_METHOD(allControlEvents);
  JS_ASSIGN_PROTO_METHOD(actionsForTargetForControlEvent);
  JS_ASSIGN_PROTO_METHOD(sendActionToForEvent);
  JS_ASSIGN_PROTO_METHOD(sendActionsForControlEvents);
  JS_ASSIGN_PROTO_PROP(isEnabled);
  JS_ASSIGN_PROTO_PROP(isSelected);
  JS_ASSIGN_PROTO_PROP(isHighlighted);
  JS_ASSIGN_PROTO_PROP(contentVerticalAlignment);
  JS_ASSIGN_PROTO_PROP(contentHorizontalAlignment);
  JS_ASSIGN_PROTO_PROP_READONLY(effectiveContentHorizontalAlignment);
  JS_ASSIGN_PROTO_PROP_READONLY(state);
  JS_ASSIGN_PROTO_PROP_READONLY(isTracking);
  JS_ASSIGN_PROTO_PROP_READONLY(isTouchInside);
  JS_ASSIGN_PROTO_PROP_READONLY(allTargets);
  JS_ASSIGN_PROTO_PROP_READONLY(allControlEvents);

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

#include "NUITouch.h"
#include "NUIEvent.h"

NAN_METHOD(NUIControl::beginTrackingWithTouchWithEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITouch, touch);
    declare_nullable_pointer(UIEvent, event);
    JS_SET_RETURN(js_value_BOOL([self beginTrackingWithTouch: touch withEvent: event]));
  }
}

NAN_METHOD(NUIControl::continueTrackingWithTouchWithEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITouch, touch);
    declare_nullable_pointer(UIEvent, event);
    JS_SET_RETURN(js_value_BOOL([self continueTrackingWithTouch: touch withEvent: event]));
  }
}

NAN_METHOD(NUIControl::endTrackingWithTouchWithEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UITouch, touch);
    declare_nullable_pointer(UIEvent, event);
    [self endTrackingWithTouch: touch withEvent: event];
  }
}

NAN_METHOD(NUIControl::cancelTrackingWithEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIEvent, event);
    [self cancelTrackingWithEvent: event];
  }
}

NAN_METHOD(NUIControl::addTargetActionForControlEvents) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    __block sweetiekit::JSFunction* fn = new sweetiekit::JSFunction(info[0]);

    UIControlEvents events = UIControlEvents(TO_UINT32(info[1]));

    SUITarget* target = [[SUITarget alloc] init];
    
    [target setCallbackClosure:^(id _Nullable sender) {
      dispatch_main(^{
        if (fn) {
          (*fn)("NUIControl::addTarget", js_value_id(sender));
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

NAN_METHOD(NUIControl::removeTargetActionForControlEvents) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlEvents, events);

    SUITarget* target = (SUITarget*)[self associatedValueForKey:UIControlEventsName(events)];
    if (target) {
      
      [self removeTarget:target action:[target callbackSelector] forControlEvents:events];

      [self dissociateValueForKey:UIControlEventsName(events)];

      nself->SetNSObject(self);
    }
  }
}

NAN_METHOD(NUIControl::allTargets) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet([self allTargets]));
  }
}

NAN_METHOD(NUIControl::allControlEvents) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlEvents([self allControlEvents]));
  }
}

NAN_METHOD(NUIControl::actionsForTargetForControlEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, target);
    declare_value(UIControlEvents, controlEvent);
    JS_SET_RETURN(js_value_NSArray<NSString*>([self actionsForTarget: target forControlEvent: controlEvent]));
  }
}

NAN_METHOD(NUIControl::sendActionToForEvent) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(SEL, action);
    declare_nullable_value(id, target);
    declare_nullable_pointer(UIEvent, event);
    [self sendAction: action to: target forEvent: event];
    #endif
  }
}

NAN_METHOD(NUIControl::sendActionsForControlEvents) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlEvents, controlEvents);
    [self sendActionsForControlEvents: controlEvents];
  }
}

NAN_GETTER(NUIControl::isEnabledGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isEnabled]));
  }
}

NAN_SETTER(NUIControl::isEnabledSetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnabled: input];
  }
}

NAN_GETTER(NUIControl::isSelectedGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSelected]));
  }
}

NAN_SETTER(NUIControl::isSelectedSetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setSelected: input];
  }
}

NAN_GETTER(NUIControl::isHighlightedGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHighlighted]));
  }
}

NAN_SETTER(NUIControl::isHighlightedSetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setHighlighted: input];
  }
}

NAN_GETTER(NUIControl::contentVerticalAlignmentGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlContentVerticalAlignment([self contentVerticalAlignment]));
  }
}

NAN_SETTER(NUIControl::contentVerticalAlignmentSetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIControlContentVerticalAlignment, input);
    [self setContentVerticalAlignment: input];
  }
}

NAN_GETTER(NUIControl::contentHorizontalAlignmentGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlContentHorizontalAlignment([self contentHorizontalAlignment]));
  }
}

NAN_SETTER(NUIControl::contentHorizontalAlignmentSetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIControlContentHorizontalAlignment, input);
    [self setContentHorizontalAlignment: input];
  }
}

NAN_GETTER(NUIControl::effectiveContentHorizontalAlignmentGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlContentHorizontalAlignment([self effectiveContentHorizontalAlignment]));
  }
}

NAN_GETTER(NUIControl::stateGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlState([self state]));
  }
}

NAN_GETTER(NUIControl::isTrackingGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTracking]));
  }
}

NAN_GETTER(NUIControl::isTouchInsideGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTouchInside]));
  }
}

NAN_GETTER(NUIControl::allTargetsGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSSet([self allTargets]));
  }
}

NAN_GETTER(NUIControl::allControlEventsGetter) {
  JS_UNWRAP(UIControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIControlEvents([self allControlEvents]));
  }
}

