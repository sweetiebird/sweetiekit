//
//  NMKClusterAnnotation.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMKClusterAnnotation_h
#define NMKClusterAnnotation_h    

#include "NNSObject.h"

#define js_value_MKClusterAnnotation(x) js_value_wrapper(x, MKClusterAnnotation)
#define to_value_MKClusterAnnotation(x) to_value_wrapper(x, MKClusterAnnotation)
#define is_value_MKClusterAnnotation(x) is_value_wrapper(x, MKClusterAnnotation)

JS_WRAP_CLASS(MKClusterAnnotation, NSObject);
  JS_METHOD(initWithMemberAnnotations);
  JS_PROP(title);
  JS_PROP(subtitle);
  JS_PROP_READONLY(memberAnnotations);
JS_WRAP_CLASS_END(MKClusterAnnotation);

#endif /* NMKClusterAnnotation_h */
