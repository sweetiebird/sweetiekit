//
//  NAVPortraitEffectsMatte.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVPortraitEffectsMatte.h"

#define instancetype AVPortraitEffectsMatte
#define js_value_instancetype js_value_AVPortraitEffectsMatte

NAVPortraitEffectsMatte::NAVPortraitEffectsMatte() {}
NAVPortraitEffectsMatte::~NAVPortraitEffectsMatte() {}

JS_INIT_CLASS(AVPortraitEffectsMatte, NSObject);
  JS_ASSIGN_STATIC_METHOD(portraitEffectsMatteFromDictionaryRepresentationError);
  JS_ASSIGN_PROTO_METHOD(portraitEffectsMatteByApplyingExifOrientation);
  JS_ASSIGN_PROTO_METHOD(portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBufferError);
  JS_ASSIGN_PROTO_METHOD(dictionaryRepresentationForAuxiliaryDataType);
  JS_ASSIGN_PROTO_PROP_READONLY(pixelFormatType);
  JS_ASSIGN_PROTO_PROP_READONLY(mattingImage);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVPortraitEffectsMatte, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(AVPortraitEffectsMatte, NSObject);

NAN_METHOD(NAVPortraitEffectsMatte::New) {
  JS_RECONSTRUCT(AVPortraitEffectsMatte);
  @autoreleasepool {
    AVPortraitEffectsMatte* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVPortraitEffectsMatte *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVPortraitEffectsMatte *wrapper = new NAVPortraitEffectsMatte();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVPortraitEffectsMatte::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVPortraitEffectsMatte::portraitEffectsMatteFromDictionaryRepresentationError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary, imageSourceAuxDataInfoDictionary);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([AVPortraitEffectsMatte portraitEffectsMatteFromDictionaryRepresentation: imageSourceAuxDataInfoDictionary error: &error]));
    js_panic_NSError(error);
  }
}

#include "NCIImage.h" // for CGImagePropertyOrientation

NAN_METHOD(NAVPortraitEffectsMatte::portraitEffectsMatteByApplyingExifOrientation) {
  JS_UNWRAP(AVPortraitEffectsMatte, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGImagePropertyOrientation, exifOrientation);
    JS_SET_RETURN(js_value_instancetype([self portraitEffectsMatteByApplyingExifOrientation: exifOrientation]));
  }
}

NAN_METHOD(NAVPortraitEffectsMatte::portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBufferError) {
  JS_UNWRAP(AVPortraitEffectsMatte, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CVPixelBufferRef, pixelBuffer);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([self portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer: pixelBuffer error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVPortraitEffectsMatte::dictionaryRepresentationForAuxiliaryDataType) {
  JS_UNWRAP(AVPortraitEffectsMatte, self);
  declare_autoreleasepool {
    declare_args();
    NSString* auxDataType = nil;
    JS_SET_RETURN(js_value_NSDictionary([self dictionaryRepresentationForAuxiliaryDataType: &auxDataType]));
    if (info[JS_ARGC]->IsObject()) {
      JS_OBJ(info[JS_ARGC])->Set(JS_STR("value"), js_value_NSString(auxDataType));
    }
  }
}

#include "NAUAudioUnit.h" // for OSType

NAN_GETTER(NAVPortraitEffectsMatte::pixelFormatTypeGetter) {
  JS_UNWRAP(AVPortraitEffectsMatte, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_OSType([self pixelFormatType]));
  }
}

NAN_GETTER(NAVPortraitEffectsMatte::mattingImageGetter) {
  JS_UNWRAP(AVPortraitEffectsMatte, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CVPixelBufferRef([self mattingImage]));
  }
}
