//
//  UITouch.m
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
    
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "defines.h"
#include "NNSObject.h"
#include "NUITouch.h"
#include "NUIView.h"

Nan::Persistent<FunctionTemplate> NUITouch::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITouch::Initialize(Isolate *isolate)
{
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NNSObject::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITouch"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  //@property(nonatomic,readonly) NSTimeInterval      timestamp;
  JS_PROTO_PROP_READONLY(timestamp);
  //@property(nonatomic,readonly) UITouchPhase        phase;
  JS_PROTO_PROP_READONLY(phase);
  //@property(nonatomic,readonly) NSUInteger          tapCount;   // touch down within a certain point within a certain amount of time
  JS_PROTO_PROP_READONLY(tapCount);
  //@property(nonatomic,readonly) UITouchType         type NS_AVAILABLE_IOS(9_0);
  JS_PROTO_PROP_READONLY(type);

  // majorRadius and majorRadiusTolerance are in points
  // The majorRadius will be accurate +/- the majorRadiusTolerance
  //@property(nonatomic,readonly) CGFloat majorRadius NS_AVAILABLE_IOS(8_0);
  JS_PROTO_PROP_READONLY(majorRadius);
  //@property(nonatomic,readonly) CGFloat majorRadiusTolerance NS_AVAILABLE_IOS(8_0);
  JS_PROTO_PROP_READONLY(majorRadiusTolerance);

  //@property(nullable,nonatomic,readonly,strong) UIWindow                        *window;
  JS_PROTO_PROP_READONLY(window);
  //@property(nullable,nonatomic,readonly,strong) UIView                          *view;
  JS_PROTO_PROP_READONLY(view);
  //@property(nullable,nonatomic,readonly,copy)   NSArray <UIGestureRecognizer *> *gestureRecognizers NS_AVAILABLE_IOS(3_2);

  //- (CGPoint)locationInView:(nullable UIView *)view;
  JS_PROTO_METHOD(locationInView);
  //- (CGPoint)previousLocationInView:(nullable UIView *)view;
  JS_PROTO_METHOD(previousLocationInView);

  // Use these methods to gain additional precision that may be available from touches.
  // Do not use precise locations for hit testing. A touch may hit test inside a view, yet have a precise location that lies just outside.
  //- (CGPoint)preciseLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
  JS_PROTO_METHOD(preciseLocationInView);
  //- (CGPoint)precisePreviousLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
  JS_PROTO_METHOD(precisePreviousLocationInView);

  // Force of the touch, where 1.0 represents the force of an average touch
  //@property(nonatomic,readonly) CGFloat force NS_AVAILABLE_IOS(9_0);
  JS_PROTO_PROP_READONLY(force);
  // Maximum possible force with this input mechanism
  //@property(nonatomic,readonly) CGFloat maximumPossibleForce NS_AVAILABLE_IOS(9_0);
  JS_PROTO_PROP_READONLY(maximumPossibleForce);

  // Azimuth angle. Valid only for stylus touch types. Zero radians points along the positive X axis.
  // Passing a nil for the view parameter will return the azimuth relative to the touch's window.
  //- (CGFloat)azimuthAngleInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
  // A unit vector that points in the direction of the azimuth angle. Valid only for stylus touch types.
  // Passing nil for the view parameter will return a unit vector relative to the touch's window.
  //- (CGVector)azimuthUnitVectorInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);

  // Altitude angle. Valid only for stylus touch types.
  // Zero radians indicates that the stylus is parallel to the screen surface,
  // while M_PI/2 radians indicates that it is normal to the screen surface.
  //@property(nonatomic,readonly) CGFloat altitudeAngle NS_AVAILABLE_IOS(9_1);

  // An index which allows you to correlate updates with the original touch.
  // Is only guaranteed non-nil if this UITouch expects or is an update.
  //@property(nonatomic,readonly) NSNumber * _Nullable estimationUpdateIndex NS_AVAILABLE_IOS(9_1);
  JS_PROTO_PROP_READONLY(estimationUpdateIndex);
  // A set of properties that has estimated values
  // Only denoting properties that are currently estimated
  //@property(nonatomic,readonly) UITouchProperties estimatedProperties NS_AVAILABLE_IOS(9_1);
  JS_PROTO_PROP_READONLY(estimatedProperties);
  // A set of properties that expect to have incoming updates in the future.
  // If no updates are expected for an estimated property the current value is our final estimate.
  // This happens e.g. for azimuth/altitude values when entering from the edges
  //@property(nonatomic,readonly) UITouchProperties estimatedPropertiesExpectingUpdates NS_AVAILABLE_IOS(9_1);
  JS_PROTO_PROP_READONLY(estimatedPropertiesExpectingUpdates);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITouch::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NUITouch *ui = new NUITouch();

  if (info[0]->IsExternal()) {
    ui->SetNSObject((__bridge UITouch *)(info[0].As<External>()->Value()));
  } else {
    @autoreleasepool {
      ui->SetNSObject([[UITouch alloc] init]);
    }
  }
  ui->Wrap(obj);

  JS_SET_RETURN(obj);
}

NUITouch::NUITouch () {}
NUITouch::~NUITouch () {}

//@property(nonatomic,readonly) NSTimeInterval      timestamp;
JS_GETTER(UITouch, ui, timestamp,
  JS_SET_RETURN(JS_NUM([ui timestamp]))
);
//@property(nonatomic,readonly) UITouchPhase        phase;
JS_GETTER(UITouch, ui, phase,
  JS_SET_RETURN(JS_INT([ui phase]))
);
//@property(nonatomic,readonly) NSUInteger          tapCount;   // touch down within a certain point within a certain amount of time
JS_GETTER(UITouch, ui, tapCount,
  JS_SET_RETURN(JS_INT([ui tapCount]))
);
//@property(nonatomic,readonly) UITouchType         type NS_AVAILABLE_IOS(9_0);
JS_GETTER(UITouch, ui, type,
  JS_SET_RETURN(JS_INT([ui type]))
);

// majorRadius and majorRadiusTolerance are in points
// The majorRadius will be accurate +/- the majorRadiusTolerance
//@property(nonatomic,readonly) CGFloat majorRadius NS_AVAILABLE_IOS(8_0);
JS_GETTER(UITouch, ui, majorRadius,
  JS_SET_RETURN(JS_NUM([ui majorRadius]))
);
//@property(nonatomic,readonly) CGFloat majorRadiusTolerance NS_AVAILABLE_IOS(8_0);
JS_GETTER(UITouch, ui, majorRadiusTolerance,
  JS_SET_RETURN(JS_NUM([ui majorRadiusTolerance]))
);

#include "NUIWindow.h"
//@property(nullable,nonatomic,readonly,strong) UIWindow                        *window;
JS_GETTER(UITouch, ui, window,
  JS_SET_RETURN(JS_WRAPPER([ui window], UIWindow))
);

#include "NUIView.h"
//@property(nullable,nonatomic,readonly,strong) UIView                          *view;
JS_GETTER(UITouch, ui, view,
  JS_SET_RETURN(JS_WRAPPER([ui view], UIView))
);

//@property(nullable,nonatomic,readonly,copy)   NSArray <UIGestureRecognizer *> *gestureRecognizers NS_AVAILABLE_IOS(3_2);


//- (CGPoint)locationInView:(nullable UIView *)view;
NAN_METHOD(NUITouch::locationInView) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITouch, ui);
  
  NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(info[0]));

  __block double x = 0;
  __block double y = 0;
  @autoreleasepool {
    CGPoint loc = [ui locationInView:view->As<UIView>()];
    x = loc.x;
    y = loc.y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(x));
  result->Set(JS_STR("y"), JS_NUM(y));
  
  JS_SET_RETURN(result);
}

//- (CGPoint)previousLocationInView:(nullable UIView *)view;
NAN_METHOD(NUITouch::previousLocationInView) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITouch, ui);
  
  NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(info[0]));

  __block double x = 0;
  __block double y = 0;
  @autoreleasepool {
    CGPoint loc = [ui previousLocationInView:view->As<UIView>()];
    x = loc.x;
    y = loc.y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(x));
  result->Set(JS_STR("y"), JS_NUM(y));
  
  JS_SET_RETURN(result);
}

// Use these methods to gain additional precision that may be available from touches.
// Do not use precise locations for hit testing. A touch may hit test inside a view, yet have a precise location that lies just outside.
//- (CGPoint)preciseLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
NAN_METHOD(NUITouch::preciseLocationInView) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITouch, ui);
  
  NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(info[0]));

  __block double x = 0;
  __block double y = 0;
  @autoreleasepool {
    CGPoint loc = [ui preciseLocationInView:view->As<UIView>()];
    x = loc.x;
    y = loc.y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(x));
  result->Set(JS_STR("y"), JS_NUM(y));
  
  JS_SET_RETURN(result);
}

//- (CGPoint)precisePreviousLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
NAN_METHOD(NUITouch::precisePreviousLocationInView) {
  Nan::HandleScope scope;

  JS_UNWRAP(UITouch, ui);
  
  NUIView *view = ObjectWrap::Unwrap<NUIView>(JS_OBJ(info[0]));

  __block double x = 0;
  __block double y = 0;
  @autoreleasepool {
    CGPoint loc = [ui precisePreviousLocationInView:view->As<UIView>()];
    x = loc.x;
    y = loc.y;
  }
  
  Local<Object> result = Object::New(Isolate::GetCurrent());
  result->Set(JS_STR("x"), JS_NUM(x));
  result->Set(JS_STR("y"), JS_NUM(y));
  
  JS_SET_RETURN(result);
}

// Force of the touch, where 1.0 represents the force of an average touch
//@property(nonatomic,readonly) CGFloat force NS_AVAILABLE_IOS(9_0);
JS_GETTER(UITouch, ui, force,
  JS_SET_RETURN(JS_NUM([ui force]))
);
// Maximum possible force with this input mechanism
//@property(nonatomic,readonly) CGFloat maximumPossibleForce NS_AVAILABLE_IOS(9_0);
JS_GETTER(UITouch, ui, maximumPossibleForce,
  JS_SET_RETURN(JS_NUM([ui maximumPossibleForce]))
);

// Azimuth angle. Valid only for stylus touch types. Zero radians points along the positive X axis.
// Passing a nil for the view parameter will return the azimuth relative to the touch's window.
//- (CGFloat)azimuthAngleInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
// A unit vector that points in the direction of the azimuth angle. Valid only for stylus touch types.
// Passing nil for the view parameter will return a unit vector relative to the touch's window.
//- (CGVector)azimuthUnitVectorInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);

// Altitude angle. Valid only for stylus touch types.
// Zero radians indicates that the stylus is parallel to the screen surface,
// while M_PI/2 radians indicates that it is normal to the screen surface.
//@property(nonatomic,readonly) CGFloat altitudeAngle NS_AVAILABLE_IOS(9_1);

// An index which allows you to correlate updates with the original touch.
// Is only guaranteed non-nil if this UITouch expects or is an update.
//@property(nonatomic,readonly) NSNumber * _Nullable estimationUpdateIndex NS_AVAILABLE_IOS(9_1);
JS_GETTER(UITouch, ui, estimationUpdateIndex,
  NSNumber* estimationUpdateIndex = [ui estimationUpdateIndex];
  if (estimationUpdateIndex != nullptr) {
    JS_SET_RETURN(JS_INT([estimationUpdateIndex integerValue]));
  }
);
// A set of properties that has estimated values
// Only denoting properties that are currently estimated
//@property(nonatomic,readonly) UITouchProperties estimatedProperties NS_AVAILABLE_IOS(9_1);
JS_GETTER(UITouch, ui, estimatedProperties,
  JS_SET_RETURN(JS_INT([ui estimatedProperties]))
);
// A set of properties that expect to have incoming updates in the future.
// If no updates are expected for an estimated property the current value is our final estimate.
// This happens e.g. for azimuth/altitude values when entering from the edges
//@property(nonatomic,readonly) UITouchProperties estimatedPropertiesExpectingUpdates NS_AVAILABLE_IOS(9_1);
JS_GETTER(UITouch, ui, estimatedPropertiesExpectingUpdates,
  JS_SET_RETURN(JS_INT([ui estimatedPropertiesExpectingUpdates]))
);
