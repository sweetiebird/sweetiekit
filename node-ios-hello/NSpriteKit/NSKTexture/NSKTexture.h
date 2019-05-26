//
//  NSKTexture.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/12/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKTexture_h
#define NSKTexture_h

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSKTexture : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKTexture();
  virtual ~NSKTexture();

  static NAN_METHOD(New);
  static NAN_METHOD(textureWithImage);
};

#endif /* NSKTexture_h */
