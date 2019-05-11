//
//  NAVAudioPlayer.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioPlayer_h
#define NAVAudioPlayer_h

#import <AVFoundation/AVFoundation.h>
#include "defines.h"
#include "NNSObject.h"
#import "node_ios_hello-Swift.h"

using namespace v8;
using namespace node;

class NAVAudioPlayer : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NAVAudioPlayer();
  virtual ~NAVAudioPlayer();

  static NAN_METHOD(New);
  static NAN_METHOD(Play);
};

#endif /* NAVAudioPlayer_h */
