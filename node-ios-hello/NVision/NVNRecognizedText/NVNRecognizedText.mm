//
//  NVNRecognizedText.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRecognizedText.h"

#import <Vision/VNObservation.h>

#define instancetype VNRecognizedText
#define js_value_instancetype js_value_VNRecognizedText

NVNRecognizedText::NVNRecognizedText() {}
NVNRecognizedText::~NVNRecognizedText() {}

JS_INIT_CLASS(VNRecognizedText, NSObject);
  JS_ASSIGN_PROTO_METHOD(boundingBoxForRangeError);
  JS_ASSIGN_PROTO_PROP_READONLY(string);
  JS_ASSIGN_PROTO_PROP_READONLY(confidence);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRecognizedText, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(VNRecognizedText, NSObject);

NAN_METHOD(NVNRecognizedText::New) {
  JS_RECONSTRUCT(VNRecognizedText);
  @autoreleasepool {
    VNRecognizedText* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRecognizedText *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRecognizedText alloc] init];
    }
    if (self) {
      NVNRecognizedText *wrapper = new NVNRecognizedText();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRecognizedText::New: invalid arguments");
    }
  }
}

#include "NVNRectangleObservation.h"

NAN_METHOD(NVNRecognizedText::boundingBoxForRangeError) {
  JS_UNWRAP(VNRecognizedText, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSRange, range);
    declare_error();
    JS_SET_RETURN(js_value_VNRectangleObservation([self boundingBoxForRange: range error: &error]));
    js_panic_NSError(error);
  }
}

NAN_GETTER(NVNRecognizedText::stringGetter) {
  JS_UNWRAP(VNRecognizedText, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self string]));
  }
}

#include "NVNTypes.h"

NAN_GETTER(NVNRecognizedText::confidenceGetter) {
  JS_UNWRAP(VNRecognizedText, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNConfidence([self confidence]));
  }
}
