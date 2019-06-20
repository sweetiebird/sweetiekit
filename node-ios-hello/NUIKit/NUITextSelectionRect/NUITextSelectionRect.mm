//
//  NUITextSelectionRect.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NUITextSelectionRect.h"

#define instancetype UITextSelectionRect
#define js_value_instancetype js_value_UITextSelectionRect

NUITextSelectionRect::NUITextSelectionRect() {}
NUITextSelectionRect::~NUITextSelectionRect() {}

JS_INIT_CLASS(UITextSelectionRect, NSObject);
// UITextSelectionRect
  JS_ASSIGN_PROTO_PROP_READONLY(rect);
  JS_ASSIGN_PROTO_PROP_READONLY(writingDirection);
  JS_ASSIGN_PROTO_PROP_READONLY(containsStart);
  JS_ASSIGN_PROTO_PROP_READONLY(containsEnd);
  JS_ASSIGN_PROTO_PROP_READONLY(isVertical);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(UITextSelectionRect, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(UITextSelectionRect, NSObject);

NAN_METHOD(NUITextSelectionRect::New) {
  JS_RECONSTRUCT(UITextSelectionRect);
  @autoreleasepool {
    UITextSelectionRect* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge UITextSelectionRect *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[UITextSelectionRect alloc] init];
    }
    if (self) {
      NUITextSelectionRect *wrapper = new NUITextSelectionRect();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("UITextSelectionRect::New: invalid arguments");
    }
  }
}

NAN_GETTER(NUITextSelectionRect::rectGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self rect]));
  }
}

#include "NUITextInput.h"

NAN_GETTER(NUITextSelectionRect::writingDirectionGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UITextWritingDirection([self writingDirection]));
  }
}

NAN_GETTER(NUITextSelectionRect::containsStartGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self containsStart]));
  }
}

NAN_GETTER(NUITextSelectionRect::containsEndGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self containsEnd]));
  }
}

NAN_GETTER(NUITextSelectionRect::isVerticalGetter) {
  JS_UNWRAP(UITextSelectionRect, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isVertical]));
  }
}
