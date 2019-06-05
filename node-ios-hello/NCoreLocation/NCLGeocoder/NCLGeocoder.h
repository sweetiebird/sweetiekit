//
//  NCLGeocoder.h
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCLGeocoder_h
#define NCLGeocoder_h    

#include "NNSObject.h"

#define js_value_CLGeocoder(x) js_value_wrapper(x, CLGeocoder)
#define to_value_CLGeocoder(x) to_value_wrapper(x, CLGeocoder)
#define is_value_CLGeocoder(x) is_value_wrapper(x, CLGeocoder)

JS_WRAP_CLASS(CLGeocoder, NSObject);
  JS_METHOD(geocodeAddressString);
JS_WRAP_CLASS_END(CLGeocoder);

#endif /* NCLGeocoder_h */
