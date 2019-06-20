//
//  NUIScrollView.h
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIScrollView_h
#define NUIScrollView_h

#include "NUIView.h"

#define js_value_UIScrollView(x) js_value_wrapper(x, UIScrollView)
#define to_value_UIScrollView(x) to_value_wrapper(x, UIScrollView)
#define is_value_UIScrollView(x) is_value_wrapper(x, UIScrollView)

#define js_value_UIScrollViewIndicatorStyle(x) JS_ENUM(UIScrollViewIndicatorStyle, NSInteger, x)
#define to_value_UIScrollViewIndicatorStyle(x) TO_ENUM(UIScrollViewIndicatorStyle, NSInteger, x)
#define is_value_UIScrollViewIndicatorStyle(x) IS_ENUM(UIScrollViewIndicatorStyle, NSInteger, x)

#define js_value_UIScrollViewKeyboardDismissMode(x) JS_ENUM(UIScrollViewKeyboardDismissMode, NSInteger, x)
#define to_value_UIScrollViewKeyboardDismissMode(x) TO_ENUM(UIScrollViewKeyboardDismissMode, NSInteger, x)
#define is_value_UIScrollViewKeyboardDismissMode(x) IS_ENUM(UIScrollViewKeyboardDismissMode, NSInteger, x)

#define js_value_UIScrollViewIndexDisplayMode(x) JS_ENUM(UIScrollViewIndexDisplayMode, NSInteger, x)
#define to_value_UIScrollViewIndexDisplayMode(x) TO_ENUM(UIScrollViewIndexDisplayMode, NSInteger, x)
#define is_value_UIScrollViewIndexDisplayMode(x) IS_ENUM(UIScrollViewIndexDisplayMode, NSInteger, x)

#define js_value_UIScrollViewContentInsetAdjustmentBehavior(x) JS_ENUM(UIScrollViewContentInsetAdjustmentBehavior, NSInteger, x)
#define to_value_UIScrollViewContentInsetAdjustmentBehavior(x) TO_ENUM(UIScrollViewContentInsetAdjustmentBehavior, NSInteger, x)
#define is_value_UIScrollViewContentInsetAdjustmentBehavior(x) IS_ENUM(UIScrollViewContentInsetAdjustmentBehavior, NSInteger, x)

#define js_value_UIScrollViewDecelerationRate(x) JS_ENUM(UIScrollViewDecelerationRate, CGFloat, x)
#define to_value_UIScrollViewDecelerationRate(x) TO_ENUM(UIScrollViewDecelerationRate, CGFloat, x)
#define is_value_UIScrollViewDecelerationRate(x) IS_ENUM(UIScrollViewDecelerationRate, CGFloat, x)

JS_WRAP_CLASS(UIScrollView, UIView);
  JS_METHOD(adjustedContentInsetDidChange);
  JS_METHOD(setContentOffsetAnimated);
  JS_METHOD(scrollRectToVisibleAnimated);
  JS_METHOD(flashScrollIndicators);
  JS_METHOD(touchesShouldBeginWithEventInContentView);
  JS_METHOD(touchesShouldCancelInContentView);
  JS_METHOD(setZoomScaleAnimated);
  JS_METHOD(zoomToRectAnimated);
  JS_PROP(contentOffset);
  JS_PROP(contentSize);
  JS_PROP(contentInset);
  JS_PROP_READONLY(adjustedContentInset);
  JS_PROP(contentInsetAdjustmentBehavior);
  JS_PROP_READONLY(contentLayoutGuide);
  JS_PROP_READONLY(frameLayoutGuide);
  JS_PROP(delegate);
  JS_PROP(isDirectionalLockEnabled);
  JS_PROP(bounces);
  JS_PROP(alwaysBounceVertical);
  JS_PROP(alwaysBounceHorizontal);
  JS_PROP(isPagingEnabled);
  JS_PROP(isScrollEnabled);
  JS_PROP(showsHorizontalScrollIndicator);
  JS_PROP(showsVerticalScrollIndicator);
  JS_PROP(scrollIndicatorInsets);
  JS_PROP(indicatorStyle);
  JS_PROP(decelerationRate);
  JS_PROP(indexDisplayMode);
  JS_PROP_READONLY(isTracking);
  JS_PROP_READONLY(isDragging);
  JS_PROP_READONLY(isDecelerating);
  JS_PROP(delaysContentTouches);
  JS_PROP(canCancelContentTouches);
  JS_PROP(minimumZoomScale);
  JS_PROP(maximumZoomScale);
  JS_PROP(zoomScale);
  JS_PROP(bouncesZoom);
  JS_PROP_READONLY(isZooming);
  JS_PROP_READONLY(isZoomBouncing);
  JS_PROP(scrollsToTop);
  JS_PROP_READONLY(panGestureRecognizer);
  JS_PROP_READONLY(pinchGestureRecognizer);
  JS_PROP_READONLY(directionalPressGestureRecognizer);
  JS_PROP(keyboardDismissMode);
  JS_PROP(refreshControl);
JS_WRAP_CLASS_END(UIScrollView);

#endif /* NUIScrollView_h */
