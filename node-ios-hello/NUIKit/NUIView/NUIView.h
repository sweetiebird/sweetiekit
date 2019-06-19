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

#define js_value_UIViewAnimationCurve(x) JS_ENUM(UIViewAnimationCurve, NSInteger, x)
#define to_value_UIViewAnimationCurve(x) TO_ENUM(UIViewAnimationCurve, NSInteger, x)
#define is_value_UIViewAnimationCurve(x) IS_ENUM(UIViewAnimationCurve, NSInteger, x)

#define js_value_UIViewContentMode(x) JS_ENUM(UIViewContentMode, NSInteger, x)
#define to_value_UIViewContentMode(x) TO_ENUM(UIViewContentMode, NSInteger, x)
#define is_value_UIViewContentMode(x) IS_ENUM(UIViewContentMode, NSInteger, x)

#define js_value_UIViewAnimationTransition(x) JS_ENUM(UIViewAnimationTransition, NSInteger, x)
#define to_value_UIViewAnimationTransition(x) TO_ENUM(UIViewAnimationTransition, NSInteger, x)
#define is_value_UIViewAnimationTransition(x) IS_ENUM(UIViewAnimationTransition, NSInteger, x)

#define js_value_UIViewAutoresizing(x) JS_OPTS(UIViewAutoresizing, NSUInteger, x)
#define to_value_UIViewAutoresizing(x) TO_OPTS(UIViewAutoresizing, NSUInteger, x)
#define is_value_UIViewAutoresizing(x) IS_OPTS(UIViewAutoresizing, NSUInteger, x)

#define js_value_UIViewAnimationOptions(x) JS_OPTS(UIViewAnimationOptions, NSUInteger, x)
#define to_value_UIViewAnimationOptions(x) TO_OPTS(UIViewAnimationOptions, NSUInteger, x)
#define is_value_UIViewAnimationOptions(x) IS_OPTS(UIViewAnimationOptions, NSUInteger, x)

#define js_value_UIViewKeyframeAnimationOptions(x) JS_OPTS(UIViewKeyframeAnimationOptions, NSUInteger, x)
#define to_value_UIViewKeyframeAnimationOptions(x) TO_OPTS(UIViewKeyframeAnimationOptions, NSUInteger, x)
#define is_value_UIViewKeyframeAnimationOptions(x) IS_OPTS(UIViewKeyframeAnimationOptions, NSUInteger, x)
    
#define js_value_UISystemAnimation(x) JS_OPTS(UISystemAnimation, NSUInteger, x)
#define to_value_UISystemAnimation(x) TO_OPTS(UISystemAnimation, NSUInteger, x)
#define is_value_UISystemAnimation(x) IS_OPTS(UISystemAnimation, NSUInteger, x)

#define js_value_UIViewTintAdjustmentMode(x) JS_ENUM(UIViewTintAdjustmentMode, NSInteger, x)
#define to_value_UIViewTintAdjustmentMode(x) TO_ENUM(UIViewTintAdjustmentMode, NSInteger, x)
#define is_value_UIViewTintAdjustmentMode(x) IS_ENUM(UIViewTintAdjustmentMode, NSInteger, x)

#define js_value_UISemanticContentAttribute(x) JS_ENUM(UISemanticContentAttribute, NSInteger, x)
#define to_value_UISemanticContentAttribute(x) TO_ENUM(UISemanticContentAttribute, NSInteger, x)
#define is_value_UISemanticContentAttribute(x) IS_ENUM(UISemanticContentAttribute, NSInteger, x)

#define js_value_UILayoutConstraintAxis(x) JS_ENUM(UILayoutConstraintAxis, NSInteger, x)
#define to_value_UILayoutConstraintAxis(x) TO_ENUM(UILayoutConstraintAxis, NSInteger, x)
#define is_value_UILayoutConstraintAxis(x) IS_ENUM(UILayoutConstraintAxis, NSInteger, x)

// UIInterface.h constants

#define js_value_UIBarStyle(x) JS_ENUM(UIBarStyle, NSInteger, x)
#define to_value_UIBarStyle(x) TO_ENUM(UIBarStyle, NSInteger, x)
#define is_value_UIBarStyle(x) IS_ENUM(UIBarStyle, NSInteger, x)

#define js_value_UIUserInterfaceSizeClass(x) JS_ENUM(UIUserInterfaceSizeClass, NSInteger, x)
#define to_value_UIUserInterfaceSizeClass(x) TO_ENUM(UIUserInterfaceSizeClass, NSInteger, x)
#define is_value_UIUserInterfaceSizeClass(x) IS_ENUM(UIUserInterfaceSizeClass, NSInteger, x)

#define js_value_UIUserInterfaceStyle(x) JS_ENUM(UIUserInterfaceStyle, NSInteger, x)
#define to_value_UIUserInterfaceStyle(x) TO_ENUM(UIUserInterfaceStyle, NSInteger, x)
#define is_value_UIUserInterfaceStyle(x) IS_ENUM(UIUserInterfaceStyle, NSInteger, x)

#define js_value_UIUserInterfaceLayoutDirection(x) JS_ENUM(UIUserInterfaceLayoutDirection, NSInteger, x)
#define to_value_UIUserInterfaceLayoutDirection(x) TO_ENUM(UIUserInterfaceLayoutDirection, NSInteger, x)
#define is_value_UIUserInterfaceLayoutDirection(x) IS_ENUM(UIUserInterfaceLayoutDirection, NSInteger, x)

#define js_value_UITraitEnvironmentLayoutDirection(x) JS_ENUM(UITraitEnvironmentLayoutDirection, NSInteger, x)
#define to_value_UITraitEnvironmentLayoutDirection(x) TO_ENUM(UITraitEnvironmentLayoutDirection, NSInteger, x)
#define is_value_UITraitEnvironmentLayoutDirection(x) IS_ENUM(UITraitEnvironmentLayoutDirection, NSInteger, x)

#define js_value_UIDisplayGamut(x) JS_ENUM(UIDisplayGamut, NSInteger, x)
#define to_value_UIDisplayGamut(x) TO_ENUM(UIDisplayGamut, NSInteger, x)
#define is_value_UIDisplayGamut(x) IS_ENUM(UIDisplayGamut, NSInteger, x)

// UIGeometry.h constants

#define js_value_UIRectEdge(x) JS_ENUM(UIRectEdge, NSUInteger, x)
#define to_value_UIRectEdge(x) TO_ENUM(UIRectEdge, NSUInteger, x)
#define is_value_UIRectEdge(x) IS_ENUM(UIRectEdge, NSUInteger, x)

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
  JS_METHOD(initWithFrame);
  JS_METHOD(initWithCoder);


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
  JS_PROP(viewWillLayoutSubviews);
  JS_PROP(viewDidLayoutSubviews);
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
  
  JS_METHOD(pinToSuperview);
  JS_METHOD(pinToSuperviewWithEdges);
  JS_METHOD(pinToSuperviewWithInsets);
  JS_METHOD(pinToSuperviewWithInsetsEdges);
  
JS_WRAP_CLASS_END(UIView);

#endif /* NUIView_h */
