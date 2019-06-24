//
//  NAVPortraitEffectsMatte.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVPortraitEffectsMatte_h
#define NAVPortraitEffectsMatte_h    

#include "NNSObject.h"

#define js_value_AVPortraitEffectsMatte(x) js_value_wrapper(x, AVPortraitEffectsMatte)
#define to_value_AVPortraitEffectsMatte(x) to_value_wrapper(x, AVPortraitEffectsMatte)
#define is_value_AVPortraitEffectsMatte(x) is_value_wrapper(x, AVPortraitEffectsMatte)

JS_WRAP_CLASS(AVPortraitEffectsMatte, NSObject);
  JS_STATIC_METHOD(portraitEffectsMatteFromDictionaryRepresentationError);
  JS_METHOD(portraitEffectsMatteByApplyingExifOrientation);
  JS_METHOD(portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBufferError);
  JS_METHOD(dictionaryRepresentationForAuxiliaryDataType);
  JS_PROP_READONLY(pixelFormatType);
  JS_PROP_READONLY(mattingImage);
JS_WRAP_CLASS_END(AVPortraitEffectsMatte);

#endif /* NAVPortraitEffectsMatte_h */
