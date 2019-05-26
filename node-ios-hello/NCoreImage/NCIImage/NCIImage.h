//
//  NCIImage.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NCIImage_h
#define NCIImage_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NCIImage : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NCIImage();
  virtual ~NCIImage();

  static NAN_METHOD(New);
  static NAN_METHOD(initWithCVPixelBuffer);
  static NAN_METHOD(imageByApplyingTransform);
  static NAN_METHOD(initWithImage);
};

#endif /* NCIImage_h */
