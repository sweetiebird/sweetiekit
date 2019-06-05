//
//  NAVAudioPlayer.h
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioPlayer_h
#define NAVAudioPlayer_h

#include "NNSObject.h"

#define js_value_AVAudioPlayer(x) js_value_wrapper(x, AVAudioPlayer)
#define to_value_AVAudioPlayer(x) to_value_wrapper(x, AVAudioPlayer)
#define is_value_AVAudioPlayer(x) is_value_wrapper(x, AVAudioPlayer)

JS_WRAP_CLASS(AVAudioPlayer, NSObject);
  JS_METHOD(play);
JS_WRAP_CLASS_END(AVAudioPlayer);

#endif /* NAVAudioPlayer_h */
