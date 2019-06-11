//
//  NAVAudioPlayerNode.h
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NAVAudioPlayerNode_h
#define NAVAudioPlayerNode_h    

#include "NAVAudioNode.h"

#define js_value_AVAudioPlayerNode(x) js_value_wrapper(x, AVAudioPlayerNode)
#define to_value_AVAudioPlayerNode(x) to_value_wrapper(x, AVAudioPlayerNode)
#define is_value_AVAudioPlayerNode(x) is_value_wrapper(x, AVAudioPlayerNode)

// AVFoundation constants
#define js_value_AVAudioPlayerNodeCompletionCallbackType(x) JS_ENUM(AVAudioPlayerNodeCompletionCallbackType, NSInteger, x)
#define to_value_AVAudioPlayerNodeCompletionCallbackType(x) TO_ENUM(AVAudioPlayerNodeCompletionCallbackType, NSInteger, x)
#define is_value_AVAudioPlayerNodeCompletionCallbackType(x) IS_ENUM(AVAudioPlayerNodeCompletionCallbackType, NSInteger, x)

#define js_value_AVAudioPlayerNodeBufferOptions(x) JS_OPTS(AVAudioPlayerNodeBufferOptions, NSUInteger, x)
#define to_value_AVAudioPlayerNodeBufferOptions(x) TO_OPTS(AVAudioPlayerNodeBufferOptions, NSUInteger, x)
#define is_value_AVAudioPlayerNodeBufferOptions(x) IS_OPTS(AVAudioPlayerNodeBufferOptions, NSUInteger, x)

JS_WRAP_CLASS(AVAudioPlayerNode, AVAudioNode);
  JS_STATIC_METHOD(init);
  JS_METHOD(scheduleBufferCompletionHandler);
  JS_METHOD(scheduleBufferCompletionCallbackTypeCompletionHandler);
  JS_METHOD(scheduleBufferAtTimeOptionsCompletionHandler);
  JS_METHOD(scheduleBufferAtTimeOptionsCompletionCallbackTypeCompletionHandler);
  JS_METHOD(scheduleFileAtTimeCompletionHandler);
  JS_METHOD(scheduleFileAtTimeCompletionCallbackTypeCompletionHandler);
  JS_METHOD(scheduleSegmentStartingFrameFrameCountAtTimeCompletionHandler);
  JS_METHOD(scheduleSegmentStartingFrameFrameCountAtTimeCompletionCallbackTypeCompletionHandler);
  JS_METHOD(stop);
  JS_METHOD(prepareWithFrameCount);
  JS_METHOD(play);
  JS_METHOD(playAtTime);
  JS_METHOD(pause);
  JS_METHOD(nodeTimeForPlayerTime);
  JS_METHOD(playerTimeForNodeTime);
  JS_PROP_READONLY(isPlaying);
JS_WRAP_CLASS_END(AVAudioPlayerNode);

#endif /* NAVAudioPlayerNode_h */
