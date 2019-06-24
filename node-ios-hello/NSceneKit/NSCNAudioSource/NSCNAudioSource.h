//
//  NSCNAudioSource.h
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNAudioSource_h
#define NSCNAudioSource_h    

#include "NNSObject.h"

#define js_value_SCNAudioSource(x) js_value_wrapper(x, SCNAudioSource)
#define to_value_SCNAudioSource(x) to_value_wrapper(x, SCNAudioSource)
#define is_value_SCNAudioSource(x) is_value_wrapper(x, SCNAudioSource)

JS_WRAP_CLASS(SCNAudioSource, NSObject);
  JS_STATIC_METHOD(audioSourceNamed);
  JS_METHOD(initWithFileNamed);
  JS_METHOD(initWithURL);
  JS_METHOD(load);
  JS_PROP(isPositional);
  JS_PROP(volume);
  JS_PROP(rate);
  JS_PROP(reverbBlend);
  JS_PROP(loops);
  JS_PROP(shouldStream);
JS_WRAP_CLASS_END(SCNAudioSource);

// SCNNode (SCNAudioSupport)
JS_EXTEND_CLASS(SCNNode, SCNAudioSupport);
  JS_METHOD(addAudioPlayer);
  JS_METHOD(removeAllAudioPlayers);
  JS_METHOD(removeAudioPlayer);
  JS_PROP_READONLY(audioPlayers);
JS_EXTEND_CLASS_END(SCNNode, SCNAudioSupport);

#endif /* NSCNAudioSource_h */
