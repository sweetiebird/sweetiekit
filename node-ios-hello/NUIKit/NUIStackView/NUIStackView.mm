//
//  NUIStackView.mm
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStackView.h"

#define instancetype UIStackView
#define js_value_instancetype js_value_UIStackView

NUIStackView::NUIStackView() {}
NUIStackView::~NUIStackView() {}

JS_INIT_CLASS(UIStackView, UIView);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(addArrangedSubview);
  JS_ASSIGN_PROTO_METHOD(removeArrangedSubview);
  JS_ASSIGN_PROTO_METHOD(insertArrangedSubviewAtIndex);
  JS_ASSIGN_PROTO_METHOD(setCustomSpacingAfterView);
  JS_ASSIGN_PROTO_METHOD(customSpacingAfterView);
  JS_ASSIGN_PROTO_PROP_READONLY(arrangedSubviews);
  JS_ASSIGN_PROTO_PROP(axis);
  JS_ASSIGN_PROTO_PROP(distribution);
  JS_ASSIGN_PROTO_PROP(alignment);
  JS_ASSIGN_PROTO_PROP(spacing);
  JS_ASSIGN_PROTO_PROP(isBaselineRelativeArrangement);
  JS_ASSIGN_PROTO_PROP(isLayoutMarginsRelativeArrangement);
  // static members (ctor)
  JS_INIT_CTOR(UIStackView, UIView);
  JS_ASSIGN_STATIC_METHOD(initWithFrame);
  JS_ASSIGN_STATIC_METHOD(initWithCoder);
  JS_ASSIGN_STATIC_METHOD(initWithArrangedSubviews);
  // constants (exports)

/* Distribution—the layout along the stacking axis.
 
 All UIStackViewDistribution enum values fit first and last arranged subviews tightly to the container,
 and except for UIStackViewDistributionFillEqually, fit all items to intrinsicContentSize when possible.
 */
//typedef NS_ENUM(NSInteger, UIStackViewDistribution) {
    
    /* When items do not fit (overflow) or fill (underflow) the space available
     adjustments occur according to compressionResistance or hugging
     priorities of items, or when that is ambiguous, according to arrangement
     order.
     */
    JS_ASSIGN_ENUM(UIStackViewDistributionFill, NSInteger); //  = 0,
    
    /* Items are all the same size.
     When space allows, this will be the size of the item with the largest
     intrinsicContentSize (along the axis of the stack).
     Overflow or underflow adjustments are distributed equally among the items.
     */
    JS_ASSIGN_ENUM(UIStackViewDistributionFillEqually, NSInteger);
    
    /* Overflow or underflow adjustments are distributed among the items proportional
     to their intrinsicContentSizes.
     */
    JS_ASSIGN_ENUM(UIStackViewDistributionFillProportionally, NSInteger);
    
    /* Additional underflow spacing is divided equally in the spaces between the items.
     Overflow squeezing is controlled by compressionResistance priorities followed by
     arrangement order.
     */
    JS_ASSIGN_ENUM(UIStackViewDistributionEqualSpacing, NSInteger);
    
    /* Equal center-to-center spacing of the items is maintained as much
     as possible while still maintaining a minimum edge-to-edge spacing within the
     allowed area.
        Additional underflow spacing is divided equally in the spacing. Overflow 
     squeezing is distributed first according to compressionResistance priorities 
     of items, then according to subview order while maintaining the configured 
     (edge-to-edge) spacing as a minimum.
     */
    JS_ASSIGN_ENUM(UIStackViewDistributionEqualCentering, NSInteger);
//} NS_ENUM_AVAILABLE_IOS(9_0);

/* Alignment—the layout transverse to the stacking axis.
 */
//typedef NS_ENUM(NSInteger, UIStackViewAlignment) {
    /* Align the leading and trailing edges of vertically stacked items
     or the top and bottom edges of horizontally stacked items tightly to the container.
     */
    JS_ASSIGN_ENUM(UIStackViewAlignmentFill, NSInteger);
    
    /* Align the leading edges of vertically stacked items
     or the top edges of horizontally stacked items tightly to the relevant edge
     of the container
     */
    JS_ASSIGN_ENUM(UIStackViewAlignmentLeading, NSInteger);
    JS_ASSIGN_ENUM(UIStackViewAlignmentTop, NSInteger); //  = UIStackViewAlignmentLeading,
    JS_ASSIGN_ENUM(UIStackViewAlignmentFirstBaseline, NSInteger); // , // Valid for horizontal axis only
    
    /* Center the items in a vertical stack horizontally
     or the items in a horizontal stack vertically
     */
    JS_ASSIGN_ENUM(UIStackViewAlignmentCenter, NSInteger);
    
    /* Align the trailing edges of vertically stacked items
     or the bottom edges of horizontally stacked items tightly to the relevant
     edge of the container
     */
    JS_ASSIGN_ENUM(UIStackViewAlignmentTrailing, NSInteger);
    JS_ASSIGN_ENUM(UIStackViewAlignmentBottom, NSInteger); //  = UIStackViewAlignmentTrailing,
    JS_ASSIGN_ENUM(UIStackViewAlignmentLastBaseline, NSInteger); // , // Valid for horizontal axis only
//} NS_ENUM_AVAILABLE_IOS(9_0);

/* Used when setting custom spacing after an arranged subview to indicate reverting to 
 the value specified by the spacing property. 
 
 See -setCustomSpacing:afterView:, -customSpacingAfterView:
 */
//static const CGFloat UIStackViewSpacingUseDefault API_AVAILABLE(ios(11.0),tvos(11.0)) = FLT_MAX;
  JS_ASSIGN_ENUM(UIStackViewSpacingUseDefault, CGFloat);

/* Used when setting custom spacing after an arranged subview to request the system 
 spacing to the neighboring view. 
 
 Also used as a token for the spacing property to request system spacing between
 arranged subviews.
 
 See spacing, -setCustomSpacing:afterView:, -customSpacingAfterView:
 */
//static const CGFloat UIStackViewSpacingUseSystem API_AVAILABLE(ios(11.0),tvos(11.0)) = FLT_MIN;
  JS_ASSIGN_ENUM(UIStackViewSpacingUseSystem, CGFloat);

JS_INIT_CLASS_END(UIStackView, UIView);

#include "NNSCoder.h"

NAN_METHOD(NUIStackView::New) {
  JS_RECONSTRUCT(UIStackView);
  @autoreleasepool {
    UIStackView* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UIStackView *)(info[0].As<External>()->Value());
    } else if (is_value_NSCoder(info[0])) {
      self = [[UIStackView alloc] initWithCoder:to_value_NSCoder(info[0])];
    } else if (is_value_CGRect(info[0])) {
      self = [[UIStackView alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (is_value_NSArray(info[0])) {
      self = [[UIStackView alloc] initWithArrangedSubviews:to_value_NSArray<UIView*>(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIStackView alloc] init];
    }
    if (self) {
      NUIStackView *wrapper = new NUIStackView();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStackView::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUIStackView::initWithFrame) {
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, frame);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithFrame: frame]));
  }
}

NAN_METHOD(NUIStackView::initWithCoder) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSCoder, coder);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithCoder: coder]));
  }
}

NAN_METHOD(NUIStackView::initWithArrangedSubviews) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<UIView*>, views);
    JS_SET_RETURN(js_value_instancetype([[UIStackView alloc] initWithArrangedSubviews: views]));
  }
}

NAN_METHOD(NUIStackView::addArrangedSubview) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    [self addArrangedSubview: view];
  }
}

NAN_METHOD(NUIStackView::removeArrangedSubview) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    [self removeArrangedSubview: view];
  }
}

NAN_METHOD(NUIStackView::insertArrangedSubviewAtIndex) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, view);
    declare_value(NSUInteger, stackIndex);
    [self insertArrangedSubview: view atIndex: stackIndex];
  }
}

NAN_METHOD(NUIStackView::setCustomSpacingAfterView) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, spacing);
    declare_pointer(UIView, arrangedSubview);
    [self setCustomSpacing: spacing afterView: arrangedSubview];
  }
}

NAN_METHOD(NUIStackView::customSpacingAfterView) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIView, arrangedSubview);
    JS_SET_RETURN(js_value_CGFloat([self customSpacingAfterView: arrangedSubview]));
  }
}

NAN_GETTER(NUIStackView::arrangedSubviewsGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<UIView*>([self arrangedSubviews]));
  }
}

NAN_GETTER(NUIStackView::axisGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UILayoutConstraintAxis([self axis]));
  }
}

NAN_SETTER(NUIStackView::axisSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UILayoutConstraintAxis, input);
    [self setAxis: input];
  }
}

NAN_GETTER(NUIStackView::distributionGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStackViewDistribution([self distribution]));
  }
}

NAN_SETTER(NUIStackView::distributionSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIStackViewDistribution, input);
    [self setDistribution: input];
  }
}

NAN_GETTER(NUIStackView::alignmentGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIStackViewAlignment([self alignment]));
  }
}

NAN_SETTER(NUIStackView::alignmentSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UIStackViewAlignment, input);
    [self setAlignment: input];
  }
}

NAN_GETTER(NUIStackView::spacingGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self spacing]));
  }
}

NAN_SETTER(NUIStackView::spacingSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setSpacing: input];
  }
}

NAN_GETTER(NUIStackView::isBaselineRelativeArrangementGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isBaselineRelativeArrangement]));
  }
}

NAN_SETTER(NUIStackView::isBaselineRelativeArrangementSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setBaselineRelativeArrangement: input];
  }
}

NAN_GETTER(NUIStackView::isLayoutMarginsRelativeArrangementGetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isLayoutMarginsRelativeArrangement]));
  }
}

NAN_SETTER(NUIStackView::isLayoutMarginsRelativeArrangementSetter) {
  JS_UNWRAP(UIStackView, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLayoutMarginsRelativeArrangement: input];
  }
}

