//
//  NUIScrollView.mm
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIScrollView.h"

NUIScrollView::NUIScrollView() {}
NUIScrollView::~NUIScrollView() {}

JS_INIT_CLASS(UIScrollView, UIView);
  JS_ASSIGN_PROTO_METHOD(adjustedContentInsetDidChange);
  JS_ASSIGN_PROTO_METHOD(setContentOffsetAnimated);
  JS_ASSIGN_PROTO_METHOD(scrollRectToVisibleAnimated);
  JS_ASSIGN_PROTO_METHOD(flashScrollIndicators);
  JS_ASSIGN_PROTO_METHOD(touchesShouldBeginWithEventInContentView);
  JS_ASSIGN_PROTO_METHOD(touchesShouldCancelInContentView);
  JS_ASSIGN_PROTO_METHOD(setZoomScaleAnimated);
  JS_ASSIGN_PROTO_METHOD(zoomToRectAnimated);
  JS_ASSIGN_PROTO_PROP(contentOffset);
  JS_ASSIGN_PROTO_PROP(contentSize);
  JS_ASSIGN_PROTO_PROP(contentInset);
  JS_ASSIGN_PROTO_PROP_READONLY(adjustedContentInset);
  JS_ASSIGN_PROTO_PROP(contentInsetAdjustmentBehavior);
  JS_ASSIGN_PROTO_PROP_READONLY(contentLayoutGuide);
  JS_ASSIGN_PROTO_PROP_READONLY(frameLayoutGuide);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP(isDirectionalLockEnabled);
  JS_ASSIGN_PROTO_PROP(bounces);
  JS_ASSIGN_PROTO_PROP(alwaysBounceVertical);
  JS_ASSIGN_PROTO_PROP(alwaysBounceHorizontal);
  JS_ASSIGN_PROTO_PROP(isPagingEnabled);
  JS_ASSIGN_PROTO_PROP(isScrollEnabled);
  JS_ASSIGN_PROTO_PROP(showsHorizontalScrollIndicator);
  JS_ASSIGN_PROTO_PROP(showsVerticalScrollIndicator);
  JS_ASSIGN_PROTO_PROP(scrollIndicatorInsets);
  JS_ASSIGN_PROTO_PROP(indicatorStyle);
  JS_ASSIGN_PROTO_PROP(decelerationRate);
  JS_ASSIGN_PROTO_PROP(indexDisplayMode);
  JS_ASSIGN_PROTO_PROP_READONLY(isTracking);
  JS_ASSIGN_PROTO_PROP_READONLY(isDragging);
  JS_ASSIGN_PROTO_PROP_READONLY(isDecelerating);
  JS_ASSIGN_PROTO_PROP(delaysContentTouches);
  JS_ASSIGN_PROTO_PROP(canCancelContentTouches);
  JS_ASSIGN_PROTO_PROP(minimumZoomScale);
  JS_ASSIGN_PROTO_PROP(maximumZoomScale);
  JS_ASSIGN_PROTO_PROP(zoomScale);
  JS_ASSIGN_PROTO_PROP(bouncesZoom);
  JS_ASSIGN_PROTO_PROP_READONLY(isZooming);
  JS_ASSIGN_PROTO_PROP_READONLY(isZoomBouncing);
  JS_ASSIGN_PROTO_PROP(scrollsToTop);
  JS_ASSIGN_PROTO_PROP_READONLY(panGestureRecognizer);
  JS_ASSIGN_PROTO_PROP_READONLY(pinchGestureRecognizer);
  JS_ASSIGN_PROTO_PROP_READONLY(directionalPressGestureRecognizer);
  JS_ASSIGN_PROTO_PROP(keyboardDismissMode);
  JS_ASSIGN_PROTO_PROP(refreshControl);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UIScrollView, UIView);
  // constants (exports)

  //typedef NS_ENUM(NSInteger, UIScrollViewIndicatorStyle) {
    JS_ASSIGN_ENUM(UIScrollViewIndicatorStyleDefault, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewIndicatorStyleBlack, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewIndicatorStyleWhite, NSInteger);
  //};

  //typedef NS_ENUM(NSInteger, UIScrollViewKeyboardDismissMode) {
    JS_ASSIGN_ENUM(UIScrollViewKeyboardDismissModeNone, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewKeyboardDismissModeOnDrag, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewKeyboardDismissModeInteractive, NSInteger);
  //} NS_ENUM_AVAILABLE_IOS(7_0);

  //typedef NS_ENUM(NSInteger, UIScrollViewIndexDisplayMode) {
    JS_ASSIGN_ENUM(UIScrollViewIndexDisplayModeAutomatic, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewIndexDisplayModeAlwaysHidden, NSInteger);
  //} API_AVAILABLE(tvos(10.2));

  //typedef NS_ENUM(NSInteger, UIScrollViewContentInsetAdjustmentBehavior) {
    JS_ASSIGN_ENUM(UIScrollViewContentInsetAdjustmentAutomatic, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewContentInsetAdjustmentScrollableAxes, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewContentInsetAdjustmentNever, NSInteger);
    JS_ASSIGN_ENUM(UIScrollViewContentInsetAdjustmentAlways, NSInteger);
  //} API_AVAILABLE(ios(11.0),tvos(11.0));

  //typedef CGFloat UIScrollViewDecelerationRate NS_TYPED_ENUM;

  JS_ASSIGN_ENUM(UIScrollViewDecelerationRateNormal, UIScrollViewDecelerationRate); // NS_AVAILABLE_IOS(3_0);
  JS_ASSIGN_ENUM(UIScrollViewDecelerationRateFast, UIScrollViewDecelerationRate); // NS_AVAILABLE_IOS(3_0);

JS_INIT_CLASS_END(UIScrollView, UIView);

NAN_METHOD(NUIScrollView::New) {
  JS_RECONSTRUCT(UIScrollView);
  @autoreleasepool {
    UIScrollView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIScrollView *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UIScrollView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIScrollView alloc] init];
    }
    if (self) {
      NUIScrollView *wrapper = new NUIScrollView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIScrollView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIScrollView::adjustedContentInsetDidChange) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    [self adjustedContentInsetDidChange];
  }
}

NAN_METHOD(NUIScrollView::setContentOffsetAnimated) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGPoint, contentOffset);
    declare_value(BOOL, animated);
    [self setContentOffset: contentOffset animated: animated];
  }
}

NAN_METHOD(NUIScrollView::scrollRectToVisibleAnimated) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(BOOL, animated);
    [self scrollRectToVisible: rect animated: animated];
  }
}

NAN_METHOD(NUIScrollView::flashScrollIndicators) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    [self flashScrollIndicators];
  }
}

#include "NUITouch.h"
#include "NUIEvent.h"

NAN_METHOD(NUIScrollView::touchesShouldBeginWithEventInContentView) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSSet/* <UITouch*>*/, touches);
    declare_nullable_pointer(UIEvent, event);
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_BOOL([self touchesShouldBegin: touches withEvent: event inContentView: view]));
  }
}

NAN_METHOD(NUIScrollView::touchesShouldCancelInContentView) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    JS_SET_RETURN(js_value_BOOL([self touchesShouldCancelInContentView: view]));
  }
}

NAN_METHOD(NUIScrollView::setZoomScaleAnimated) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, scale);
    declare_value(BOOL, animated);
    [self setZoomScale: scale animated: animated];
  }
}

NAN_METHOD(NUIScrollView::zoomToRectAnimated) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, rect);
    declare_value(BOOL, animated);
    [self zoomToRect: rect animated: animated];
  }
}

NAN_GETTER(NUIScrollView::contentOffsetGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGPoint([self contentOffset]));
  }
}

NAN_SETTER(NUIScrollView::contentOffsetSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGPoint, input);
    [self setContentOffset: input];
  }
}

NAN_GETTER(NUIScrollView::contentSizeGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGSize([self contentSize]));
  }
}

NAN_SETTER(NUIScrollView::contentSizeSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGSize, input);
    [self setContentSize: input];
  }
}

NAN_GETTER(NUIScrollView::contentInsetGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self contentInset]));
  }
}

NAN_SETTER(NUIScrollView::contentInsetSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setContentInset: input];
  }
}

NAN_GETTER(NUIScrollView::adjustedContentInsetGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self adjustedContentInset]));
  }
}

NAN_GETTER(NUIScrollView::contentInsetAdjustmentBehaviorGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewContentInsetAdjustmentBehavior([self contentInsetAdjustmentBehavior]));
  }
}

NAN_SETTER(NUIScrollView::contentInsetAdjustmentBehaviorSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScrollViewContentInsetAdjustmentBehavior, input);
    [self setContentInsetAdjustmentBehavior: input];
  }
}

#include "NUILayoutGuide.h"

NAN_GETTER(NUIScrollView::contentLayoutGuideGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILayoutGuide([self contentLayoutGuide]));
  }
}

NAN_GETTER(NUIScrollView::frameLayoutGuideGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILayoutGuide([self frameLayoutGuide]));
  }
}

#include "NUIScrollViewDelegate.h"

NAN_GETTER(NUIScrollView::delegateGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewDelegate([self delegate]));
  }
}

NAN_SETTER(NUIScrollView::delegateSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(UIScrollViewDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NUIScrollView::delegate"];
  }
}

NAN_GETTER(NUIScrollView::isDirectionalLockEnabledGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDirectionalLockEnabled]));
  }
}

NAN_SETTER(NUIScrollView::isDirectionalLockEnabledSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDirectionalLockEnabled: input];
  }
}

NAN_GETTER(NUIScrollView::bouncesGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self bounces]));
  }
}

NAN_SETTER(NUIScrollView::bouncesSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBounces: input];
  }
}

NAN_GETTER(NUIScrollView::alwaysBounceVerticalGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self alwaysBounceVertical]));
  }
}

NAN_SETTER(NUIScrollView::alwaysBounceVerticalSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAlwaysBounceVertical: input];
  }
}

NAN_GETTER(NUIScrollView::alwaysBounceHorizontalGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self alwaysBounceHorizontal]));
  }
}

NAN_SETTER(NUIScrollView::alwaysBounceHorizontalSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAlwaysBounceHorizontal: input];
  }
}

NAN_GETTER(NUIScrollView::isPagingEnabledGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPagingEnabled]));
  }
}

NAN_SETTER(NUIScrollView::isPagingEnabledSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPagingEnabled: input];
  }
}

NAN_GETTER(NUIScrollView::isScrollEnabledGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isScrollEnabled]));
  }
}

NAN_SETTER(NUIScrollView::isScrollEnabledSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setScrollEnabled: input];
  }
}

NAN_GETTER(NUIScrollView::showsHorizontalScrollIndicatorGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsHorizontalScrollIndicator]));
  }
}

NAN_SETTER(NUIScrollView::showsHorizontalScrollIndicatorSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsHorizontalScrollIndicator: input];
  }
}

NAN_GETTER(NUIScrollView::showsVerticalScrollIndicatorGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self showsVerticalScrollIndicator]));
  }
}

NAN_SETTER(NUIScrollView::showsVerticalScrollIndicatorSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShowsVerticalScrollIndicator: input];
  }
}

NAN_GETTER(NUIScrollView::scrollIndicatorInsetsGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIEdgeInsets([self scrollIndicatorInsets]));
  }
}

NAN_SETTER(NUIScrollView::scrollIndicatorInsetsSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIEdgeInsets, input);
    [self setScrollIndicatorInsets: input];
  }
}

NAN_GETTER(NUIScrollView::indicatorStyleGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewIndicatorStyle([self indicatorStyle]));
  }
}

NAN_SETTER(NUIScrollView::indicatorStyleSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScrollViewIndicatorStyle, input);
    [self setIndicatorStyle: input];
  }
}

NAN_GETTER(NUIScrollView::decelerationRateGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewDecelerationRate([self decelerationRate]));
  }
}

NAN_SETTER(NUIScrollView::decelerationRateSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScrollViewDecelerationRate, input);
    [self setDecelerationRate: input];
  }
}

NAN_GETTER(NUIScrollView::indexDisplayModeGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewIndexDisplayMode([self indexDisplayMode]));
  }
}

NAN_SETTER(NUIScrollView::indexDisplayModeSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScrollViewIndexDisplayMode, input);
    [self setIndexDisplayMode: input];
  }
}

NAN_GETTER(NUIScrollView::isTrackingGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isTracking]));
  }
}

NAN_GETTER(NUIScrollView::isDraggingGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDragging]));
  }
}

NAN_GETTER(NUIScrollView::isDeceleratingGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isDecelerating]));
  }
}

NAN_GETTER(NUIScrollView::delaysContentTouchesGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self delaysContentTouches]));
  }
}

NAN_SETTER(NUIScrollView::delaysContentTouchesSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setDelaysContentTouches: input];
  }
}

NAN_GETTER(NUIScrollView::canCancelContentTouchesGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self canCancelContentTouches]));
  }
}

NAN_SETTER(NUIScrollView::canCancelContentTouchesSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCanCancelContentTouches: input];
  }
}

NAN_GETTER(NUIScrollView::minimumZoomScaleGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self minimumZoomScale]));
  }
}

NAN_SETTER(NUIScrollView::minimumZoomScaleSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMinimumZoomScale: input];
  }
}

NAN_GETTER(NUIScrollView::maximumZoomScaleGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self maximumZoomScale]));
  }
}

NAN_SETTER(NUIScrollView::maximumZoomScaleSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setMaximumZoomScale: input];
  }
}

NAN_GETTER(NUIScrollView::zoomScaleGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self zoomScale]));
  }
}

NAN_SETTER(NUIScrollView::zoomScaleSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setZoomScale: input];
  }
}

NAN_GETTER(NUIScrollView::bouncesZoomGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self bouncesZoom]));
  }
}

NAN_SETTER(NUIScrollView::bouncesZoomSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBouncesZoom: input];
  }
}

NAN_GETTER(NUIScrollView::isZoomingGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isZooming]));
  }
}

NAN_GETTER(NUIScrollView::isZoomBouncingGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isZoomBouncing]));
  }
}

NAN_GETTER(NUIScrollView::scrollsToTopGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self scrollsToTop]));
  }
}

NAN_SETTER(NUIScrollView::scrollsToTopSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setScrollsToTop: input];
  }
}

#include "NUITapGestureRecognizer.h"

NAN_GETTER(NUIScrollView::panGestureRecognizerGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPanGestureRecognizer([self panGestureRecognizer]));
  }
}

NAN_GETTER(NUIScrollView::pinchGestureRecognizerGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIPinchGestureRecognizer([self pinchGestureRecognizer]));
  }
}

NAN_GETTER(NUIScrollView::directionalPressGestureRecognizerGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIGestureRecognizer([self directionalPressGestureRecognizer]));
  }
}

NAN_GETTER(NUIScrollView::keyboardDismissModeGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIScrollViewKeyboardDismissMode([self keyboardDismissMode]));
  }
}

NAN_SETTER(NUIScrollView::keyboardDismissModeSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIScrollViewKeyboardDismissMode, input);
    [self setKeyboardDismissMode: input];
  }
}

#include "NUIRefreshControl.h"

NAN_GETTER(NUIScrollView::refreshControlGetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIRefreshControl([self refreshControl]));
  }
}

NAN_SETTER(NUIScrollView::refreshControlSetter) {
  JS_UNWRAP(UIScrollView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIRefreshControl, input);
    [self setRefreshControl: input];
  }
}
