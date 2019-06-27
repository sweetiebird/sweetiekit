//
//  NUISlider.mm
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUISlider.h"

#define instancetype UISlider
#define js_value_instancetype js_value_UISlider

NUISlider::NUISlider() {}
NUISlider::~NUISlider() {}

JS_INIT_CLASS(UISlider, UIControl);
  JS_ASSIGN_PROTO_METHOD(setValueAnimated);
  JS_ASSIGN_PROTO_METHOD(setThumbImageForState);
  JS_ASSIGN_PROTO_METHOD(setMinimumTrackImageForState);
  JS_ASSIGN_PROTO_METHOD(setMaximumTrackImageForState);
  JS_ASSIGN_PROTO_METHOD(thumbImageForState);
  JS_ASSIGN_PROTO_METHOD(minimumTrackImageForState);
  JS_ASSIGN_PROTO_METHOD(maximumTrackImageForState);
  JS_ASSIGN_PROTO_METHOD(minimumValueImageRectForBounds);
  JS_ASSIGN_PROTO_METHOD(maximumValueImageRectForBounds);
  JS_ASSIGN_PROTO_METHOD(trackRectForBounds);
  JS_ASSIGN_PROTO_METHOD(thumbRectForBoundsTrackRectValue);
  JS_ASSIGN_PROTO_PROP(value);
  JS_ASSIGN_PROTO_PROP(minimumValue);
  JS_ASSIGN_PROTO_PROP(maximumValue);
  JS_ASSIGN_PROTO_PROP(minimumValueImage);
  JS_ASSIGN_PROTO_PROP(maximumValueImage);
  JS_ASSIGN_PROTO_PROP(isContinuous);
  JS_ASSIGN_PROTO_PROP(minimumTrackTintColor);
  JS_ASSIGN_PROTO_PROP(maximumTrackTintColor);
  JS_ASSIGN_PROTO_PROP(thumbTintColor);
  JS_ASSIGN_PROTO_PROP_READONLY(currentThumbImage);
  JS_ASSIGN_PROTO_PROP_READONLY(currentMinimumTrackImage);
  JS_ASSIGN_PROTO_PROP_READONLY(currentMaximumTrackImage);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UISlider, UIControl);
JS_INIT_CLASS_END(UISlider, UIControl);

NAN_METHOD(NUISlider::New) {
  JS_RECONSTRUCT(UISlider);
  @autoreleasepool {
    UISlider* self = nullptr;
    
    if (info[0]->IsExternal()) {
      self = (__bridge UISlider *)(info[0].As<External>()->Value());
    } else if (is_value_CGRect(info[0])) {
      self = [[UISlider alloc] initWithFrame:to_value_CGRect(info[0])];
    } else if (info.Length() <= 0) {
      self = [[UISlider alloc] init];
    }
    if (self) {
      NUISlider *wrapper = new NUISlider();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UISlider::New: invalid arguments");
    }
  }
}

NAN_METHOD(NUISlider::setValueAnimated) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, value);
    declare_value(BOOL, animated);
    [self setValue: value animated: animated];
  }
}

#include "NUIImage.h"

NAN_METHOD(NUISlider::setThumbImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setThumbImage: image forState: state];
  }
}

NAN_METHOD(NUISlider::setMinimumTrackImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setMinimumTrackImage: image forState: state];
  }
}

NAN_METHOD(NUISlider::setMaximumTrackImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(UIImage, image);
    declare_value(UIControlState, state);
    [self setMaximumTrackImage: image forState: state];
  }
}

NAN_METHOD(NUISlider::thumbImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self thumbImageForState: state]));
  }
}

NAN_METHOD(NUISlider::minimumTrackImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self minimumTrackImageForState: state]));
  }
}

NAN_METHOD(NUISlider::maximumTrackImageForState) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(UIControlState, state);
    JS_SET_RETURN(js_value_UIImage([self maximumTrackImageForState: state]));
  }
}

NAN_METHOD(NUISlider::minimumValueImageRectForBounds) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self minimumValueImageRectForBounds: bounds]));
  }
}

NAN_METHOD(NUISlider::maximumValueImageRectForBounds) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self maximumValueImageRectForBounds: bounds]));
  }
}

NAN_METHOD(NUISlider::trackRectForBounds) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    JS_SET_RETURN(js_value_CGRect([self trackRectForBounds: bounds]));
  }
}

NAN_METHOD(NUISlider::thumbRectForBoundsTrackRectValue) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGRect, bounds);
    declare_value(CGRect, rect);
    declare_value(float, value);
    JS_SET_RETURN(js_value_CGRect([self thumbRectForBounds: bounds trackRect: rect value: value]));
  }
}

NAN_GETTER(NUISlider::valueGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self value]));
  }
}

NAN_SETTER(NUISlider::valueSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setValue: input];
  }
}

NAN_GETTER(NUISlider::minimumValueGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minimumValue]));
  }
}

NAN_SETTER(NUISlider::minimumValueSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMinimumValue: input];
  }
}

NAN_GETTER(NUISlider::maximumValueGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self maximumValue]));
  }
}

NAN_SETTER(NUISlider::maximumValueSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMaximumValue: input];
  }
}

NAN_GETTER(NUISlider::minimumValueImageGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self minimumValueImage]));
  }
}

NAN_SETTER(NUISlider::minimumValueImageSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setMinimumValueImage: input];
  }
}

NAN_GETTER(NUISlider::maximumValueImageGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self maximumValueImage]));
  }
}

NAN_SETTER(NUISlider::maximumValueImageSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIImage, input);
    [self setMaximumValueImage: input];
  }
}

NAN_GETTER(NUISlider::isContinuousGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isContinuous]));
  }
}

NAN_SETTER(NUISlider::isContinuousSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setContinuous: input];
  }
}

NAN_GETTER(NUISlider::minimumTrackTintColorGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self minimumTrackTintColor]));
  }
}

NAN_SETTER(NUISlider::minimumTrackTintColorSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setMinimumTrackTintColor: input];
  }
}

NAN_GETTER(NUISlider::maximumTrackTintColorGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self maximumTrackTintColor]));
  }
}

NAN_SETTER(NUISlider::maximumTrackTintColorSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setMaximumTrackTintColor: input];
  }
}

NAN_GETTER(NUISlider::thumbTintColorGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIColor([self thumbTintColor]));
  }
}

NAN_SETTER(NUISlider::thumbTintColorSetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(UIColor, input);
    [self setThumbTintColor: input];
  }
}

NAN_GETTER(NUISlider::currentThumbImageGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self currentThumbImage]));
  }
}

NAN_GETTER(NUISlider::currentMinimumTrackImageGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self currentMinimumTrackImage]));
  }
}

NAN_GETTER(NUISlider::currentMaximumTrackImageGetter) {
  JS_UNWRAP(UISlider, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIImage([self currentMaximumTrackImage]));
  }
}
