//
//  NCNPostalAddress.h
//
//  Created by Shawn Presser on 6/18/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCNPostalAddress_h
#define NCNPostalAddress_h    

#include "NNSObject.h"

#define js_value_CNPostalAddress(x) js_value_wrapper(x, CNPostalAddress)
#define to_value_CNPostalAddress(x) to_value_wrapper(x, CNPostalAddress)
#define is_value_CNPostalAddress(x) is_value_wrapper(x, CNPostalAddress)

JS_WRAP_CLASS(CNPostalAddress, NSObject);
  JS_STATIC_METHOD(localizedStringForKey);
  JS_PROP_READONLY(street);
  JS_PROP_READONLY(subLocality);
  JS_PROP_READONLY(city);
  JS_PROP_READONLY(subAdministrativeArea);
  JS_PROP_READONLY(state);
  JS_PROP_READONLY(postalCode);
  JS_PROP_READONLY(country);
  JS_PROP_READONLY(ISOCountryCode);
JS_WRAP_CLASS_END(CNPostalAddress);

#endif /* NCNPostalAddress_h */
