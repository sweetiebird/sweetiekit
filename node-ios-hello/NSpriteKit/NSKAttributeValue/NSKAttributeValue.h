//
//  NSKAttributeValue.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAttributeValue_h
#define NSKAttributeValue_h    

#include "NNSObject.h"

#define js_value_SKAttributeValue(x) js_value_wrapper(x, SKAttributeValue)
#define to_value_SKAttributeValue(x) to_value_wrapper(x, SKAttributeValue)
#define is_value_SKAttributeValue(x) is_value_wrapper(x, SKAttributeValue)


JS_WRAP_CLASS(SKAttributeValue, NSObject);
  JS_STATIC_METHOD(valueWithFloat);
  JS_STATIC_METHOD(valueWithVectorFloat2);
  JS_STATIC_METHOD(valueWithVectorFloat3);
  JS_STATIC_METHOD(valueWithVectorFloat4);
  JS_PROP(floatValue);
  JS_PROP(vectorFloat2Value);
  JS_PROP(vectorFloat3Value);
  JS_PROP(vectorFloat4Value);
JS_WRAP_CLASS_END(SKAttributeValue);

#endif /* NSKAttributeValue_h */
