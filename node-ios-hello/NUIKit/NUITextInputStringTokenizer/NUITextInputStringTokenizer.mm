//
//  NUITextInputStringTokenizer.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextInputStringTokenizer.h"

#define instancetype UITextInputStringTokenizer
#define js_value_instancetype js_value_UITextInputStringTokenizer

NUITextInputStringTokenizer::NUITextInputStringTokenizer() {}
NUITextInputStringTokenizer::~NUITextInputStringTokenizer() {}

JS_INIT_CLASS(UITextInputStringTokenizer, NSObject);
// UITextInputStringTokenizer
  JS_ASSIGN_PROTO_METHOD(rangeEnclosingPositionWithGranularityInDirection);
  JS_ASSIGN_PROTO_METHOD(isPositionAtBoundaryInDirection);
  JS_ASSIGN_PROTO_METHOD(positionFromPositionToBoundaryInDirection);
  JS_ASSIGN_PROTO_METHOD(isPositionWithinTextUnitInDirection);
// UITextInputStringTokenizer
  JS_ASSIGN_PROTO_METHOD(initWithTextInput);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextInputStringTokenizer, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextInputStringTokenizer, NSObject);

NAN_METHOD(NUITextInputStringTokenizer::New) {
  JS_RECONSTRUCT(UITextInputStringTokenizer);
  @autoreleasepool {
    UITextInputStringTokenizer* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextInputStringTokenizer *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextInputStringTokenizer alloc] init];
    }
    if (self) {
      NUITextInputStringTokenizer *wrapper = new NUITextInputStringTokenizer();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextInputStringTokenizer::New: invalid arguments");
    }
  }
}

#include "NUITextInput.h"
#include "NUITextPosition.h"
#include "NUITextRange.h"

NAN_METHOD(NUITextInputStringTokenizer::rangeEnclosingPositionWithGranularityInDirection) {
  JS_UNWRAP(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_UITextRange([self rangeEnclosingPosition: position withGranularity: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputStringTokenizer::isPositionAtBoundaryInDirection) {
  JS_UNWRAP(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_BOOL([self isPosition: position atBoundary: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputStringTokenizer::positionFromPositionToBoundaryInDirection) {
  JS_UNWRAP(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_UITextPosition([self positionFromPosition: position toBoundary: granularity inDirection: direction]));
  }
}

NAN_METHOD(NUITextInputStringTokenizer::isPositionWithinTextUnitInDirection) {
  JS_UNWRAP(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UITextPosition, position);
    declare_value(UITextGranularity, granularity);
    declare_value(UITextDirection, direction);
    JS_SET_RETURN(js_value_BOOL([self isPosition: position withinTextUnit: granularity inDirection: direction]));
  }
}

#include "NUIResponder.h"

NAN_METHOD(NUITextInputStringTokenizer::initWithTextInput) {
  JS_UNWRAP_OR_ALLOC(UITextInputStringTokenizer, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(UIResponder/* <UITextInput>*/, textInput);
    JS_SET_RETURN(js_value_instancetype([self initWithTextInput: textInput]));
  }
}
