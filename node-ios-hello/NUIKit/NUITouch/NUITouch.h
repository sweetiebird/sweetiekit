//
//  NUITouch.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-15.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITouch_h
#define NUITouch_h    

#include "NNSObject.h"

#define js_value_UITouch(x) js_value_wrapper(x, UITouch)
#define to_value_UITouch(x) to_value_wrapper(x, UITouch)
#define is_value_UITouch(x) is_value_wrapper(x, UITouch)

JS_WRAP_CLASS(UITouch, NSObject);
  
  //@property(nonatomic,readonly) NSTimeInterval      timestamp;
  JS_PROP(timestamp);
  //@property(nonatomic,readonly) UITouchPhase        phase;
  JS_PROP(phase);
  //@property(nonatomic,readonly) NSUInteger          tapCount;   // touch down within a certain point within a certain amount of time
  JS_PROP(tapCount);
  //@property(nonatomic,readonly) UITouchType         type NS_AVAILABLE_IOS(9_0);
  JS_PROP(type);

  // majorRadius and majorRadiusTolerance are in points
  // The majorRadius will be accurate +/- the majorRadiusTolerance
  //@property(nonatomic,readonly) CGFloat majorRadius NS_AVAILABLE_IOS(8_0);
  JS_PROP(majorRadius);
  //@property(nonatomic,readonly) CGFloat majorRadiusTolerance NS_AVAILABLE_IOS(8_0);
  JS_PROP(majorRadiusTolerance);

  //@property(nullable,nonatomic,readonly,strong) UIWindow                        *window;
  JS_PROP(window);
  //@property(nullable,nonatomic,readonly,strong) UIView                          *view;
  JS_PROP(view);
  //@property(nullable,nonatomic,readonly,copy)   NSArray <UIGestureRecognizer *> *gestureRecognizers NS_AVAILABLE_IOS(3_2);

  //- (CGPoint)locationInView:(nullable UIView *)view;
  JS_METHOD(locationInView);
  //- (CGPoint)previousLocationInView:(nullable UIView *)view;
  JS_METHOD(previousLocationInView);

  // Use these methods to gain additional precision that may be available from touches.
  // Do not use precise locations for hit testing. A touch may hit test inside a view, yet have a precise location that lies just outside.
  //- (CGPoint)preciseLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
  JS_METHOD(preciseLocationInView);
  //- (CGPoint)precisePreviousLocationInView:(nullable UIView *)view NS_AVAILABLE_IOS(9_1);
  JS_METHOD(precisePreviousLocationInView);

  // Force of the touch, where 1.0 represents the force of an average touch
  //@property(nonatomic,readonly) CGFloat force NS_AVAILABLE_IOS(9_0);
  JS_PROP(force);
  // Maximum possible force with this input mechanism
  //@property(nonatomic,readonly) CGFloat maximumPossibleForce NS_AVAILABLE_IOS(9_0);
  JS_PROP(maximumPossibleForce);

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
  JS_PROP(estimationUpdateIndex);
  // A set of properties that has estimated values
  // Only denoting properties that are currently estimated
  //@property(nonatomic,readonly) UITouchProperties estimatedProperties NS_AVAILABLE_IOS(9_1);
  JS_PROP(estimatedProperties);
  // A set of properties that expect to have incoming updates in the future.
  // If no updates are expected for an estimated property the current value is our final estimate.
  // This happens e.g. for azimuth/altitude values when entering from the edges
  //@property(nonatomic,readonly) UITouchProperties estimatedPropertiesExpectingUpdates NS_AVAILABLE_IOS(9_1);
  JS_PROP(estimatedPropertiesExpectingUpdates);
JS_WRAP_CLASS_END(UITouch);

#endif /* NUITouch_h */
