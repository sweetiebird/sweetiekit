//
//  NMTLAttribute.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMTLAttribute_h
#define NMTLAttribute_h    

#include "NNSObject.h"

#define js_value_MTLAttribute(x) js_value_wrapper(x, MTLAttribute)
#define to_value_MTLAttribute(x) to_value_wrapper(x, MTLAttribute)
#define is_value_MTLAttribute(x) is_value_wrapper(x, MTLAttribute)

JS_WRAP_CLASS(MTLAttribute, NSObject);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(attributeIndex);
  JS_PROP_READONLY(attributeType);
  JS_PROP_READONLY(isActive);
  JS_PROP_READONLY(isPatchData);
  JS_PROP_READONLY(isPatchControlPointData);
JS_WRAP_CLASS_END(MTLAttribute);

#endif /* NMTLAttribute_h */
