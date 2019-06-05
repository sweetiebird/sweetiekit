//
//  NCIImage.h
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIImage_h
#define NCIImage_h    

#include "NNSObject.h"

#define js_value_CIImage(x) js_value_wrapper(x, CIImage)
#define to_value_CIImage(x) to_value_wrapper(x, CIImage)
#define is_value_CIImage(x) is_value_wrapper(x, CIImage)

JS_WRAP_CLASS(CIImage, NSObject);
  JS_METHOD(imageByApplyingTransform);
  JS_METHOD(initWithImage);
JS_WRAP_CLASS_END(CIImage);

#endif /* NCIImage_h */
