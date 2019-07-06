//
//  NUIView.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIView.h"

#define instancetype UIView
#define js_value_instancetype js_value_UIView

NUIView::NUIView() {}
NUIView::~NUIView() {}

NAN_METHOD(setNeedsDisplay);
NAN_METHOD(setNeedsDisplayInRect);

JS_INIT_CLASS(UIView, UIResponder);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(origin);
  JS_ASSIGN_PROTO_PROP(size);
  JS_ASSIGN_PROTO_PROP(x);
  JS_ASSIGN_PROTO_PROP(y);
  JS_ASSIGN_PROTO_PROP(width);
  JS_ASSIGN_PROTO_PROP(height);
  JS_ASSIGN_PROTO_METHOD_AS(hitTestWithEvent, "hitTest");
  JS_ASSIGN_PROTO_METHOD(hitTestWithEvent);
  JS_ASSIGN_PROTO_METHOD_AS(pointInsideWithEvent, "pointInside");
  JS_ASSIGN_PROTO_METHOD(pointInsideWithEvent);
  JS_ASSIGN_PROTO_METHOD(convertPointToView);
  JS_ASSIGN_PROTO_METHOD(convertPointFromView);
  JS_ASSIGN_PROTO_METHOD(convertRectToView);
  JS_ASSIGN_PROTO_METHOD(convertRectFromView);
  JS_ASSIGN_PROTO_METHOD(sizeThatFits);
  JS_ASSIGN_PROTO_METHOD(sizeToFit);
  JS_ASSIGN_PROTO_METHOD(removeFromSuperview);
  JS_ASSIGN_PROTO_METHOD(insertSubviewAtIndex);
  JS_ASSIGN_PROTO_METHOD(exchangeSubviewAtIndexWithSubviewAtIndex);
  JS_ASSIGN_PROTO_METHOD(addSubview);
  JS_ASSIGN_PROTO_METHOD(insertSubviewBelowSubview);
  JS_ASSIGN_PROTO_METHOD(insertSubviewAboveSubview);
  JS_ASSIGN_PROTO_METHOD(bringSubviewToFront);
  JS_ASSIGN_PROTO_METHOD(sendSubviewToBack);
  JS_ASSIGN_PROTO_METHOD(isDescendantOfView);
  JS_ASSIGN_PROTO_METHOD(viewWithTag);
  JS_ASSIGN_PROTO_METHOD(viewWithStringTag);
  JS_ASSIGN_PROTO_METHOD(setNeedsLayout);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplay);
  JS_ASSIGN_PROTO_METHOD(setNeedsDisplayInRect);
  JS_ASSIGN_PROTO_METHOD(layoutIfNeeded);
  JS_ASSIGN_PROTO_METHOD(layoutSubviews);
  JS_ASSIGN_PROTO_METHOD(addGestureRecognizer);
  JS_ASSIGN_PROTO_METHOD(removeGestureRecognizer);

  JS_ASSIGN_PROTO_METHOD(addMotionEffect);
  JS_ASSIGN_PROTO_METHOD(removeMotionEffect);
  JS_ASSIGN_PROTO_METHOD(addConstraint);
  JS_ASSIGN_PROTO_METHOD(addConstraints);
  JS_ASSIGN_PROTO_METHOD(removeConstraint);
  JS_ASSIGN_PROTO_METHOD(removeConstraints);
  JS_ASSIGN_PROTO_METHOD(updateConstraintsIfNeeded);
  JS_ASSIGN_PROTO_METHOD(updateConstraints);
  JS_ASSIGN_PROTO_METHOD(needsUpdateConstraints);
  JS_ASSIGN_PROTO_METHOD(setNeedsUpdateConstraints);
  JS_ASSIGN_PROTO_METHOD(alignmentRectForFrame);
  JS_ASSIGN_PROTO_METHOD(frameForAlignmentRect);
  JS_ASSIGN_PROTO_METHOD(viewForBaselineLayout);
  JS_ASSIGN_PROTO_METHOD(invalidateIntrinsicContentSize);
  JS_ASSIGN_PROTO_METHOD(contentHuggingPriorityForAxis);
  JS_ASSIGN_PROTO_METHOD(setContentHuggingPriorityForAxis);
  JS_ASSIGN_PROTO_METHOD(contentCompressionResistancePriorityForAxis);
  JS_ASSIGN_PROTO_METHOD(setContentCompressionResistancePriorityForAxis);
  JS_ASSIGN_PROTO_METHOD(systemLayoutSizeFittingSize);
  JS_ASSIGN_PROTO_METHOD(systemLayoutSizeFittingSizeWithHorizontalFittingPriorityVerticalFittingPriority);
  JS_ASSIGN_PROTO_METHOD(addLayoutGuide);
  JS_ASSIGN_PROTO_METHOD(removeLayoutGuide);
  JS_ASSIGN_PROTO_METHOD(constraintsAffectingLayoutForAxis);
  JS_ASSIGN_PROTO_METHOD(exerciseAmbiguityInLayout);
  JS_ASSIGN_PROTO_METHOD(snapshotViewAfterScreenUpdates);
  JS_ASSIGN_PROTO_METHOD(resizableSnapshotViewFromRectAfterScreenUpdatesWithCapInsets);
  JS_ASSIGN_PROTO_METHOD(drawViewHierarchyInRectAfterScreenUpdates);

  JS_ASSIGN_PROTO_PROP(viewDidAppear);
  JS_ASSIGN_PROTO_PROP(viewWillAppear);
  JS_ASSIGN_PROTO_PROP(viewDidDisappear);
  JS_ASSIGN_PROTO_PROP(viewWillDisappear);
//  JS_ASSIGN_PROTO_PROP(didAddSubview);
//  JS_ASSIGN_PROTO_PROP(willRemoveSubview);
//  JS_ASSIGN_PROTO_PROP(willMoveToSuperview);
//  JS_ASSIGN_PROTO_PROP(didMoveToSuperview);
//  JS_ASSIGN_PROTO_PROP(willMoveToWindow);
//  JS_ASSIGN_PROTO_PROP(didMoveToWindow);
  JS_ASSIGN_PROTO_PROP(drawRect);
  JS_SET_PROP(proto, "onLayoutMarginsDidChange", layoutMarginsDidChange);
  JS_SET_PROP(proto, "onSafeAreaInsetsDidChange", safeAreaInsetsDidChange);
  
  JS_SET_PROP(proto, "isUserInteractionEnabled", userInteractionEnabled);
  JS_ASSIGN_PROP(proto, userInteractionEnabled);
  JS_ASSIGN_PROP(proto, tag);
  JS_ASSIGN_PROP_READONLY(proto, layer);
  JS_ASSIGN_PROP_READONLY(proto, canBecomeFocused);
  JS_ASSIGN_PROP_READONLY(proto, focused);
  JS_ASSIGN_PROP(proto, semanticContentAttribute);
  JS_ASSIGN_PROP_READONLY(proto, effectiveUserInterfaceLayoutDirection);
  JS_ASSIGN_PROP(proto, frame);
  JS_ASSIGN_PROP(proto, bounds);
  JS_ASSIGN_PROP(proto, center);
  JS_ASSIGN_PROP(proto, transform);
  JS_ASSIGN_PROP(proto, contentScaleFactor);
  JS_ASSIGN_PROP(proto, multipleTouchEnabled);
  JS_ASSIGN_PROP(proto, exclusiveTouch);
  JS_ASSIGN_PROP(proto, autoresizesSubviews);
  JS_ASSIGN_PROP(proto, autoresizingMask);
  JS_ASSIGN_PROP_READONLY(proto, superview);
  JS_ASSIGN_PROP_READONLY(proto, subviews);
  JS_ASSIGN_PROP_READONLY(proto, window);
  JS_ASSIGN_PROP(proto, layoutMargins);
  JS_ASSIGN_PROP(proto, directionalLayoutMargins);
  JS_ASSIGN_PROP(proto, preservesSuperviewLayoutMargins);
  JS_ASSIGN_PROP(proto, insetsLayoutMarginsFromSafeArea);
  JS_ASSIGN_PROP_READONLY(proto, safeAreaInsets);
  JS_ASSIGN_PROP_READONLY(proto, layoutMarginsGuide);
  JS_ASSIGN_PROP_READONLY(proto, readableContentGuide);
  JS_ASSIGN_PROP_READONLY(proto, safeAreaLayoutGuide);
  JS_ASSIGN_PROP(proto, clipsToBounds);
  JS_ASSIGN_PROP(proto, backgroundColor);
  JS_ASSIGN_PROP(proto, alpha);
  JS_ASSIGN_PROP(proto, opaque);
  JS_ASSIGN_PROP(proto, clearsContextBeforeDrawing);
  JS_ASSIGN_PROP(proto, hidden);
  JS_ASSIGN_PROP(proto, contentMode);
  JS_ASSIGN_PROP(proto, contentStretch);
  JS_ASSIGN_PROP(proto, maskView);
  JS_ASSIGN_PROP(proto, tintColor);
  JS_ASSIGN_PROP(proto, tintAdjustmentMode);
  JS_ASSIGN_PROP(proto, gestureRecognizers);
  JS_ASSIGN_PROP(proto, motionEffects);
  JS_ASSIGN_PROP_READONLY(proto, constraints);
  JS_ASSIGN_PROP(proto, translatesAutoresizingMaskIntoConstraints);
  JS_ASSIGN_PROP_READONLY(proto, alignmentRectInsets);
  JS_ASSIGN_PROP_READONLY(proto, viewForFirstBaselineLayout);
  JS_ASSIGN_PROP_READONLY(proto, viewForLastBaselineLayout);
  JS_ASSIGN_PROP_READONLY(proto, intrinsicContentSize);
  JS_ASSIGN_PROP_READONLY(proto, layoutGuides);
  JS_ASSIGN_PROP_READONLY(proto, leadingAnchor);
  JS_ASSIGN_PROP_READONLY(proto, trailingAnchor);
  JS_ASSIGN_PROP_READONLY(proto, leftAnchor);
  JS_ASSIGN_PROP_READONLY(proto, rightAnchor);
  JS_ASSIGN_PROP_READONLY(proto, topAnchor);
  JS_ASSIGN_PROP_READONLY(proto, bottomAnchor);
  JS_ASSIGN_PROP_READONLY(proto, widthAnchor);
  JS_ASSIGN_PROP_READONLY(proto, heightAnchor);
  JS_ASSIGN_PROP_READONLY(proto, centerXAnchor);
  JS_ASSIGN_PROP_READONLY(proto, centerYAnchor);
  JS_ASSIGN_PROP_READONLY(proto, firstBaselineAnchor);
  JS_ASSIGN_PROP_READONLY(proto, lastBaselineAnchor);
  JS_ASSIGN_PROP_READONLY(proto, hasAmbiguousLayout);
  JS_ASSIGN_PROP(proto, restorationIdentifier);
  
  // UIView+Constants.swift
  JS_ASSIGN_PROTO_METHOD(pinToSuperview);
  JS_ASSIGN_PROTO_METHOD(pinToSuperviewWithInsets);
  JS_ASSIGN_PROTO_METHOD(pinToSuperviewWithEdges);
  JS_ASSIGN_PROTO_METHOD(pinToSuperviewWithInsetsEdges);
  
  // static members (ctor)
  JS_INIT_CTOR(UIView, UIResponder);
  JS_ASSIGN_STATIC_METHOD(layerClass);
  JS_ASSIGN_STATIC_METHOD(userInterfaceLayoutDirectionForSemanticContentAttribute);
  JS_ASSIGN_STATIC_METHOD(userInterfaceLayoutDirectionForSemanticContentAttributeRelativeToLayoutDirection);
  JS_ASSIGN_STATIC_METHOD(beginAnimationsContext);
  JS_ASSIGN_STATIC_METHOD_AS(beginAnimationsContext, "beginAnimations");
  JS_ASSIGN_STATIC_METHOD(commitAnimations);
  JS_ASSIGN_STATIC_METHOD(setAnimationDelegate);
  JS_ASSIGN_STATIC_METHOD(setAnimationWillStartSelector);
  JS_ASSIGN_STATIC_METHOD(setAnimationDidStopSelector);
  JS_ASSIGN_STATIC_METHOD(setAnimationDuration);
  JS_ASSIGN_STATIC_METHOD(setAnimationDelay);
  JS_ASSIGN_STATIC_METHOD(setAnimationStartDate);
  JS_ASSIGN_STATIC_METHOD(setAnimationCurve);
  JS_ASSIGN_STATIC_METHOD(setAnimationRepeatCount);
  JS_ASSIGN_STATIC_METHOD(setAnimationRepeatAutoreverses);
  JS_ASSIGN_STATIC_METHOD(setAnimationBeginsFromCurrentState);
  JS_ASSIGN_STATIC_METHOD(setAnimationTransitionForViewCache);
  JS_ASSIGN_STATIC_METHOD(setAnimationsEnabled);
  JS_ASSIGN_STATIC_METHOD(areAnimationsEnabled);
  JS_ASSIGN_STATIC_METHOD(performWithoutAnimation);
  JS_ASSIGN_STATIC_METHOD(inheritedAnimationDuration);
  JS_ASSIGN_STATIC_METHOD(animateWithDurationDelayOptionsAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(animateWithDurationAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(animateWithDurationAnimations);
  JS_ASSIGN_STATIC_METHOD(animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(transitionWithViewDurationOptionsAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(transitionFromViewToViewDurationOptionsCompletion);
  JS_ASSIGN_STATIC_METHOD(performSystemAnimationOnViewsOptionsAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(animateKeyframesWithDurationDelayOptionsAnimationsCompletion);
  JS_ASSIGN_STATIC_METHOD(addKeyframeWithRelativeStartTimeRelativeDurationAnimations);
  JS_ASSIGN_PROTO_METHOD(initWithFrame);
  JS_ASSIGN_PROTO_METHOD(initWithCoder);

  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), areAnimationsEnabled);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), inheritedAnimationDuration);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), requiresConstraintBasedLayout);
  
  // constants (exports)

//typedef NS_ENUM(NSInteger, UIViewAnimationCurve) {
  JS_ASSIGN_ENUM(UIViewAnimationCurveEaseInOut, NSInteger); //           // slow at beginning and end
  JS_ASSIGN_ENUM(UIViewAnimationCurveEaseIn, NSInteger); //              // slow at beginning
  JS_ASSIGN_ENUM(UIViewAnimationCurveEaseOut, NSInteger); //             // slow at end
  JS_ASSIGN_ENUM(UIViewAnimationCurveLinear, NSInteger); //  
//};

//typedef NS_ENUM(NSInteger, UIViewContentMode) {
  JS_ASSIGN_ENUM(UIViewContentModeScaleToFill, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeScaleAspectFit, NSInteger); //        // contents scaled to fit with fixed aspect. remainder is transparent
  JS_ASSIGN_ENUM(UIViewContentModeScaleAspectFill, NSInteger); //       // contents scaled to fill with fixed aspect. some portion of content may be clipped.
  JS_ASSIGN_ENUM(UIViewContentModeRedraw, NSInteger); //                // redraw on bounds change (calls -setNeedsDisplay)
  JS_ASSIGN_ENUM(UIViewContentModeCenter, NSInteger); //                // contents remain same size. positioned adjusted.
  JS_ASSIGN_ENUM(UIViewContentModeTop, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeBottom, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeLeft, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeRight, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeTopLeft, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeTopRight, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeBottomLeft, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewContentModeBottomRight, NSInteger); //  
//};

//typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
  JS_ASSIGN_ENUM(UIViewAnimationTransitionNone, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewAnimationTransitionFlipFromLeft, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewAnimationTransitionFlipFromRight, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewAnimationTransitionCurlUp, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewAnimationTransitionCurlDown, NSInteger); //  
//};

//typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
  JS_ASSIGN_ENUM(UIViewAutoresizingNone, NSUInteger); //                  = 0,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleLeftMargin, NSUInteger); //    = 1 << 0,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleWidth, NSUInteger); //         = 1 << 1,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleRightMargin, NSUInteger); //   = 1 << 2,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleTopMargin, NSUInteger); //     = 1 << 3,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleHeight, NSUInteger); //        = 1 << 4,
  JS_ASSIGN_ENUM(UIViewAutoresizingFlexibleBottomMargin, NSUInteger); //  = 1 << 5
//};

//typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
  JS_ASSIGN_ENUM(UIViewAnimationOptionLayoutSubviews, NSUInteger); //             = 1 <<  0,
  JS_ASSIGN_ENUM(UIViewAnimationOptionAllowUserInteraction, NSUInteger); //       = 1 <<  1, // turn on user interaction while animating
  JS_ASSIGN_ENUM(UIViewAnimationOptionBeginFromCurrentState, NSUInteger); //      = 1 <<  2, // start all views from current value, not initial value
  JS_ASSIGN_ENUM(UIViewAnimationOptionRepeat, NSUInteger); //                     = 1 <<  3, // repeat animation indefinitely
  JS_ASSIGN_ENUM(UIViewAnimationOptionAutoreverse, NSUInteger); //                = 1 <<  4, // if repeat, run animation back and forth
  JS_ASSIGN_ENUM(UIViewAnimationOptionOverrideInheritedDuration, NSUInteger); //  = 1 <<  5, // ignore nested duration
  JS_ASSIGN_ENUM(UIViewAnimationOptionOverrideInheritedCurve, NSUInteger); //     = 1 <<  6, // ignore nested curve
  JS_ASSIGN_ENUM(UIViewAnimationOptionAllowAnimatedContent, NSUInteger); //       = 1 <<  7, // animate contents (applies to transitions only)
  JS_ASSIGN_ENUM(UIViewAnimationOptionShowHideTransitionViews, NSUInteger); //    = 1 <<  8, // flip to/from hidden state instead of adding/removing
  JS_ASSIGN_ENUM(UIViewAnimationOptionOverrideInheritedOptions, NSUInteger); //   = 1 <<  9, // do not inherit any options or animation type
  
  JS_ASSIGN_ENUM(UIViewAnimationOptionCurveEaseInOut, NSUInteger); //             = 0 << 16, // default
  JS_ASSIGN_ENUM(UIViewAnimationOptionCurveEaseIn, NSUInteger); //                = 1 << 16,
  JS_ASSIGN_ENUM(UIViewAnimationOptionCurveEaseOut, NSUInteger); //               = 2 << 16,
  JS_ASSIGN_ENUM(UIViewAnimationOptionCurveLinear, NSUInteger); //                = 3 << 16,
  
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionNone, NSUInteger); //             = 0 << 20, // default
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionFlipFromLeft, NSUInteger); //     = 1 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionFlipFromRight, NSUInteger); //    = 2 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionCurlUp, NSUInteger); //           = 3 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionCurlDown, NSUInteger); //         = 4 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionCrossDissolve, NSUInteger); //    = 5 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionFlipFromTop, NSUInteger); //      = 6 << 20,
  JS_ASSIGN_ENUM(UIViewAnimationOptionTransitionFlipFromBottom, NSUInteger); //   = 7 << 20,

  JS_ASSIGN_ENUM(UIViewAnimationOptionPreferredFramesPerSecondDefault, NSUInteger); //      = 0 << 24,
  JS_ASSIGN_ENUM(UIViewAnimationOptionPreferredFramesPerSecond60, NSUInteger); //           = 3 << 24,
  JS_ASSIGN_ENUM(UIViewAnimationOptionPreferredFramesPerSecond30, NSUInteger); //           = 7 << 24,
  
//} NS_ENUM_AVAILABLE_IOS(4_0);

//typedef NS_OPTIONS(NSUInteger, UIViewKeyframeAnimationOptions) {
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionLayoutSubviews, NSUInteger); //             = UIViewAnimationOptionLayoutSubviews,
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionAllowUserInteraction, NSUInteger); //       = UIViewAnimationOptionAllowUserInteraction, // turn on user interaction while animating
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionBeginFromCurrentState, NSUInteger); //      = UIViewAnimationOptionBeginFromCurrentState, // start all views from current value, not initial value
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionRepeat, NSUInteger); //                     = UIViewAnimationOptionRepeat, // repeat animation indefinitely
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionAutoreverse, NSUInteger); //                = UIViewAnimationOptionAutoreverse, // if repeat, run animation back and forth
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionOverrideInheritedDuration, NSUInteger); //  = UIViewAnimationOptionOverrideInheritedDuration, // ignore nested duration
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionOverrideInheritedOptions, NSUInteger); //   = UIViewAnimationOptionOverrideInheritedOptions, // do not inherit any options or animation type
  
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionCalculationModeLinear, NSUInteger); //      = 0 << 10, // default
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionCalculationModeDiscrete, NSUInteger); //    = 1 << 10,
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionCalculationModePaced, NSUInteger); //       = 2 << 10,
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionCalculationModeCubic, NSUInteger); //       = 3 << 10,
  JS_ASSIGN_ENUM(UIViewKeyframeAnimationOptionCalculationModeCubicPaced, NSUInteger); //  = 4 << 10
//} NS_ENUM_AVAILABLE_IOS(7_0);

//typedef NS_ENUM(NSUInteger, UISystemAnimation) {
  JS_ASSIGN_ENUM(UISystemAnimationDelete, NSUInteger); //      // removes the views from the hierarchy when complete
//} NS_ENUM_AVAILABLE_IOS(7_0);

//typedef NS_ENUM(NSInteger, UIViewTintAdjustmentMode) {
  JS_ASSIGN_ENUM(UIViewTintAdjustmentModeAutomatic, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewTintAdjustmentModeNormal, NSInteger); //  
  JS_ASSIGN_ENUM(UIViewTintAdjustmentModeDimmed, NSInteger); //  
//} NS_ENUM_AVAILABLE_IOS(7_0);

//typedef NS_ENUM(NSInteger, UISemanticContentAttribute) {
  JS_ASSIGN_ENUM(UISemanticContentAttributeUnspecified, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UISemanticContentAttributePlayback, NSInteger); //   // for playback controls such as Play/RW/FF buttons and playhead scrubbers
  JS_ASSIGN_ENUM(UISemanticContentAttributeSpatial, NSInteger); //   // for controls that result in some sort of directional change in the UI, e.g. a segmented control for text alignment or a D-pad in a game
  JS_ASSIGN_ENUM(UISemanticContentAttributeForceLeftToRight, NSInteger); //  
  JS_ASSIGN_ENUM(UISemanticContentAttributeForceRightToLeft, NSInteger); // 
//} NS_ENUM_AVAILABLE_IOS(9_0);

//typedef NS_ENUM(NSInteger, UILayoutConstraintAxis) {
  JS_ASSIGN_ENUM(UILayoutConstraintAxisHorizontal, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UILayoutConstraintAxisVertical, NSInteger); //  = 1
//};

  // UIInterface.h constants
  
//typedef NS_ENUM(NSInteger, UIBarStyle) {
  JS_ASSIGN_ENUM(UIBarStyleDefault, NSInteger); //           = 0,
  JS_ASSIGN_ENUM(UIBarStyleBlack, NSInteger); //             = 1,
  
  JS_ASSIGN_ENUM(UIBarStyleBlackOpaque, NSInteger); //       = 1, // Deprecated. Use UIBarStyleBlack
  JS_ASSIGN_ENUM(UIBarStyleBlackTranslucent, NSInteger); //  = 2, // Deprecated. Use UIBarStyleBlack and set the translucent property to YES
//} __TVOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UIUserInterfaceSizeClass) {
  JS_ASSIGN_ENUM(UIUserInterfaceSizeClassUnspecified, NSInteger); //  = 0,
  JS_ASSIGN_ENUM(UIUserInterfaceSizeClassCompact, NSInteger); //      = 1,
  JS_ASSIGN_ENUM(UIUserInterfaceSizeClassRegular, NSInteger); //      = 2,
//} NS_ENUM_AVAILABLE_IOS(8_0);

// On iOS, these values are only available on trait environments with UIUserInterfaceIdiomCarPlay. 

//typedef NS_ENUM(NSInteger, UIUserInterfaceStyle) {
  JS_ASSIGN_ENUM(UIUserInterfaceStyleUnspecified, NSInteger); // ,
  JS_ASSIGN_ENUM(UIUserInterfaceStyleLight, NSInteger); // ,
  JS_ASSIGN_ENUM(UIUserInterfaceStyleDark, NSInteger); // ,
//} __TVOS_AVAILABLE(10_0) __IOS_AVAILABLE(12_0) __WATCHOS_PROHIBITED;

//typedef NS_ENUM(NSInteger, UIUserInterfaceLayoutDirection) {
  JS_ASSIGN_ENUM(UIUserInterfaceLayoutDirectionLeftToRight, NSInteger); // ,
  JS_ASSIGN_ENUM(UIUserInterfaceLayoutDirectionRightToLeft, NSInteger); // ,
//} NS_ENUM_AVAILABLE_IOS(5_0);

// These values are only used for the layout direction trait, which informs but does not completely dictate the layout direction of views. To determine the effective layout direction of a view, consult the UIView.effectiveUserInterfaceLayoutDirection property, whose values are members of the UIUserInterfaceLayoutDirection enum.

//typedef NS_ENUM(NSInteger, UITraitEnvironmentLayoutDirection) {
  JS_ASSIGN_ENUM(UITraitEnvironmentLayoutDirectionUnspecified, NSInteger); //  = -1,
  JS_ASSIGN_ENUM(UITraitEnvironmentLayoutDirectionLeftToRight, NSInteger); //  = UIUserInterfaceLayoutDirectionLeftToRight,
  JS_ASSIGN_ENUM(UITraitEnvironmentLayoutDirectionRightToLeft, NSInteger); //  = UIUserInterfaceLayoutDirectionRightToLeft,
//} NS_ENUM_AVAILABLE_IOS(10_0);

//typedef NS_ENUM(NSInteger, UIDisplayGamut) {
  JS_ASSIGN_ENUM(UIDisplayGamutUnspecified, NSInteger); //  = -1, // UIKit will not set this anymore, instead a sensible default is chosen based on the device capabilities and settings always
  JS_ASSIGN_ENUM(UIDisplayGamutSRGB, NSInteger); // ,
  JS_ASSIGN_ENUM(UIDisplayGamutP3, NSInteger); // 
//} NS_ENUM_AVAILABLE_IOS(10_0);

  JS_ASSIGN_CONSTANT("UIColorLightTextColor", UIColor, [UIColor lightTextColor]); // __TVOS_PROHIBITED;                // for a dark background
  JS_ASSIGN_CONSTANT("UIColorDarkTextColor", UIColor, [UIColor lightTextColor]); // __TVOS_PROHIBITED;                 // for a light background

  JS_ASSIGN_CONSTANT("UIColorGroupTableViewBackgroundColor", UIColor, [UIColor lightTextColor]); // __TVOS_PROHIBITED;

  JS_ASSIGN_CONSTANT("UIColorViewFlipsideBackgroundColor", UIColor, [UIColor lightTextColor]); // NS_DEPRECATED_IOS(2_0, 7_0) __TVOS_PROHIBITED;
  JS_ASSIGN_CONSTANT("UIColorScrollViewTexturedBackgroundColor", UIColor, [UIColor lightTextColor]); // NS_DEPRECATED_IOS(3_2, 7_0) __TVOS_PROHIBITED;
  JS_ASSIGN_CONSTANT("UIColorUnderPageBackgroundColor", UIColor, [UIColor lightTextColor]); // NS_DEPRECATED_IOS(5_0, 7_0) __TVOS_PROHIBITED;

  JS_ASSIGN_CONSTANT("UIFontLabelFontSize", CGFloat, [UIFont labelFontSize]); //__TVOS_PROHIBITED;
  JS_ASSIGN_CONSTANT("UIFontButtonFontSize", CGFloat, [UIFont buttonFontSize]); //__TVOS_PROHIBITED;
  JS_ASSIGN_CONSTANT("UIFontSmallSystemFontSize", CGFloat, [UIFont smallSystemFontSize]); //__TVOS_PROHIBITED;
  JS_ASSIGN_CONSTANT("UIFontSystemFontSize", CGFloat, [UIFont systemFontSize]); //__TVOS_PROHIBITED;

  // UIGeometry.h constants
  
  //typedef NS_OPTIONS(NSUInteger, UIRectEdge) {
    JS_ASSIGN_ENUM(UIRectEdgeNone, NSUInteger); //    = 0,
    JS_ASSIGN_ENUM(UIRectEdgeTop, NSUInteger); //     = 1 << 0,
    JS_ASSIGN_ENUM(UIRectEdgeLeft, NSUInteger); //    = 1 << 1,
    JS_ASSIGN_ENUM(UIRectEdgeBottom, NSUInteger); //  = 1 << 2,
    JS_ASSIGN_ENUM(UIRectEdgeRight, NSUInteger); //   = 1 << 3,
    JS_ASSIGN_ENUM(UIRectEdgeAll, NSUInteger); //     = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight
  //} NS_ENUM_AVAILABLE_IOS(7_0);

JS_INIT_CLASS_END(UIView, UIResponder);

NAN_METHOD(NUIView::New) {
  JS_RECONSTRUCT(UIView);
  @autoreleasepool {
    UIView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIView alloc] init];
    }
    if (self) {
      NUIView *wrapper = new NUIView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIView::layerClass) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_Class([UIView layerClass]));
  }
}

NAN_METHOD(NUIView::userInterfaceLayoutDirectionForSemanticContentAttribute) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UISemanticContentAttribute, attribute);
    JS_SET_RETURN(js_value_UIUserInterfaceLayoutDirection([UIView userInterfaceLayoutDirectionForSemanticContentAttribute: attribute]));
  }
}

NAN_METHOD(NUIView::userInterfaceLayoutDirectionForSemanticContentAttributeRelativeToLayoutDirection) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UISemanticContentAttribute, semanticContentAttribute);
    declare_value(UIUserInterfaceLayoutDirection, layoutDirection);
    JS_SET_RETURN(js_value_UIUserInterfaceLayoutDirection([UIView userInterfaceLayoutDirectionForSemanticContentAttribute: semanticContentAttribute relativeToLayoutDirection: layoutDirection]));
  }
}

NAN_METHOD(NUIView::beginAnimationsContext) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, animationID);
//    declare_nullable_pointer(void, context);
    void* context = nullptr; // TODO
    [UIView beginAnimations: animationID context: context];
  }
}

NAN_METHOD(NUIView::commitAnimations) {
  declare_autoreleasepool {
    [UIView commitAnimations];
  }
}

NAN_METHOD(NUIView::setAnimationDelegate) {
  declare_autoreleasepool {
    declare_args();
    declare_nullable_value(id, delegate);
    [UIView setAnimationDelegate: delegate];
  }
}

NAN_METHOD(NUIView::setAnimationWillStartSelector) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_nullable_value(SEL, selector);
    [UIView setAnimationWillStartSelector: selector];
    #endif
  }
}

NAN_METHOD(NUIView::setAnimationDidStopSelector) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_nullable_value(SEL, selector);
    [UIView setAnimationDidStopSelector: selector];
    #endif
  }
}

NAN_METHOD(NUIView::setAnimationDuration) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    [UIView setAnimationDuration: duration];
  }
}

NAN_METHOD(NUIView::setAnimationDelay) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, delay);
    [UIView setAnimationDelay: delay];
  }
}

NAN_METHOD(NUIView::setAnimationStartDate) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDate, startDate);
    [UIView setAnimationStartDate: startDate];
  }
}

NAN_METHOD(NUIView::setAnimationCurve) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIViewAnimationCurve, curve);
    [UIView setAnimationCurve: curve];
  }
}

NAN_METHOD(NUIView::setAnimationRepeatCount) {
  declare_autoreleasepool {
    declare_args();
    declare_value(float, repeatCount);
    [UIView setAnimationRepeatCount: repeatCount];
  }
}

NAN_METHOD(NUIView::setAnimationRepeatAutoreverses) {
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, repeatAutoreverses);
    [UIView setAnimationRepeatAutoreverses: repeatAutoreverses];
  }
}

NAN_METHOD(NUIView::setAnimationBeginsFromCurrentState) {
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, fromCurrentState);
    [UIView setAnimationBeginsFromCurrentState: fromCurrentState];
  }
}

NAN_METHOD(NUIView::setAnimationTransitionForViewCache) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UIViewAnimationTransition, transition);
    declare_pointer(UIView, view);
    declare_value(BOOL, cache);
    [UIView setAnimationTransition: transition forView: view cache: cache];
  }
}

NAN_METHOD(NUIView::setAnimationsEnabled) {
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, enabled);
    [UIView setAnimationsEnabled: enabled];
  }
}

NAN_METHOD(NUIView::areAnimationsEnabled) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([UIView areAnimationsEnabled]));
  }
}

NAN_METHOD(NUIView::performWithoutAnimation) {
  declare_autoreleasepool {
    declare_args();
    declare_callback(actionsWithoutAnimation);
    [UIView performWithoutAnimation:^{
      dispatch_main(^{
        if (actionsWithoutAnimation) {
          [actionsWithoutAnimation jsFunction]->Call("NUIView::performWithoutAnimation");
          clear_callback(actionsWithoutAnimation);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::inheritedAnimationDuration) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([UIView inheritedAnimationDuration]));
  }
}

NAN_METHOD(NUIView::animateWithDurationDelayOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(NSTimeInterval, delay);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    [UIView animateWithDuration: duration delay: delay options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::animateWithDurationDelayOptionsAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::animateWithDurationDelayOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::animateWithDurationAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_callback(animations);
    declare_callback(completion);
    [UIView animateWithDuration: duration animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::animateWithDurationAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::animateWithDurationAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::animateWithDurationAnimations) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_callback(animations);
    [UIView animateWithDuration: duration animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::animateWithDurationAnimations::animations");
          clear_callback(animations);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(NSTimeInterval, delay);
    declare_value(CGFloat, dampingRatio);
    declare_value(CGFloat, velocity);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    [UIView animateWithDuration: duration delay: delay usingSpringWithDamping: dampingRatio initialSpringVelocity: velocity options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::transitionWithViewDurationOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_value(NSTimeInterval, duration);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    [UIView transitionWithView: view duration: duration options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::transitionWithViewDurationOptionsAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::transitionWithViewDurationOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::transitionFromViewToViewDurationOptionsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, fromView);
    declare_pointer(UIView, toView);
    declare_value(NSTimeInterval, duration);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(completion);
    [UIView transitionFromView: fromView toView: toView duration: duration options: options completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::transitionFromViewToViewDurationOptionsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::performSystemAnimationOnViewsOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(UISystemAnimation, animation);
    declare_pointer(NSArray<UIView*>, views);
    declare_value(UIViewAnimationOptions, options);
    declare_callback(parallelAnimations);
    declare_callback(completion);
    [UIView performSystemAnimation: animation onViews: views options: options animations:^{
      dispatch_main(^{
        if (parallelAnimations) {
          [parallelAnimations jsFunction]->Call("NUIView::performSystemAnimationOnViewsOptionsAnimationsCompletion::parallelAnimations");
          clear_callback(parallelAnimations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::performSystemAnimationOnViewsOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::animateKeyframesWithDurationDelayOptionsAnimationsCompletion) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, duration);
    declare_value(NSTimeInterval, delay);
    declare_value(UIViewKeyframeAnimationOptions, options);
    declare_callback(animations);
    declare_callback(completion);
    [UIView animateKeyframesWithDuration: duration delay: delay options: options animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::animateKeyframesWithDurationDelayOptionsAnimationsCompletion::animations");
          clear_callback(animations);
        }
      });
    } completion:^(BOOL finished) {
      dispatch_main(^{
        if (completion) {
          [completion jsFunction]->Call("NUIView::animateKeyframesWithDurationDelayOptionsAnimationsCompletion::completion",
            js_value_BOOL(finished));
          clear_callback(completion);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::addKeyframeWithRelativeStartTimeRelativeDurationAnimations) {
  declare_autoreleasepool {
    declare_args();
    declare_value(double, frameStartTime);
    declare_value(double, frameDuration);
    declare_callback(animations);
    [UIView addKeyframeWithRelativeStartTime: frameStartTime relativeDuration: frameDuration animations:^{
      dispatch_main(^{
        if (animations) {
          [animations jsFunction]->Call("NUIView::addKeyframeWithRelativeStartTimeRelativeDurationAnimations::animations");
          clear_callback(animations);
        }
      });
    }];
  }
}

NAN_METHOD(NUIView::initWithFrame) {
  JS_UNWRAP_OR_ALLOC(UIView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_instancetype([self initWithFrame: frame]));
  }
}

#include "NNSCoder.h"

NAN_METHOD(NUIView::initWithCoder) {
  JS_UNWRAP_OR_ALLOC(UIView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, aDecoder);
    JS_SET_RETURN(js_value_instancetype([self initWithCoder: aDecoder]));
  }
}

NAN_GETTER(NUIView::originGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint(self.frame.origin));
  }
}

NAN_SETTER(NUIView::originSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.frame);
    rect.origin.x = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("x")));
    rect.origin.y = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("y")));
    [self setFrame:rect];
  }
}

NAN_GETTER(NUIView::sizeGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGSize(self.frame.size));
  }
}

NAN_SETTER(NUIView::sizeSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.frame);
    rect.size.width = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("width")));
    rect.size.height = TO_DOUBLE(JS_OBJ(value)->Get(JS_STR("height")));
    [self setFrame:rect];
  }
}

NAN_GETTER(NUIView::xGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat(self.frame.origin.x));
  }
}

NAN_SETTER(NUIView::xSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.frame);
    rect.origin.x = to_value_CGFloat(value);
    [self setFrame:rect];
  }
}

NAN_GETTER(NUIView::yGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat(self.frame.origin.y));
  }
}

NAN_SETTER(NUIView::ySetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.frame);
    rect.origin.y = to_value_CGFloat(value);
    [self setFrame:rect];
  }
}

NAN_GETTER(NUIView::widthGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat(self.bounds.size.width));
  }
}

NAN_SETTER(NUIView::widthSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.bounds);
    rect.size.width = to_value_CGFloat(value);
    [self setBounds:rect];
  }
}

NAN_GETTER(NUIView::heightGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat(self.bounds.size.height));
  }
}

NAN_SETTER(NUIView::heightSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    CGRect rect(self.bounds);
    rect.size.height = to_value_CGFloat(value);
    [self setBounds:rect];
  }
}

#include "NUIEvent.h"

NAN_METHOD(NUIView::hitTestWithEvent) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGPoint, point);
    declare_nullable_pointer(UIEvent, event);
    JS_SET_RETURN(js_value_UIView([self hitTest: point withEvent: event]));
  }
}

NAN_METHOD(NUIView::pointInsideWithEvent) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGPoint, point);
    declare_nullable_pointer(UIEvent, event);
    JS_SET_RETURN(js_value_BOOL([self pointInside: point withEvent: event]));
  }
}

NAN_METHOD(NUIView::convertPointToView) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point toView: view]));
  }
}

NAN_METHOD(NUIView::convertPointFromView) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGPoint, point);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGPoint([self convertPoint: point fromView: view]));
  }
}

NAN_METHOD(NUIView::convertRectToView) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGRect([self convertRect: rect toView: view]));
  }
}

NAN_METHOD(NUIView::convertRectFromView) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_CGRect([self convertRect: rect fromView: view]));
  }
}

NAN_METHOD(NUIView::sizeThatFits) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGSize, size);
    JS_SET_RETURN(js_value_CGSize([self sizeThatFits: size]));
  }
}

NAN_METHOD(NUIView::sizeToFit) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool {
    [self sizeToFit];
  }
}

NAN_METHOD(NUIView::removeFromSuperview) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self removeFromSuperview]));
  }
}

NAN_METHOD(NUIView::insertSubviewAtIndex) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    declare_value(NSInteger, index);
    JS_SET_RETURN(js_value_void([self insertSubview: view atIndex: index]));
  }
}

NAN_METHOD(NUIView::exchangeSubviewAtIndexWithSubviewAtIndex) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSInteger, index1);
    declare_value(NSInteger, index2);
    JS_SET_RETURN(js_value_void([self exchangeSubviewAtIndex: index1 withSubviewAtIndex: index2]));
  }
}

NAN_METHOD(NUIView::addSubview) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_void([self addSubview: view]));
  }
}

NAN_METHOD(NUIView::insertSubviewBelowSubview) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    declare_pointer(UIView, siblingSubview);
    JS_SET_RETURN(js_value_void([self insertSubview: view belowSubview: siblingSubview]));
  }
}

NAN_METHOD(NUIView::insertSubviewAboveSubview) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    declare_pointer(UIView, siblingSubview);
    JS_SET_RETURN(js_value_void([self insertSubview: view aboveSubview: siblingSubview]));
  }
}

NAN_METHOD(NUIView::bringSubviewToFront) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_void([self bringSubviewToFront: view]));
  }
}

NAN_METHOD(NUIView::sendSubviewToBack) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_void([self sendSubviewToBack: view]));
  }
}

NAN_METHOD(NUIView::isDescendantOfView) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_BOOL([self isDescendantOfView: view]));
  }
}

NAN_METHOD(NUIView::setNeedsLayout) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self setNeedsLayout]));
  }
}

NAN_METHOD(setNeedsDisplay) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self setNeedsDisplay]));
  }
}

NAN_METHOD(setNeedsDisplayInRect) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_void([self setNeedsDisplayInRect: rect]));
  }
}

NAN_METHOD(NUIView::layoutIfNeeded) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self layoutIfNeeded]));
  }
}

NAN_METHOD(NUIView::layoutSubviews) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self layoutSubviews]));
  }
}

NAN_METHOD(NUIView::viewWithTag) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(NSInteger, tag);
    JS_SET_RETURN(js_value_UIView([self viewWithTag: tag]));
  }
}

NAN_METHOD(NUIView::viewWithStringTag) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSString, key);
    JS_SET_RETURN(js_value_UIView([self viewWithStringTagWithStrTag:key]));
  }
}

NAN_METHOD(NUIView::setNeedsDisplay) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self setNeedsDisplay]));
  }
}

NAN_METHOD(NUIView::setNeedsDisplayInRect) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    JS_SET_RETURN(js_value_void([self setNeedsDisplayInRect: rect]));
  }
}

#include "NUIGestureRecognizer.h"

NAN_METHOD(NUIView::addGestureRecognizer) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIGestureRecognizer, ui);
    JS_SET_RETURN(js_value_void([self addGestureRecognizer: ui]));
  }
}

NAN_METHOD(NUIView::removeGestureRecognizer) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIGestureRecognizer, ui);
    JS_SET_RETURN(js_value_void([self removeGestureRecognizer:ui]));
  }
}

#include "NUIMotionEffect.h"

NAN_METHOD(NUIView::addMotionEffect) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIMotionEffect, effect);
    JS_SET_RETURN(js_value_void([self addMotionEffect: effect]));
  }
}

NAN_METHOD(NUIView::removeMotionEffect) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UIMotionEffect, effect);
    JS_SET_RETURN(js_value_void([self removeMotionEffect: effect]));
  }
}

#include "NNSLayoutConstraint.h"

NAN_METHOD(NUIView::addConstraint) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutConstraint, constraint);
    JS_SET_RETURN(js_value_void([self addConstraint: constraint]));
  }
}

NAN_METHOD(NUIView::addConstraints) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSArray<NSLayoutConstraint*>, constraints);
    JS_SET_RETURN(js_value_void([self addConstraints: constraints]));
  }
}

NAN_METHOD(NUIView::removeConstraint) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSLayoutConstraint, constraint);
    JS_SET_RETURN(js_value_void([self removeConstraint: constraint]));
  }
}

NAN_METHOD(NUIView::removeConstraints) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(NSArray<NSLayoutConstraint*>, constraints);
    JS_SET_RETURN(js_value_void([self removeConstraints: constraints]));
  }
}

NAN_METHOD(NUIView::updateConstraintsIfNeeded) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self updateConstraintsIfNeeded]));
  }
}

NAN_METHOD(NUIView::updateConstraints) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self updateConstraints]));
  }
}

NAN_METHOD(NUIView::needsUpdateConstraints) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self needsUpdateConstraints]));
  }
}

NAN_METHOD(NUIView::setNeedsUpdateConstraints) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self setNeedsUpdateConstraints]));
  }
}

NAN_METHOD(NUIView::alignmentRectForFrame) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_CGRect([self alignmentRectForFrame: frame]));
  }
}

NAN_METHOD(NUIView::frameForAlignmentRect) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, alignmentRect);
    JS_SET_RETURN(js_value_CGRect([self frameForAlignmentRect: alignmentRect]));
  }
}

NAN_METHOD(NUIView::viewForBaselineLayout) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self viewForBaselineLayout]));
  }
}

NAN_METHOD(NUIView::invalidateIntrinsicContentSize) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self invalidateIntrinsicContentSize]));
  }
}

NAN_METHOD(NUIView::contentHuggingPriorityForAxis) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UILayoutConstraintAxis, axis);
    JS_SET_RETURN(js_value_UILayoutPriority([self contentHuggingPriorityForAxis: axis]));
  }
}

NAN_METHOD(NUIView::setContentHuggingPriorityForAxis) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UILayoutPriority, priority);
    declare_value(UILayoutConstraintAxis, axis);
    JS_SET_RETURN(js_value_void([self setContentHuggingPriority: priority forAxis: axis]));
  }
}

NAN_METHOD(NUIView::contentCompressionResistancePriorityForAxis) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UILayoutConstraintAxis, axis);
    JS_SET_RETURN(js_value_UILayoutPriority([self contentCompressionResistancePriorityForAxis: axis]));
  }
}

NAN_METHOD(NUIView::setContentCompressionResistancePriorityForAxis) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UILayoutPriority, priority);
    declare_value(UILayoutConstraintAxis, axis);
    JS_SET_RETURN(js_value_void([self setContentCompressionResistancePriority: priority forAxis: axis]));
  }
}

NAN_METHOD(NUIView::systemLayoutSizeFittingSize) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGSize, targetSize);
    JS_SET_RETURN(js_value_CGSize([self systemLayoutSizeFittingSize: targetSize]));
  }
}

NAN_METHOD(NUIView::systemLayoutSizeFittingSizeWithHorizontalFittingPriorityVerticalFittingPriority) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGSize, targetSize);
    declare_value(UILayoutPriority, horizontalFittingPriority);
    declare_value(UILayoutPriority, verticalFittingPriority);
    JS_SET_RETURN(js_value_CGSize([self systemLayoutSizeFittingSize: targetSize withHorizontalFittingPriority: horizontalFittingPriority verticalFittingPriority: verticalFittingPriority]));
  }
}

#include "NUILayoutGuide.h"

NAN_METHOD(NUIView::addLayoutGuide) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UILayoutGuide, layoutGuide);
    JS_SET_RETURN(js_value_void([self addLayoutGuide: layoutGuide]));
  }
}

NAN_METHOD(NUIView::removeLayoutGuide) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_pointer(UILayoutGuide, layoutGuide);
    JS_SET_RETURN(js_value_void([self removeLayoutGuide: layoutGuide]));
  }
}

NAN_METHOD(NUIView::constraintsAffectingLayoutForAxis) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UILayoutConstraintAxis, axis);
    JS_SET_RETURN(js_value_NSArray<NSLayoutConstraint*>([self constraintsAffectingLayoutForAxis: axis]));
  }
}

NAN_METHOD(NUIView::exerciseAmbiguityInLayout) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_void([self exerciseAmbiguityInLayout]));
  }
}

NAN_METHOD(NUIView::snapshotViewAfterScreenUpdates) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(BOOL, afterUpdates);
    JS_SET_RETURN(js_value_UIView([self snapshotViewAfterScreenUpdates: afterUpdates]));
  }
}

NAN_METHOD(NUIView::resizableSnapshotViewFromRectAfterScreenUpdatesWithCapInsets) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(BOOL, afterUpdates);
    declare_value(UIEdgeInsets, capInsets);
    JS_SET_RETURN(js_value_UIView([self resizableSnapshotViewFromRect: rect afterScreenUpdates: afterUpdates withCapInsets: capInsets]));
  }
}

NAN_METHOD(NUIView::drawViewHierarchyInRectAfterScreenUpdates) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(BOOL, afterUpdates);
    JS_SET_RETURN(js_value_BOOL([self drawViewHierarchyInRect: rect afterScreenUpdates: afterUpdates]));
  }
}

NAN_GETTER(NUIView::viewDidAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
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

NAN_SETTER(NUIView::viewDidAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidAppear"];
  }
}

NAN_GETTER(NUIView::viewWillAppearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
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

NAN_SETTER(NUIView::viewWillAppearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillAppear"];
  }
}

NAN_GETTER(NUIView::viewDidDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
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

NAN_SETTER(NUIView::viewDidDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewDidDisappear"];
  }
}

NAN_GETTER(NUIView::viewWillDisappearGetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  
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

NAN_SETTER(NUIView::viewWillDisappearSetter) {
  Nan::EscapableHandleScope scope;

  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(scope.Escape(value));
    [ui associateValue:func withKey:@"sweetiekit_viewWillDisappear"];
  }
}

NAN_GETTER(NUIView::drawRectGetter) {
  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_drawRect"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(handle);
    }
  }
}

NAN_SETTER(NUIView::drawRectSetter) {
  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(value);
    [ui associateValue:func withKey:@"sweetiekit_drawRect"];
  }
}

NAN_GETTER(NUIView::layoutMarginsDidChangeGetter) {
  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_layoutMarginsDidChange"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(handle);
    }
  }
}

NAN_SETTER(NUIView::layoutMarginsDidChangeSetter) {
  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(value);
    [ui associateValue:func withKey:@"sweetiekit_layoutMarginsDidChange"];
  }
}

NAN_GETTER(NUIView::safeAreaInsetsDidChangeGetter) {
  JS_UNWRAP(UIView, ui);
  
  @autoreleasepool {
    id fn = [ui associatedValueForKey:@"sweetiekit_safeAreaInsetsDidChange"];
    if (fn != nullptr) {
      SweetJSFunction* func = (SweetJSFunction*)fn;
      sweetiekit::JSFunction& f = *[func jsFunction];
      Local<Function> handle = Nan::New(*f.cb);
      JS_SET_RETURN(handle);
    }
  }
}

NAN_SETTER(NUIView::safeAreaInsetsDidChangeSetter) {
  JS_UNWRAP(UIView, ui);
  @autoreleasepool {
    SweetJSFunction* func = [[SweetJSFunction alloc] init];
    [func jsFunction]->Reset(value);
    [ui associateValue:func withKey:@"sweetiekit_safeAreaInsetsDidChange"];
  }
}

#include "NUIGestureRecognizer.h"

NAN_GETTER(NUIView::userInteractionEnabledGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isUserInteractionEnabled]));
  }
}

NAN_SETTER(NUIView::userInteractionEnabledSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setUserInteractionEnabled: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::tagGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSInteger([self tag]));
  }
}

NAN_SETTER(NUIView::tagSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setTag: to_value_NSInteger(value)];
  }
}

#include "NCALayer.h"

NAN_GETTER(NUIView::layerGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CALayer([self layer]));
  }
}

NAN_GETTER(NUIView::canBecomeFocusedGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self canBecomeFocused]));
  }
}

NAN_GETTER(NUIView::focusedGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isFocused]));
  }
}

NAN_GETTER(NUIView::semanticContentAttributeGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UISemanticContentAttribute([self semanticContentAttribute]));
  }
}

NAN_SETTER(NUIView::semanticContentAttributeSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setSemanticContentAttribute: to_value_UISemanticContentAttribute(value)];
  }
}

NAN_GETTER(NUIView::effectiveUserInterfaceLayoutDirectionGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    UIUserInterfaceLayoutDirection value([self effectiveUserInterfaceLayoutDirection]);
    JS_SET_RETURN(js_value_UIUserInterfaceLayoutDirection(value));
  }
}

NAN_GETTER(NUIView::frameGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGRect([self frame]));
  }
}

NAN_SETTER(NUIView::frameSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setFrame: to_value_CGRect(value)];
  }
}

NAN_GETTER(NUIView::boundsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGRect([self bounds]));
  }
}

NAN_SETTER(NUIView::boundsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setBounds: to_value_CGRect(value)];
  }
}

NAN_GETTER(NUIView::centerGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGPoint([self center]));
  }
}

NAN_SETTER(NUIView::centerSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setCenter: to_value_CGPoint(value)];
  }
}

NAN_GETTER(NUIView::transformGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGAffineTransform([self transform]));
  }
}

NAN_SETTER(NUIView::transformSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setTransform: to_value_CGAffineTransform(value)];
  }
}

NAN_GETTER(NUIView::contentScaleFactorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self contentScaleFactor]));
  }
}

NAN_SETTER(NUIView::contentScaleFactorSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setContentScaleFactor: to_value_CGFloat(value)];
  }
}

NAN_GETTER(NUIView::multipleTouchEnabledGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isMultipleTouchEnabled]));
  }
}

NAN_SETTER(NUIView::multipleTouchEnabledSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setMultipleTouchEnabled: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::exclusiveTouchGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isExclusiveTouch]));
  }
}

NAN_SETTER(NUIView::exclusiveTouchSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setExclusiveTouch: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::autoresizesSubviewsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self autoresizesSubviews]));
  }
}

NAN_SETTER(NUIView::autoresizesSubviewsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setAutoresizesSubviews: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::autoresizingMaskGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIViewAutoresizing([self autoresizingMask]));
  }
}

NAN_SETTER(NUIView::autoresizingMaskSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setAutoresizingMask: to_value_UIViewAutoresizing(value)];
  }
}

NAN_GETTER(NUIView::superviewGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView ([self superview]));
  }
}

NAN_GETTER(NUIView::subviewsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray< UIView* >([self subviews]));
  }
}

#include "NUIWindow.h"

NAN_GETTER(NUIView::windowGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIWindow([self window]));
  }
}

NAN_GETTER(NUIView::layoutMarginsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIEdgeInsets([self layoutMargins]));
  }
}

NAN_SETTER(NUIView::layoutMarginsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setLayoutMargins: to_value_UIEdgeInsets(value)];
  }
}

NAN_GETTER(NUIView::directionalLayoutMarginsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSDirectionalEdgeInsets([self directionalLayoutMargins]));
  }
}

NAN_SETTER(NUIView::directionalLayoutMarginsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setDirectionalLayoutMargins: to_value_NSDirectionalEdgeInsets(value)];
  }
}

NAN_GETTER(NUIView::preservesSuperviewLayoutMarginsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self preservesSuperviewLayoutMargins]));
  }
}

NAN_SETTER(NUIView::preservesSuperviewLayoutMarginsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setPreservesSuperviewLayoutMargins: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::insetsLayoutMarginsFromSafeAreaGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self insetsLayoutMarginsFromSafeArea]));
  }
}

NAN_SETTER(NUIView::insetsLayoutMarginsFromSafeAreaSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setInsetsLayoutMarginsFromSafeArea: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::safeAreaInsetsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIEdgeInsets([self safeAreaInsets]));
  }
}

NAN_GETTER(NUIView::layoutMarginsGuideGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UILayoutGuide([self layoutMarginsGuide]));
  }
}

NAN_GETTER(NUIView::readableContentGuideGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UILayoutGuide([self readableContentGuide]));
  }
}

NAN_GETTER(NUIView::safeAreaLayoutGuideGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UILayoutGuide([self safeAreaLayoutGuide]));
  }
}

NAN_GETTER(NUIView::clipsToBoundsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self clipsToBounds]));
  }
}

NAN_SETTER(NUIView::clipsToBoundsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setClipsToBounds: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::backgroundColorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIColor([self backgroundColor]));
  }
}

NAN_SETTER(NUIView::backgroundColorSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_setter();
    declare_pointer(UIColor, value);
    [self setBackgroundColor: value];
  }
}

NAN_GETTER(NUIView::alphaGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGFloat([self alpha]));
  }
}

NAN_SETTER(NUIView::alphaSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_setter();
    declare_value(CGFloat, value);
    [self setAlpha: value];
  }
}

NAN_GETTER(NUIView::opaqueGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isOpaque]));
  }
}

NAN_SETTER(NUIView::opaqueSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_setter();
    declare_value(BOOL, value);
    [self setOpaque: value];
  }
}

NAN_GETTER(NUIView::clearsContextBeforeDrawingGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self clearsContextBeforeDrawing]));
  }
}

NAN_SETTER(NUIView::clearsContextBeforeDrawingSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setClearsContextBeforeDrawing: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::hiddenGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self isHidden]));
  }
}

NAN_SETTER(NUIView::hiddenSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_setter();
    declare_value(BOOL, value);
    [self setHidden: value];
  }
}

NAN_GETTER(NUIView::contentModeGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIViewContentMode([self contentMode]));
  }
}

NAN_SETTER(NUIView::contentModeSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setContentMode: to_value_UIViewContentMode(value)];
  }
}

NAN_GETTER(NUIView::contentStretchGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGRect([self contentStretch]));
  }
}

NAN_SETTER(NUIView::contentStretchSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setContentStretch: to_value_CGRect(value)];
  }
}

NAN_GETTER(NUIView::maskViewGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self maskView]));
  }
}

NAN_SETTER(NUIView::maskViewSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setMaskView: to_value_UIView (value)];
  }
}

NAN_GETTER(NUIView::tintColorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUIView::tintColorSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_setter();
    declare_pointer(UIColor, value);
    [self setTintColor: value];
  }
}

NAN_GETTER(NUIView::tintAdjustmentModeGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIViewTintAdjustmentMode([self tintAdjustmentMode]));
  }
}

NAN_SETTER(NUIView::tintAdjustmentModeSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setTintAdjustmentMode: to_value_UIViewTintAdjustmentMode(value)];
  }
}

#include "NUIGestureRecognizer.h"

NAN_GETTER(NUIView::gestureRecognizersGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray< UIGestureRecognizer* >([self gestureRecognizers]));
  }
}

NAN_SETTER(NUIView::gestureRecognizersSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setGestureRecognizers: to_value_NSArray< UIGestureRecognizer* >(value)];
  }
}

NAN_GETTER(NUIView::motionEffectsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray< UIMotionEffect* >([self motionEffects]));
  }
}

NAN_SETTER(NUIView::motionEffectsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setMotionEffects: to_value_NSArray< UIMotionEffect* >(value)];
  }
}

NAN_GETTER(NUIView::constraintsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray< NSLayoutConstraint* >([self constraints]));
  }
}

NAN_GETTER(NUIView::translatesAutoresizingMaskIntoConstraintsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self translatesAutoresizingMaskIntoConstraints]));
  }
}

NAN_SETTER(NUIView::translatesAutoresizingMaskIntoConstraintsSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setTranslatesAutoresizingMaskIntoConstraints: to_value_BOOL(value)];
  }
}

NAN_GETTER(NUIView::alignmentRectInsetsGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIEdgeInsets([self alignmentRectInsets]));
  }
}

NAN_GETTER(NUIView::viewForFirstBaselineLayoutGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self viewForFirstBaselineLayout]));
  }
}

NAN_GETTER(NUIView::viewForLastBaselineLayoutGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_UIView([self viewForLastBaselineLayout]));
  }
}

NAN_GETTER(NUIView::intrinsicContentSizeGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_CGSize([self intrinsicContentSize]));
  }
}

NAN_GETTER(NUIView::layoutGuidesGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSArray< UILayoutGuide* >([self layoutGuides]));
  }
}

#include "NNSLayoutXAxisAnchor.h"

NAN_GETTER(NUIView::leadingAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self leadingAnchor]));
  }
}

NAN_GETTER(NUIView::trailingAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self trailingAnchor]));
  }
}

NAN_GETTER(NUIView::leftAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self leftAnchor]));
  }
}

NAN_GETTER(NUIView::rightAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self rightAnchor]));
  }
}

#include "NNSLayoutYAxisAnchor.h"

NAN_GETTER(NUIView::topAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self topAnchor]));
  }
}

NAN_GETTER(NUIView::bottomAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self bottomAnchor]));
  }
}

#include "NNSLayoutDimension.h"

NAN_GETTER(NUIView::widthAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutDimension([self widthAnchor]));
  }
}

NAN_GETTER(NUIView::heightAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutDimension([self heightAnchor]));
  }
}

NAN_GETTER(NUIView::centerXAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutXAxisAnchor([self centerXAnchor]));
  }
}

NAN_GETTER(NUIView::centerYAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self centerYAnchor]));
  }
}

NAN_GETTER(NUIView::firstBaselineAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self firstBaselineAnchor]));
  }
}

NAN_GETTER(NUIView::lastBaselineAnchorGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSLayoutYAxisAnchor([self lastBaselineAnchor]));
  }
}

NAN_GETTER(NUIView::hasAmbiguousLayoutGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([self hasAmbiguousLayout]));
  }
}

NAN_GETTER(NUIView::restorationIdentifierGetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSString([self restorationIdentifier]));
  }
}

NAN_SETTER(NUIView::restorationIdentifierSetter) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    [self setRestorationIdentifier: to_value_NSString(value)];
  }
}

NAN_GETTER(NUIView::areAnimationsEnabledGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([UIView areAnimationsEnabled]));
  }
}

NAN_GETTER(NUIView::inheritedAnimationDurationGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_NSTimeInterval([UIView inheritedAnimationDuration]));
  }
}

NAN_GETTER(NUIView::requiresConstraintBasedLayoutGetter) {
  @autoreleasepool
  {
    JS_SET_RETURN(js_value_BOOL([UIView requiresConstraintBasedLayout]));
  }
}

NAN_METHOD(NUIView::pinToSuperview) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    [self pinToSuperviewWith:UIEdgeInsetsZero edges:UIRectEdgeAll];
  }
}

NAN_METHOD(NUIView::pinToSuperviewWithInsets) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UIEdgeInsets, insets);
    [self pinToSuperviewWith:insets edges:UIRectEdgeAll];
  }
}

NAN_METHOD(NUIView::pinToSuperviewWithEdges) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UIRectEdge, edges);
    [self pinToSuperviewWith:UIEdgeInsetsZero edges:edges];
  }
}

NAN_METHOD(NUIView::pinToSuperviewWithInsetsEdges) {
  JS_UNWRAP(UIView, self);
  @autoreleasepool
  {
    declare_args();
    declare_value(UIEdgeInsets, insets);
    declare_value(UIRectEdge, edges);
    [self pinToSuperviewWith:insets edges:edges];
  }
}
