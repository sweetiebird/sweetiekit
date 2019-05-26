//
//  NUIKitGlobals.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-23.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIKitGlobals_h
#define NUIKitGlobals_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIKitGlobals : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIKitGlobals();
  virtual ~NUIKitGlobals();

  static NAN_METHOD(New);
  static NAN_METHOD(UIImageWriteToSavedPhotosAlbum);
  static NAN_METHOD(UIImageOrientation);
};

#endif /* NUIKitGlobals_h */
