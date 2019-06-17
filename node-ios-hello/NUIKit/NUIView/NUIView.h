//
//  NUIView.h
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIView_h
#define NUIView_h

#include "NUIResponder.h"

#define js_value_UIView(x) js_value_wrapper(x, UIView)
#define to_value_UIView(x) to_value_wrapper(x, UIView)
#define is_value_UIView(x) is_value_wrapper(x, UIView)

// UIKit constants

#define js_value_UIViewAnimationCurve(x) js_enum_wrapper(x, UIViewAnimationCurve)
#define to_value_UIViewAnimationCurve(x) to_enum_wrapper(x, UIViewAnimationCurve)
#define is_value_UIViewAnimationCurve(x) is_enum_wrapper(x, UIViewAnimationCurve)

#define js_value_UIViewContentMode(x) js_enum_wrapper(x, UIViewContentMode)
#define to_value_UIViewContentMode(x) to_enum_wrapper(x, UIViewContentMode)
#define is_value_UIViewContentMode(x) is_enum_wrapper(x, UIViewContentMode)

#define js_value_UIViewAnimationTransition(x) js_enum_wrapper(x, UIViewAnimationTransition)
#define to_value_UIViewAnimationTransition(x) to_enum_wrapper(x, UIViewAnimationTransition)
#define is_value_UIViewAnimationTransition(x) is_enum_wrapper(x, UIViewAnimationTransition)

#define js_value_UIViewAutoresizing(x) js_opts_wrapper(x, UIViewAutoresizing)
#define to_value_UIViewAutoresizing(x) to_opts_wrapper(x, UIViewAutoresizing)
#define is_value_UIViewAutoresizing(x) is_opts_wrapper(x, UIViewAutoresizing)

#define js_value_UIViewAnimationOptions(x) js_opts_wrapper(x, UIViewAnimationOptions)
#define to_value_UIViewAnimationOptions(x) to_opts_wrapper(x, UIViewAnimationOptions)
#define is_value_UIViewAnimationOptions(x) is_opts_wrapper(x, UIViewAnimationOptions)

#define js_value_UIViewKeyframeAnimationOptions(x) js_opts_wrapper(x, UIViewKeyframeAnimationOptions)
#define to_value_UIViewKeyframeAnimationOptions(x) to_opts_wrapper(x, UIViewKeyframeAnimationOptions)
#define is_value_UIViewKeyframeAnimationOptions(x) is_opts_wrapper(x, UIViewKeyframeAnimationOptions)

#define js_value_UISystemAnimation(x) js_enum_wrapper(x, UISystemAnimation)
#define to_value_UISystemAnimation(x) to_enum_wrapper(x, UISystemAnimation)
#define is_value_UISystemAnimation(x) is_enum_wrapper(x, UISystemAnimation)

#define js_value_UIViewTintAdjustmentMode(x) js_enum_wrapper(x, UIViewTintAdjustmentMode)
#define to_value_UIViewTintAdjustmentMode(x) to_enum_wrapper(x, UIViewTintAdjustmentMode)
#define is_value_UIViewTintAdjustmentMode(x) is_enum_wrapper(x, UIViewTintAdjustmentMode)

#define js_value_UISemanticContentAttribute(x) js_enum_wrapper(x, UISemanticContentAttribute)
#define to_value_UISemanticContentAttribute(x) to_enum_wrapper(x, UISemanticContentAttribute)
#define is_value_UISemanticContentAttribute(x) is_enum_wrapper(x, UISemanticContentAttribute)

#define js_value_UILayoutConstraintAxis(x) js_enum_wrapper(x, UILayoutConstraintAxis)
#define to_value_UILayoutConstraintAxis(x) to_enum_wrapper(x, UILayoutConstraintAxis)
#define is_value_UILayoutConstraintAxis(x) is_enum_wrapper(x, UILayoutConstraintAxis)

// UIInterface.h constants

#define js_value_UIBarStyle(x) js_enum_wrapper(x, UIBarStyle)
#define to_value_UIBarStyle(x) to_enum_wrapper(x, UIBarStyle)
#define is_value_UIBarStyle(x) is_enum_wrapper(x, UIBarStyle)

#define js_value_UIUserInterfaceSizeClass(x) js_enum_wrapper(x, UIUserInterfaceSizeClass)
#define to_value_UIUserInterfaceSizeClass(x) to_enum_wrapper(x, UIUserInterfaceSizeClass)
#define is_value_UIUserInterfaceSizeClass(x) is_enum_wrapper(x, UIUserInterfaceSizeClass)

#define js_value_UIUserInterfaceStyle(x) js_enum_wrapper(x, UIUserInterfaceStyle)
#define to_value_UIUserInterfaceStyle(x) to_enum_wrapper(x, UIUserInterfaceStyle)
#define is_value_UIUserInterfaceStyle(x) is_enum_wrapper(x, UIUserInterfaceStyle)

#define js_value_UIUserInterfaceLayoutDirection(x) js_enum_wrapper(x, UIUserInterfaceLayoutDirection)
#define to_value_UIUserInterfaceLayoutDirection(x) to_enum_wrapper(x, UIUserInterfaceLayoutDirection)
#define is_value_UIUserInterfaceLayoutDirection(x) is_enum_wrapper(x, UIUserInterfaceLayoutDirection)

#define js_value_UITraitEnvironmentLayoutDirection(x) js_enum_wrapper(x, UITraitEnvironmentLayoutDirection)
#define to_value_UITraitEnvironmentLayoutDirection(x) to_enum_wrapper(x, UITraitEnvironmentLayoutDirection)
#define is_value_UITraitEnvironmentLayoutDirection(x) is_enum_wrapper(x, UITraitEnvironmentLayoutDirection)

#define js_value_UIDisplayGamut(x) js_enum_wrapper(x, UIDisplayGamut)
#define to_value_UIDisplayGamut(x) to_enum_wrapper(x, UIDisplayGamut)
#define is_value_UIDisplayGamut(x) is_enum_wrapper(x, UIDisplayGamut)

JS_WRAP_CLASS(UIView, UIResponder);
  JS_STATIC_METHOD(layerClass);
  JS_STATIC_METHOD(userInterfaceLayoutDirectionForSemanticContentAttribute);
  JS_STATIC_METHOD(userInterfaceLayoutDirectionForSemanticContentAttributeRelativeToLayoutDirection);
  JS_STATIC_METHOD(beginAnimationsContext);
  JS_STATIC_METHOD(commitAnimations);
  JS_STATIC_METHOD(setAnimationDelegate);
  JS_STATIC_METHOD(setAnimationWillStartSelector);
  JS_STATIC_METHOD(setAnimationDidStopSelector);
  JS_STATIC_METHOD(setAnimationDuration);
  JS_STATIC_METHOD(setAnimationDelay);
  JS_STATIC_METHOD(setAnimationStartDate);
  JS_STATIC_METHOD(setAnimationCurve);
  JS_STATIC_METHOD(setAnimationRepeatCount);
  JS_STATIC_METHOD(setAnimationRepeatAutoreverses);
  JS_STATIC_METHOD(setAnimationBeginsFromCurrentState);
  JS_STATIC_METHOD(setAnimationTransitionForViewCache);
  JS_STATIC_METHOD(setAnimationsEnabled);
  JS_STATIC_METHOD(areAnimationsEnabled);
  JS_STATIC_METHOD(performWithoutAnimation);
  JS_STATIC_METHOD(inheritedAnimationDuration);
  JS_STATIC_METHOD(animateWithDurationDelayOptionsAnimationsCompletion);
  JS_STATIC_METHOD(animateWithDurationAnimationsCompletion);
  JS_STATIC_METHOD(animateWithDurationAnimations);
  JS_STATIC_METHOD(animateWithDurationDelayUsingSpringWithDampingInitialSpringVelocityOptionsAnimationsCompletion);
  JS_STATIC_METHOD(transitionWithViewDurationOptionsAnimationsCompletion);
  JS_STATIC_METHOD(transitionFromViewToViewDurationOptionsCompletion);
  JS_STATIC_METHOD(performSystemAnimationOnViewsOptionsAnimationsCompletion);
  JS_STATIC_METHOD(animateKeyframesWithDurationDelayOptionsAnimationsCompletion);
  JS_STATIC_METHOD(addKeyframeWithRelativeStartTimeRelativeDurationAnimations);

  JS_PROP(origin);
  JS_PROP(size);
  JS_PROP(x);
  JS_PROP(y);
  JS_PROP(width);
  JS_PROP(height);
  JS_METHOD(hitTestWithEvent);
  JS_METHOD(pointInsideWithEvent);
  JS_METHOD(convertPointToView);
  JS_METHOD(convertPointFromView);
  JS_METHOD(convertRectToView);
  JS_METHOD(convertRectFromView);
  JS_METHOD(sizeThatFits);
  JS_METHOD(sizeToFit);
  JS_METHOD(removeFromSuperview);
  JS_METHOD(insertSubviewAtIndex);
  JS_METHOD(exchangeSubviewAtIndexWithSubviewAtIndex);
  JS_METHOD(addSubview);
  JS_METHOD(insertSubviewBelowSubview);
  JS_METHOD(insertSubviewAboveSubview);
  JS_METHOD(bringSubviewToFront);
  JS_METHOD(sendSubviewToBack);
  JS_METHOD(viewWithStringTag);
  JS_METHOD(isDescendantOfView);
  JS_METHOD(viewWithTag);
  JS_METHOD(setNeedsLayout);
  JS_METHOD(layoutIfNeeded);
  JS_METHOD(layoutSubviews);
  JS_METHOD(setNeedsDisplay);
  JS_METHOD(setNeedsDisplayInRect);
  JS_METHOD(addGestureRecognizer);
  JS_METHOD(removeGestureRecognizer);
    
  JS_METHOD(addMotionEffect);
  JS_METHOD(removeMotionEffect);
  JS_METHOD(addConstraint);
  JS_METHOD(addConstraints);
  JS_METHOD(removeConstraint);
  JS_METHOD(removeConstraints);
  JS_METHOD(updateConstraintsIfNeeded);
  JS_METHOD(updateConstraints);
  JS_METHOD(needsUpdateConstraints);
  JS_METHOD(setNeedsUpdateConstraints);
  JS_METHOD(alignmentRectForFrame);
  JS_METHOD(frameForAlignmentRect);
  JS_METHOD(viewForBaselineLayout);
  JS_METHOD(invalidateIntrinsicContentSize);
  JS_METHOD(contentHuggingPriorityForAxis);
  JS_METHOD(setContentHuggingPriorityForAxis);
  JS_METHOD(contentCompressionResistancePriorityForAxis);
  JS_METHOD(setContentCompressionResistancePriorityForAxis);
  JS_METHOD(systemLayoutSizeFittingSize);
  JS_METHOD(systemLayoutSizeFittingSizeWithHorizontalFittingPriorityVerticalFittingPriority);
  JS_METHOD(addLayoutGuide);
  JS_METHOD(removeLayoutGuide);
  JS_METHOD(constraintsAffectingLayoutForAxis);
  JS_METHOD(exerciseAmbiguityInLayout);
  JS_METHOD(snapshotViewAfterScreenUpdates);
  JS_METHOD(resizableSnapshotViewFromRectAfterScreenUpdatesWithCapInsets);
  JS_METHOD(drawViewHierarchyInRectAfterScreenUpdates);

  JS_PROP(viewDidAppear);
  JS_PROP(viewWillAppear);
  JS_PROP(viewDidDisappear);
  JS_PROP(viewWillDisappear);
//  JS_PROP(didAddSubview);
//  JS_PROP(willRemoveSubview);
//  JS_PROP(willMoveToSuperview);
//  JS_PROP(didMoveToSuperview);
//  JS_PROP(willMoveToWindow);
//  JS_PROP(didMoveToWindow);
  JS_PROP(drawRect);
  JS_PROP(layoutMarginsDidChange);
  JS_PROP(safeAreaInsetsDidChange);
  
  JS_PROP(userInteractionEnabled);
  JS_PROP(tag);
  JS_PROP_READONLY(layer);
  JS_PROP_READONLY(canBecomeFocused);
  JS_PROP_READONLY(focused);
  JS_PROP(semanticContentAttribute);
  JS_PROP_READONLY(effectiveUserInterfaceLayoutDirection);
  JS_PROP(frame);
  JS_PROP(bounds);
  JS_PROP(center);
  JS_PROP(transform);
  JS_PROP(contentScaleFactor);
  JS_PROP(multipleTouchEnabled);
  JS_PROP(exclusiveTouch);
  JS_PROP(autoresizesSubviews);
  JS_PROP(autoresizingMask);
  JS_PROP_READONLY(superview);
  JS_PROP_READONLY(subviews);
  JS_PROP_READONLY(window);
  JS_PROP(layoutMargins);
  JS_PROP(directionalLayoutMargins);
  JS_PROP(preservesSuperviewLayoutMargins);
  JS_PROP(insetsLayoutMarginsFromSafeArea);
  JS_PROP_READONLY(safeAreaInsets);
  JS_PROP_READONLY(layoutMarginsGuide);
  JS_PROP_READONLY(readableContentGuide);
  JS_PROP_READONLY(safeAreaLayoutGuide);
  JS_PROP(clipsToBounds);
  JS_PROP(backgroundColor);
  JS_PROP(alpha);
  JS_PROP(opaque);
  JS_PROP(clearsContextBeforeDrawing);
  JS_PROP(hidden);
  JS_PROP(contentMode);
  JS_PROP(contentStretch);
  JS_PROP(maskView);
  JS_PROP(tintColor);
  JS_PROP(tintAdjustmentMode);
  
  JS_PROP(gestureRecognizers);
  JS_PROP(motionEffects);
  JS_PROP_READONLY(constraints);
  JS_PROP(translatesAutoresizingMaskIntoConstraints);
  
  JS_PROP_READONLY(alignmentRectInsets);
  JS_PROP_READONLY(viewForFirstBaselineLayout);
  JS_PROP_READONLY(viewForLastBaselineLayout);
  JS_PROP_READONLY(intrinsicContentSize);
  JS_PROP_READONLY(layoutGuides);
  JS_PROP_READONLY(leadingAnchor);
  JS_PROP_READONLY(trailingAnchor);
  JS_PROP_READONLY(leftAnchor);
  JS_PROP_READONLY(rightAnchor);
  JS_PROP_READONLY(topAnchor);
  JS_PROP_READONLY(bottomAnchor);
  JS_PROP_READONLY(widthAnchor);
  JS_PROP_READONLY(heightAnchor);
  JS_PROP_READONLY(centerXAnchor);
  JS_PROP_READONLY(centerYAnchor);
  JS_PROP_READONLY(firstBaselineAnchor);
  JS_PROP_READONLY(lastBaselineAnchor);
  JS_PROP_READONLY(hasAmbiguousLayout);
  JS_PROP(restorationIdentifier);

  // static props
  JS_PROP_READONLY(areAnimationsEnabled);
  JS_PROP_READONLY(inheritedAnimationDuration);
  JS_PROP_READONLY(requiresConstraintBasedLayout);
  
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
