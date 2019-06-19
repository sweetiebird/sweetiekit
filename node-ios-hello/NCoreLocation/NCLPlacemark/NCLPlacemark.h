//
//  NCLPlacemark.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLPlacemark_h
#define NCLPlacemark_h    

#include "NNSObject.h"

#define js_value_CLPlacemark(x) js_value_wrapper(x, CLPlacemark)
#define to_value_CLPlacemark(x) to_value_wrapper(x, CLPlacemark)
#define is_value_CLPlacemark(x) is_value_wrapper(x, CLPlacemark)

JS_WRAP_CLASS(CLPlacemark, NSObject);
  JS_METHOD(initWithPlacemark);
  JS_PROP_READONLY(location);
  JS_PROP_READONLY(region);
  JS_PROP_READONLY(timeZone);
  JS_PROP_READONLY(name);
  JS_PROP_READONLY(thoroughfare);
  JS_PROP_READONLY(subThoroughfare);
  JS_PROP_READONLY(locality);
  JS_PROP_READONLY(subLocality);
  JS_PROP_READONLY(administrativeArea);
  JS_PROP_READONLY(subAdministrativeArea);
  JS_PROP_READONLY(postalCode);
  JS_PROP_READONLY(ISOcountryCode);
  JS_PROP_READONLY(country);
  JS_PROP_READONLY(inlandWater);
  JS_PROP_READONLY(ocean);
  JS_PROP_READONLY(areasOfInterest);
  JS_PROP_READONLY(postalAddress);
JS_WRAP_CLASS_END(CLPlacemark);

#endif /* NCLPlacemark_h */
