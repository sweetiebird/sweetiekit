//
//  NUIImage.h
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImage_h
#define NUIImage_h

#include "NNSObject.h"

#define js_value_UIImage(x) js_value_wrapper(x, UIImage)
#define to_value_UIImage(x) to_value_wrapper(x, UIImage)
#define is_value_UIImage(x) is_value_wrapper(x, UIImage)

JS_WRAP_CLASS(UIImage, NSObject);
  JS_METHOD(toArrayBuffer);
  JS_METHOD(initWithCIImage);
JS_WRAP_CLASS_END(UIImage);

#endif /* NUIImage_h */
