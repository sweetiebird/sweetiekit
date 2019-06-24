//
//  NSCNAudioPlayer.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNAudioPlayer_h
#define NSCNAudioPlayer_h    

#include "NNSObject.h"

#define js_value_SCNAudioPlayer(x) js_value_wrapper(x, SCNAudioPlayer)
#define to_value_SCNAudioPlayer(x) to_value_wrapper(x, SCNAudioPlayer)
#define is_value_SCNAudioPlayer(x) is_value_wrapper(x, SCNAudioPlayer)

JS_WRAP_CLASS(SCNAudioPlayer, NSObject);
  // TODO: declare SCNAudioPlayer methods and properties
JS_WRAP_CLASS_END(SCNAudioPlayer);

#endif /* NSCNAudioPlayer_h */