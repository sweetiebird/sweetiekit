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
// AVAudioPlayer
  JS_METHOD(initWithContentsOfURLError);
  JS_METHOD(initWithDataError);
  JS_METHOD(initWithContentsOfURLFileTypeHintError);
  JS_METHOD(initWithDataFileTypeHintError);
  JS_METHOD(prepareToPlay);
  JS_METHOD(play);
  JS_METHOD(playAtTime);
  JS_METHOD(pause);
  JS_METHOD(stop);
  JS_METHOD(setVolumeFadeDuration);
  JS_METHOD(updateMeters);
  JS_METHOD(peakPowerForChannel);
  JS_METHOD(averagePowerForChannel);
  #if TODO
// AVAudioPlayerDelegate
  JS_METHOD(audioPlayerDidFinishPlayingSuccessfully);
  JS_METHOD(audioPlayerDecodeErrorDidOccurError);
  JS_METHOD(audioPlayerBeginInterruption);
  JS_METHOD(audioPlayerEndInterruptionWithOptions);
  JS_METHOD(audioPlayerEndInterruptionWithFlags);
  JS_METHOD(audioPlayerEndInterruption);
  #endif
// AVAudioPlayer
  JS_PROP_READONLY(isPlaying);
  JS_PROP_READONLY(numberOfChannels);
  JS_PROP_READONLY(duration);
#ifndef __IPHONEOS__
  JS_PROP(currentDevice);
#endif
  JS_PROP(delegate);
  JS_PROP_READONLY(url);
  JS_PROP_READONLY(data);
  JS_PROP(pan);
  JS_PROP(volume);
  JS_PROP(enableRate);
  JS_PROP(rate);
  JS_PROP(currentTime);
  JS_PROP_READONLY(deviceCurrentTime);
  JS_PROP(numberOfLoops);
  JS_PROP_READONLY(settings);
  JS_PROP_READONLY(format);
  JS_PROP(isMeteringEnabled);
  JS_PROP(channelAssignments);

JS_WRAP_CLASS_END(AVAudioPlayer);

#endif /* NAVAudioPlayer_h */
