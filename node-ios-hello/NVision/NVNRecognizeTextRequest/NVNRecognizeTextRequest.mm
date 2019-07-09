//
//  NVNRecognizeTextRequest.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NVNRecognizeTextRequest.h"

#import <Vision/VNRecognizeTextRequest.h>

#define instancetype VNRecognizeTextRequest
#define js_value_instancetype js_value_VNRecognizeTextRequest

NVNRecognizeTextRequest::NVNRecognizeTextRequest() {}
NVNRecognizeTextRequest::~NVNRecognizeTextRequest() {}

JS_INIT_CLASS(VNRecognizeTextRequest, VNImageBasedRequest);
  JS_ASSIGN_STATIC_METHOD(supportedRecognitionLanguagesForTextRecognitionLevelRevisionError);
  JS_ASSIGN_PROTO_PROP(recognitionLanguages);
  JS_ASSIGN_PROTO_PROP(customWords);
  JS_ASSIGN_PROTO_PROP(recognitionLevel);
  JS_ASSIGN_PROTO_PROP(usesLanguageCorrection);
  JS_ASSIGN_PROTO_PROP(minimumTextHeight);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(VNRecognizeTextRequest, VNImageBasedRequest);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, VNRequestTextRecognitionLevel) {
    JS_ASSIGN_ENUM(VNRequestTextRecognitionLevelAccurate, NSInteger); //  = 0,
    JS_ASSIGN_ENUM(VNRequestTextRecognitionLevelFast, NSInteger); // 
  //};

JS_INIT_CLASS_END(VNRecognizeTextRequest, VNImageBasedRequest);

NAN_METHOD(NVNRecognizeTextRequest::New) {
  JS_RECONSTRUCT(VNRecognizeTextRequest);
  @autoreleasepool {
    VNRecognizeTextRequest* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge VNRecognizeTextRequest *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[VNRecognizeTextRequest alloc] init];
    }
    if (self) {
      NVNRecognizeTextRequest *wrapper = new NVNRecognizeTextRequest();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("VNRecognizeTextRequest::New: invalid arguments");
    }
  }
}

NAN_METHOD(NVNRecognizeTextRequest::supportedRecognitionLanguagesForTextRecognitionLevelRevisionError) {
  declare_autoreleasepool {
    declare_args();
    declare_value(VNRequestTextRecognitionLevel, recognitionLevel);
    declare_value(NSUInteger, requestRevision);
    declare_error();
    JS_SET_RETURN(js_value_NSArray<NSString*>([VNRecognizeTextRequest supportedRecognitionLanguagesForTextRecognitionLevel: recognitionLevel revision: requestRevision error: &error]));
    js_panic_NSError(error);
  }
}

NAN_GETTER(NVNRecognizeTextRequest::recognitionLanguagesGetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self recognitionLanguages]));
  }
}

NAN_SETTER(NVNRecognizeTextRequest::recognitionLanguagesSetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSString*>, input);
    [self setRecognitionLanguages: input];
  }
}

NAN_GETTER(NVNRecognizeTextRequest::customWordsGetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSString*>([self customWords]));
  }
}

NAN_SETTER(NVNRecognizeTextRequest::customWordsSetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<NSString*>, input);
    [self setCustomWords: input];
  }
}

NAN_GETTER(NVNRecognizeTextRequest::recognitionLevelGetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_VNRequestTextRecognitionLevel([self recognitionLevel]));
  }
}

NAN_SETTER(NVNRecognizeTextRequest::recognitionLevelSetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(VNRequestTextRecognitionLevel, input);
    [self setRecognitionLevel: input];
  }
}

NAN_GETTER(NVNRecognizeTextRequest::usesLanguageCorrectionGetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self usesLanguageCorrection]));
  }
}

NAN_SETTER(NVNRecognizeTextRequest::usesLanguageCorrectionSetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setUsesLanguageCorrection: input];
  }
}

NAN_GETTER(NVNRecognizeTextRequest::minimumTextHeightGetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self minimumTextHeight]));
  }
}

NAN_SETTER(NVNRecognizeTextRequest::minimumTextHeightSetter) {
  JS_UNWRAP(VNRecognizeTextRequest, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setMinimumTextHeight: input];
  }
}
