//
//  NUISegmentedControl.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISegmentedControl.h"

#define instancetype UISegmentedControl
#define js_value_instancetype js_value_UISegmentedControl

NUISegmentedControl::NUISegmentedControl() {}
NUISegmentedControl::~NUISegmentedControl() {}

JS_INIT_CLASS(UISegmentedControl, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(initWithItems);
  JS_ASSIGN_PROTO_METHOD(insertSegmentWithTitleAtIndexAnimated);
  JS_ASSIGN_PROTO_METHOD(insertSegmentWithImageAtIndexAnimated);
  JS_ASSIGN_PROTO_METHOD(removeSegmentAtIndexAnimated);
  JS_ASSIGN_PROTO_METHOD(removeAllSegments);
  JS_ASSIGN_PROTO_METHOD(setTitleForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(titleForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(setImageForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(imageForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(setWidthForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(widthForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(setContentOffsetForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(contentOffsetForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(setEnabledForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(isEnabledForSegmentAtIndex);
  JS_ASSIGN_PROTO_METHOD(setBackgroundImageForStateBarMetrics);
  JS_ASSIGN_PROTO_METHOD(backgroundImageForStateBarMetrics);
  JS_ASSIGN_PROTO_METHOD(setDividerImageForLeftSegmentStateRightSegmentStateBarMetrics);
  JS_ASSIGN_PROTO_METHOD(dividerImageForLeftSegmentStateRightSegmentStateBarMetrics);
  JS_ASSIGN_PROTO_METHOD(setTitleTextAttributesForState);
  JS_ASSIGN_PROTO_METHOD(titleTextAttributesForState);
  JS_ASSIGN_PROTO_METHOD(setContentPositionAdjustmentForSegmentTypeBarMetrics);
  JS_ASSIGN_PROTO_METHOD(contentPositionAdjustmentForSegmentTypeBarMetrics);
  JS_ASSIGN_PROTO_PROP(segmentedControlStyle);
  JS_ASSIGN_PROTO_PROP(isMomentary);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfSegments);
  JS_ASSIGN_PROTO_PROP(apportionsSegmentWidthsByContent);
  JS_ASSIGN_PROTO_PROP(selectedSegmentIndex);
  JS_ASSIGN_PROTO_PROP(tintColor);
  // static members (ctor)
  JS_INIT_CTOR(UISegmentedControl, UIControl);
  // constant values (exports)

//typedef NS_ENUM(NSInteger, UISegmentedControlStyle) {
  JS_ASSIGN_ENUM(UISegmentedControlStylePlain, NSInteger);     
  JS_ASSIGN_ENUM(UISegmentedControlStyleBordered, NSInteger);  
  JS_ASSIGN_ENUM(UISegmentedControlStyleBar, NSInteger);       
  JS_ASSIGN_ENUM(UISegmentedControlStyleBezeled, NSInteger);   
//} NS_DEPRECATED_IOS(2_0, 7_0, "The segmentedControlStyle property no longer has any effect") __TVOS_PROHIBITED;

//enum {
  JS_ASSIGN_ENUM(UISegmentedControlNoSegment, NSInteger); // = -1   
//};

//typedef NS_ENUM(NSInteger, UISegmentedControlSegment) {
  JS_ASSIGN_ENUM(UISegmentedControlSegmentAny, NSInteger); // = 0,
  JS_ASSIGN_ENUM(UISegmentedControlSegmentLeft, NSInteger); // = 1,   
  JS_ASSIGN_ENUM(UISegmentedControlSegmentCenter, NSInteger); // = 2, 
  JS_ASSIGN_ENUM(UISegmentedControlSegmentRight, NSInteger); // = 3,  
  JS_ASSIGN_ENUM(UISegmentedControlSegmentAlone, NSInteger); // = 4,  
//};

JS_INIT_CLASS_END(UISegmentedControl, UIControl);

NAN_METHOD(NUISegmentedControl::New) {
  JS_RECONSTRUCT(UISegmentedControl);
  @autoreleasepool {
    UISegmentedControl* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UISegmentedControl *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      self = [[UISegmentedControl alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UISegmentedControl alloc] init];
    }
    if (self) {
      NUISegmentedControl *wrapper = new NUISegmentedControl();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISegmentedControl::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUISegmentedControl::initWithItems) {
  JS_UNWRAP_OR_ALLOC(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSArray, items);
    JS_SET_RETURN(js_value_instancetype([self initWithItems: items]));
  }
}

NAN_METHOD(NUISegmentedControl::insertSegmentWithTitleAtIndexAnimated) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_value(NSUInteger, segment);
    declare_value(BOOL, animated);
    [self insertSegmentWithTitle: title atIndex: segment animated: animated];
  }
}

#include "NUIImage.h"

NAN_METHOD(NUISegmentedControl::insertSegmentWithImageAtIndexAnimated) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(NSUInteger, segment);
    declare_value(BOOL, animated);
    [self insertSegmentWithImage: image atIndex: segment animated: animated];
  }
}

NAN_METHOD(NUISegmentedControl::removeSegmentAtIndexAnimated) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    declare_value(BOOL, animated);
    [self removeSegmentAtIndex: segment animated: animated];
  }
}

NAN_METHOD(NUISegmentedControl::removeAllSegments) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    [self removeAllSegments];
  }
}

NAN_METHOD(NUISegmentedControl::setTitleForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSString, title);
    declare_value(NSUInteger, segment);
    [self setTitle: title forSegmentAtIndex: segment];
  }
}

NAN_METHOD(NUISegmentedControl::titleForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    JS_SET_RETURN(js_value_NSString([self titleForSegmentAtIndex: segment]));
  }
}

NAN_METHOD(NUISegmentedControl::setImageForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(NSUInteger, segment);
    [self setImage: image forSegmentAtIndex: segment];
  }
}

NAN_METHOD(NUISegmentedControl::imageForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    JS_SET_RETURN(js_value_UIImage([self imageForSegmentAtIndex: segment]));
  }
}

NAN_METHOD(NUISegmentedControl::setWidthForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGFloat, width);
    declare_value(NSUInteger, segment);
    [self setWidth: width forSegmentAtIndex: segment];
  }
}

NAN_METHOD(NUISegmentedControl::widthForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    JS_SET_RETURN(js_value_CGFloat([self widthForSegmentAtIndex: segment]));
  }
}

NAN_METHOD(NUISegmentedControl::setContentOffsetForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGSize, offset);
    declare_value(NSUInteger, segment);
    [self setContentOffset: offset forSegmentAtIndex: segment];
  }
}

NAN_METHOD(NUISegmentedControl::contentOffsetForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    JS_SET_RETURN(js_value_CGSize([self contentOffsetForSegmentAtIndex: segment]));
  }
}

NAN_METHOD(NUISegmentedControl::setEnabledForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, enabled);
    declare_value(NSUInteger, segment);
    [self setEnabled: enabled forSegmentAtIndex: segment];
  }
}

NAN_METHOD(NUISegmentedControl::isEnabledForSegmentAtIndex) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, segment);
    JS_SET_RETURN(js_value_BOOL([self isEnabledForSegmentAtIndex: segment]));
  }
}

#include "NUIBarCommon.h"

NAN_METHOD(NUISegmentedControl::setBackgroundImageForStateBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, backgroundImage);
    declare_value(UIControlState, state);
    declare_value(UIBarMetrics, barMetrics);
    [self setBackgroundImage: backgroundImage forState: state barMetrics: barMetrics];
  }
}

NAN_METHOD(NUISegmentedControl::backgroundImageForStateBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_UIImage([self backgroundImageForState: state barMetrics: barMetrics]));
  }
}

NAN_METHOD(NUISegmentedControl::setDividerImageForLeftSegmentStateRightSegmentStateBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, dividerImage);
    declare_value(UIControlState, leftState);
    declare_value(UIControlState, rightState);
    declare_value(UIBarMetrics, barMetrics);
    [self setDividerImage: dividerImage forLeftSegmentState: leftState rightSegmentState: rightState barMetrics: barMetrics];
  }
}

NAN_METHOD(NUISegmentedControl::dividerImageForLeftSegmentStateRightSegmentStateBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, leftState);
    declare_value(UIControlState, rightState);
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_UIImage([self dividerImageForLeftSegmentState: leftState rightSegmentState: rightState barMetrics: barMetrics]));
  }
}

NAN_METHOD(NUISegmentedControl::setTitleTextAttributesForState) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(NSDictionary/* <NSAttributedStringKey, id>*/, attributes);
    declare_value(UIControlState, state);
    [self setTitleTextAttributes: attributes forState: state];
  }
}

NAN_METHOD(NUISegmentedControl::titleTextAttributesForState) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_NSDictionary/* <NSAttributedStringKey, id>*/([self titleTextAttributesForState: state]));
  }
}

NAN_METHOD(NUISegmentedControl::setContentPositionAdjustmentForSegmentTypeBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIOffset, adjustment);
    declare_value(UISegmentedControlSegment, leftCenterRightOrAlone);
    declare_value(UIBarMetrics, barMetrics);
    [self setContentPositionAdjustment: adjustment forSegmentType: leftCenterRightOrAlone barMetrics: barMetrics];
  }
}

NAN_METHOD(NUISegmentedControl::contentPositionAdjustmentForSegmentTypeBarMetrics) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UISegmentedControlSegment, leftCenterRightOrAlone);
    declare_value(UIBarMetrics, barMetrics);
    JS_SET_RETURN(js_value_UIOffset([self contentPositionAdjustmentForSegmentType: leftCenterRightOrAlone barMetrics: barMetrics]));
  }
}

NAN_GETTER(NUISegmentedControl::segmentedControlStyleGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UISegmentedControlStyle([self segmentedControlStyle]));
  }
}

NAN_SETTER(NUISegmentedControl::segmentedControlStyleSetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(UISegmentedControlStyle, input);
    [self setSegmentedControlStyle: input];
  }
}

NAN_GETTER(NUISegmentedControl::isMomentaryGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMomentary]));
  }
}

NAN_SETTER(NUISegmentedControl::isMomentarySetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMomentary: input];
  }
}

NAN_GETTER(NUISegmentedControl::numberOfSegmentsGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfSegments]));
  }
}

NAN_GETTER(NUISegmentedControl::apportionsSegmentWidthsByContentGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self apportionsSegmentWidthsByContent]));
  }
}

NAN_SETTER(NUISegmentedControl::apportionsSegmentWidthsByContentSetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setApportionsSegmentWidthsByContent: input];
  }
}

NAN_GETTER(NUISegmentedControl::selectedSegmentIndexGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self selectedSegmentIndex]));
  }
}

NAN_SETTER(NUISegmentedControl::selectedSegmentIndexSetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setSelectedSegmentIndex: input];
  }
}

NAN_GETTER(NUISegmentedControl::tintColorGetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUISegmentedControl::tintColorSetter) {
  JS_UNWRAP(UISegmentedControl, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}
