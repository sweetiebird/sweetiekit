//
//  NSKAttribute.h
//
//  Created by Shawn Presser on 6/27/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKAttribute_h
#define NSKAttribute_h    

#include "NNSObject.h"

#define js_value_SKAttribute(x) js_value_wrapper(x, SKAttribute)
#define to_value_SKAttribute(x) to_value_wrapper(x, SKAttribute)
#define is_value_SKAttribute(x) is_value_wrapper(x, SKAttribute)

#define js_value_SKAttributeType(x) JS_ENUM(SKAttributeType, NSInteger, x)
#define to_value_SKAttributeType(x) TO_ENUM(SKAttributeType, NSInteger, x)
#define is_value_SKAttributeType(x) IS_ENUM(SKAttributeType, NSInteger, x)

JS_WRAP_CLASS(SKAttribute, NSObject);
  JS_STATIC_METHOD(attributeWithNameType);
  JS_METHOD(initWithNameType);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(type);
JS_WRAP_CLASS_END(SKAttribute);

#endif /* NSKAttribute_h */
