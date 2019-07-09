//
//  NVNRecognizeTextRequest.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRecognizeTextRequest_h
#define NVNRecognizeTextRequest_h    

#include "NVNImageBasedRequest.h"

#define js_value_VNRequestTextRecognitionLevel(x) JS_ENUM(VNRequestTextRecognitionLevel, NSInteger, x)
#define to_value_VNRequestTextRecognitionLevel(x) TO_ENUM(VNRequestTextRecognitionLevel, NSInteger, x)
#define is_value_VNRequestTextRecognitionLevel(x) IS_ENUM(VNRequestTextRecognitionLevel, NSInteger, x)

#define js_value_VNRecognizeTextRequest(x) js_value_wrapper(x, VNRecognizeTextRequest)
#define to_value_VNRecognizeTextRequest(x) to_value_wrapper(x, VNRecognizeTextRequest)
#define is_value_VNRecognizeTextRequest(x) is_value_wrapper(x, VNRecognizeTextRequest)

JS_WRAP_CLASS(VNRecognizeTextRequest, VNImageBasedRequest);
  JS_STATIC_METHOD(supportedRecognitionLanguagesForTextRecognitionLevelRevisionError);
  JS_PROP(recognitionLanguages);
  JS_PROP(customWords);
  JS_PROP(recognitionLevel);
  JS_PROP(usesLanguageCorrection);
  JS_PROP(minimumTextHeight);
JS_WRAP_CLASS_END(VNRecognizeTextRequest);

#endif /* NVNRecognizeTextRequest_h */
