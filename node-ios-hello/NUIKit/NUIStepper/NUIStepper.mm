//
//  NUIStepper.mm
//
//  Created by Shawn Presser on 6/17/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUIStepper.h"

#define instancetype UIStepper
#define js_value_instancetype js_value_UIStepper

NUIStepper::NUIStepper() {}
NUIStepper::~NUIStepper() {}

JS_INIT_CLASS(UIStepper, UIControl);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(setBackgroundImageForState);
  JS_ASSIGN_PROTO_METHOD(backgroundImageForState);
  JS_ASSIGN_PROTO_METHOD(setDividerImageForLeftSegmentStateRightSegmentState);
  JS_ASSIGN_PROTO_METHOD(dividerImageForLeftSegmentStateRightSegmentState);
  JS_ASSIGN_PROTO_METHOD(setIncrementImageForState);
  JS_ASSIGN_PROTO_METHOD(incrementImageForState);
  JS_ASSIGN_PROTO_METHOD(setDecrementImageForState);
  JS_ASSIGN_PROTO_METHOD(decrementImageForState);
  JS_ASSIGN_PROTO_PROP(isContinuous);
  JS_ASSIGN_PROTO_PROP(autorepeat);
  JS_ASSIGN_PROTO_PROP(wraps);
  JS_ASSIGN_PROTO_PROP(value);
  JS_ASSIGN_PROTO_PROP(minimumValue);
  JS_ASSIGN_PROTO_PROP(maximumValue);
  JS_ASSIGN_PROTO_PROP(stepValue);
  JS_ASSIGN_PROTO_PROP(tintColor);

  // static members (ctor)
  JS_INIT_CTOR(UIStepper, UIControl);
  // constant values (exports)
JS_INIT_CLASS_END(UIStepper, UIControl);

NAN_METHOD(NUIStepper::New) {
  JS_RECONSTRUCT(UIStepper);
  @autoreleasepool {
    UIStepper* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UIStepper *)(info[0].As<External>()->Value());
    } else if (info.Length() > 0 && is_value_CGRect(info[0])) {
      self = [[UIStepper alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UIStepper alloc] init];
    }
    if (self) {
      NUIStepper *wrapper = new NUIStepper();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UIStepper::New: invalid arguments");
    }
  }
}

#include "NUIImage.h"

NAN_METHOD(NUIStepper::setBackgroundImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setBackgroundImage: image forState: state];
  }
}

NAN_METHOD(NUIStepper::backgroundImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self backgroundImageForState: state]));
  }
}

NAN_METHOD(NUIStepper::setDividerImageForLeftSegmentStateRightSegmentState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, leftState);
    declare_value(UIControlState, rightState);
    [self setDividerImage: image forLeftSegmentState: leftState rightSegmentState: rightState];
  }
}

NAN_METHOD(NUIStepper::dividerImageForLeftSegmentStateRightSegmentState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, leftState);
    declare_value(UIControlState, rightState);
    JS_SET_RETURN(js_value_UIImage([self dividerImageForLeftSegmentState: leftState rightSegmentState: rightState]));
  }
}

NAN_METHOD(NUIStepper::setIncrementImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setIncrementImage: image forState: state];
  }
}

NAN_METHOD(NUIStepper::incrementImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self incrementImageForState: state]));
  }
}

NAN_METHOD(NUIStepper::setDecrementImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setDecrementImage: image forState: state];
  }
}

NAN_METHOD(NUIStepper::decrementImageForState) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self decrementImageForState: state]));
  }
}

NAN_GETTER(NUIStepper::isContinuousGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isContinuous]));
  }
}

NAN_SETTER(NUIStepper::isContinuousSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setContinuous: input];
  }
}

NAN_GETTER(NUIStepper::autorepeatGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self autorepeat]));
  }
}

NAN_SETTER(NUIStepper::autorepeatSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setAutorepeat: input];
  }
}

NAN_GETTER(NUIStepper::wrapsGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self wraps]));
  }
}

NAN_SETTER(NUIStepper::wrapsSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setWraps: input];
  }
}

NAN_GETTER(NUIStepper::valueGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self value]));
  }
}

NAN_SETTER(NUIStepper::valueSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setValue: input];
  }
}

NAN_GETTER(NUIStepper::minimumValueGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self minimumValue]));
  }
}

NAN_SETTER(NUIStepper::minimumValueSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setMinimumValue: input];
  }
}

NAN_GETTER(NUIStepper::maximumValueGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self maximumValue]));
  }
}

NAN_SETTER(NUIStepper::maximumValueSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setMaximumValue: input];
  }
}

NAN_GETTER(NUIStepper::stepValueGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self stepValue]));
  }
}

NAN_SETTER(NUIStepper::stepValueSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(double, input);
    [self setStepValue: input];
  }
}

NAN_GETTER(NUIStepper::tintColorGetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self tintColor]));
  }
}

NAN_SETTER(NUIStepper::tintColorSetter) {
  JS_UNWRAP(UIStepper, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setTintColor: input];
  }
}

