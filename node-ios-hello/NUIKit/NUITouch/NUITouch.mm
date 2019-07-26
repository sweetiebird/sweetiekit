//
//  UITouch.mm
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITouch.h"

#define instancetype UITouch
#define js_value_instancetype js_value_UITouch

NUITouch::NUITouch() {}
NUITouch::~NUITouch() {}

JS_INIT_CLASS(UITouch, NSObject);
  JS_ASSIGN_PROTO_METHOD(locationInView);
  JS_ASSIGN_PROTO_METHOD(previousLocationInView);
  JS_ASSIGN_PROTO_METHOD(preciseLocationInView);
  JS_ASSIGN_PROTO_METHOD(precisePreviousLocationInView);
  JS_ASSIGN_PROTO_METHOD(azimuthAngleInView);
  JS_ASSIGN_PROTO_METHOD(azimuthUnitVectorInView);
  JS_ASSIGN_PROTO_PROP_READONLY(timestamp);
  JS_ASSIGN_PROTO_PROP_READONLY(phase);
  JS_ASSIGN_PROTO_PROP_READONLY(tapCount);
  JS_ASSIGN_PROTO_PROP_READONLY(type);
  JS_ASSIGN_PROTO_PROP_READONLY(majorRadius);
  JS_ASSIGN_PROTO_PROP_READONLY(majorRadiusTolerance);
  JS_ASSIGN_PROTO_PROP_READONLY(window);
  JS_ASSIGN_PROTO_PROP_READONLY(view);
  JS_ASSIGN_PROTO_PROP_READONLY(gestureRecognizers);
  JS_ASSIGN_PROTO_PROP_READONLY(force);
  JS_ASSIGN_PROTO_PROP_READONLY(maximumPossibleForce);
  JS_ASSIGN_PROTO_PROP_READONLY(altitudeAngle);
  JS_ASSIGN_PROTO_PROP_READONLY(estimationUpdateIndex);
  JS_ASSIGN_PROTO_PROP_READONLY(estimatedProperties);
  JS_ASSIGN_PROTO_PROP_READONLY(estimatedPropertiesExpectingUpdates);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITouch, NSObject);

  // constants (exports)

//typedef NS_ENUM(NSInteger, UITouchPhase) {
  JS_ASSIGN_ENUM(UITouchPhaseBegan, NSInteger);             // whenever a finger touches the surface.
  JS_ASSIGN_ENUM(UITouchPhaseMoved, NSInteger);             // whenever a finger moves on the surface.
  JS_ASSIGN_ENUM(UITouchPhaseStationary, NSInteger);        // whenever a finger is touching the surface but hasn't moved since the previous event.
  JS_ASSIGN_ENUM(UITouchPhaseEnded, NSInteger);             // whenever a finger leaves the surface.
  JS_ASSIGN_ENUM(UITouchPhaseCancelled, NSInteger);         // whenever a touch doesn't end but we need to stop tracking (e.g. putting device to face)
//};

//typedef NS_ENUM(NSInteger, UIForceTouchCapability) {
  JS_ASSIGN_ENUM(UIForceTouchCapabilityUnknown, NSInteger);
  JS_ASSIGN_ENUM(UIForceTouchCapabilityUnavailable, NSInteger);
  JS_ASSIGN_ENUM(UIForceTouchCapabilityAvailable, NSInteger);
//};

//typedef NS_ENUM(NSInteger, UITouchType) {
  JS_ASSIGN_ENUM(UITouchTypeDirect, NSInteger); //                        // A direct touch from a finger (on a screen)
  JS_ASSIGN_ENUM(UITouchTypeIndirect, NSInteger); //                      // An indirect touch (not a screen)
  JS_ASSIGN_ENUM(UITouchTypePencil, NSInteger); // NS_AVAILABLE_IOS(9_1), // Add pencil name variant
  JS_ASSIGN_ENUM(UITouchTypeStylus, NSInteger); // NS_AVAILABLE_IOS(9_1) = UITouchTypePencil, // A touch from a stylus (deprecated name, use pencil)
//} NS_ENUM_AVAILABLE_IOS(9_0);

//typedef NS_OPTIONS(NSInteger, UITouchProperties) {
  JS_ASSIGN_ENUM(UITouchPropertyForce, NSInteger); // = (1UL << 0),
  JS_ASSIGN_ENUM(UITouchPropertyAzimuth, NSInteger); // = (1UL << 1),
  JS_ASSIGN_ENUM(UITouchPropertyAltitude, NSInteger); // = (1UL << 2),
  JS_ASSIGN_ENUM(UITouchPropertyLocation, NSInteger); // = (1UL << 3), // For predicted Touches
//} NS_AVAILABLE_IOS(9_1);
  
JS_INIT_CLASS_END(UITouch, NSObject);

NAN_METHOD(NUITouch::New) {
  JS_RECONSTRUCT(UITouch);
  @autoreleasepool {
    UITouch* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UITouch *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITouch alloc] init];
    }
    if (self) {
      NUITouch *wrapper = new NUITouch();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITouch::New: invalid arguments");
    }
  }
}

#include "NUIView.h"

NAN_METHOD(NUITouch::locationInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self locationInView: view]));
  }
}

NAN_METHOD(NUITouch::previousLocationInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self previousLocationInView: view]));
  }
}

NAN_METHOD(NUITouch::preciseLocationInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self preciseLocationInView: view]));
  }
}

NAN_METHOD(NUITouch::precisePreviousLocationInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self precisePreviousLocationInView: view]));
  }
}

NAN_METHOD(NUITouch::azimuthAngleInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGFloat([self azimuthAngleInView: view]));
  }
}

NAN_METHOD(NUITouch::azimuthUnitVectorInView) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGVector([self azimuthUnitVectorInView: view]));
  }
}

NAN_GETTER(NUITouch::timestampGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self timestamp]));
  }
}

NAN_GETTER(NUITouch::phaseGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITouchPhase([self phase]));
  }
}

NAN_GETTER(NUITouch::tapCountGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self tapCount]));
  }
}

NAN_GETTER(NUITouch::typeGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITouchType([self type]));
  }
}

NAN_GETTER(NUITouch::majorRadiusGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self majorRadius]));
  }
}

NAN_GETTER(NUITouch::majorRadiusToleranceGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self majorRadiusTolerance]));
  }
}

#include "NUIWindow.h"

NAN_GETTER(NUITouch::windowGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIWindow([self window]));
  }
}

NAN_GETTER(NUITouch::viewGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView ([self view]));
  }
}

NAN_GETTER(NUITouch::gestureRecognizersGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIGestureRecognizer*>([self gestureRecognizers]));
  }
}

NAN_GETTER(NUITouch::forceGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self force]));
  }
}

NAN_GETTER(NUITouch::maximumPossibleForceGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumPossibleForce]));
  }
}

NAN_GETTER(NUITouch::altitudeAngleGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self altitudeAngle]));
  }
}

NAN_GETTER(NUITouch::estimationUpdateIndexGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id([self estimationUpdateIndex])); // TODO: js_value_NSNumber
  }
}

NAN_GETTER(NUITouch::estimatedPropertiesGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITouchProperties([self estimatedProperties]));
  }
}

NAN_GETTER(NUITouch::estimatedPropertiesExpectingUpdatesGetter) {
  JS_UNWRAP(UITouch, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITouchProperties([self estimatedPropertiesExpectingUpdates]));
  }
}
