//
//  NUIView.mm
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIView.h"

NUIView::NUIView() {}
NUIView::~NUIView() {}

JS_INIT_CLASS(UIView, UIResponder);
  // instance members (proto)
  JS_ASSIGN_PROTO_PROP(origin);
  JS_ASSIGN_PROTO_PROP(size);
  JS_ASSIGN_PROTO_PROP(x);
  JS_ASSIGN_PROTO_PROP(y);
  JS_ASSIGN_PROTO_PROP(width);
  JS_ASSIGN_PROTO_PROP(height);
  JS_SET_METHOD(proto, "hitTest", hitTestWithEvent);
  JS_ASSIGN_METHOD(proto, hitTestWithEvent);
  JS_SET_METHOD(proto, "pointInside", pointInsideWithEvent);
  JS_ASSIGN_METHOD(proto, pointInsideWithEvent);
  JS_ASSIGN_METHOD(proto, convertPointToView);
  JS_ASSIGN_METHOD(proto, convertPointFromView);
  JS_ASSIGN_METHOD(proto, convertRectToView);
  JS_ASSIGN_METHOD(proto, convertRectFromView);
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
  
  // static members (ctor)
  JS_INIT_CTOR(UIView, UIResponder);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), areAnimationsEnabled);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), inheritedAnimationDuration);
  JS_ASSIGN_PROP_READONLY(JS_OBJ(ctor), requiresConstraintBasedLayout);

  sweetiekit::Set(ctor, "beginAnimations", ^(JSInfo info) {
    [UIView beginAnimations:NJSStringToNSString(info[0]) context:nullptr];
  });
  sweetiekit::Set(ctor, "setAnimationDuration", ^(JSInfo info) {
    if (!info[0]->IsNumber()) {
      Nan::ThrowTypeError("setAnimationDuration: Expected a number");
    } else {
      [UIView setAnimationDuration:TO_DOUBLE(info[0])];
    }
  });
  sweetiekit::Set(ctor, "setAnimationBeginsFromCurrentState", ^(JSInfo info) {
    if (!info[0]->IsBoolean()) {
      Nan::ThrowTypeError("setAnimationBeginsFromCurrentState: Expected a boolean");
    } else {
      [UIView setAnimationBeginsFromCurrentState:TO_BOOL(info[0])];
    }
  });
  sweetiekit::Set(ctor, "commitAnimations", ^(JSInfo info) {
    [UIView commitAnimations];
  });
  sweetiekit::Set(ctor, "animate", ^(JSInfo info) {
    Isolate* isolate = info.GetIsolate();
    Nan::HandleScope handleScope;
    NSTimeInterval duration = info[0]->IsNumber() ? TO_DOUBLE(info[0]) : 0.0;
    NSTimeInterval delay = info[1]->IsNumber() ? TO_DOUBLE(info[1]) : 0.0;
    auto options = info[2]; // TODO
    __block sweetiekit::JSFunction animations(info[3]);
    __block sweetiekit::JSFunction completion(info[4]);
    
    @autoreleasepool {
      [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        Nan::HandleScope handleScope;
        animations("UIView:animateWithDuration:animations");
      } completion:^(BOOL finished) {
        Nan::HandleScope handleScope;
        completion("UIView:animateWithDuration:animations", JS_BOOL(finished));
      }];
    }
  });
JS_INIT_CLASS_END(UIView, UIResponder);

NAN_METHOD(NUIView::New) {
  JS_RECONSTRUCT(UIView);
  @autoreleasepool {
    UIView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIView *)(info[0].As<External>()->Value());
    } else if (info.Length() >= 4) {
      self = [[UIView alloc] initWithFrame:CGRectMake(TO_FLOAT(info[0]), TO_FLOAT(info[1]), TO_FLOAT(info[2]), TO_FLOAT(info[3]))];
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
    [self setBackgroundColor: to_value_UIColor(value)];
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
    [self setAlpha: to_value_CGFloat(value)];
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
    [self setOpaque: to_value_BOOL(value)];
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
    [self setHidden: to_value_BOOL(value)];
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
    [self setTintColor: to_value_UIColor(value)];
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
