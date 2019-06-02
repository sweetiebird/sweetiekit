//
//  NSKTexture.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKTexture_h
#define NSKTexture_h

#import "NNSObject.h"

#define js_value_SKTexture(x) js_value_wrapper(x, SKTexture)
#define to_value_SKTexture(x) to_value_wrapper(x, SKTexture)
#define is_value_SKTexture(x) is_value_wrapper(x, SKTexture)

JS_WRAP_CLASS(SKTexture, NSObject);
  JS_METHOD(textureWithImage);
  JS_PROP(size);
  JS_PROP(textureRect);
JS_WRAP_CLASS_END(SKTexture);

#endif /* NSKTexture_h */
