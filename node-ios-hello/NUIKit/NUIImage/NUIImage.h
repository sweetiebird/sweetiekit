//
//  NUIImage.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImage_h
#define NUIImage_h

#include "NNSObject.h"

JS_WRAP_CLASS(UIImage, NSObject);
  JS_METHOD(toArrayBuffer);
  JS_METHOD(initWithCIImage);
JS_WRAP_CLASS_END(UIImage);

#endif /* NUIImage_h */
