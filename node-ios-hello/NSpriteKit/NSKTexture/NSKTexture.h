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

#define js_value_SKTexture(x) js_value_wrapper_known(x, SKTexture)
#define to_value_SKTexture(x) to_value_wrapper(x, SKTexture)

class NSKTexture : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKTexture();
  virtual ~NSKTexture();

  static NAN_METHOD(New);
  static NAN_METHOD(textureWithImage);
  JS_PROP(size);
  JS_PROP(textureRect);
};

#endif /* NSKTexture_h */
