//
//  NVNRecognizedText.h
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NVNRecognizedText_h
#define NVNRecognizedText_h    

#include "NNSObject.h"

#define js_value_VNRecognizedText(x) js_value_wrapper(x, VNRecognizedText)
#define to_value_VNRecognizedText(x) to_value_wrapper(x, VNRecognizedText)
#define is_value_VNRecognizedText(x) is_value_wrapper(x, VNRecognizedText)

JS_WRAP_CLASS(VNRecognizedText, NSObject);
  JS_METHOD(boundingBoxForRangeError);
  JS_PROP_READONLY(string);
  JS_PROP_READONLY(confidence);
JS_WRAP_CLASS_END(VNRecognizedText);

#endif /* NVNRecognizedText_h */
