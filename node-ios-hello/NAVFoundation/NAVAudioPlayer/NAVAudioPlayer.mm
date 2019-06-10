//
//  NAVAudioPlayer.m
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#include "defines.h"
#include "NNSObject.h"
#include "NAVAudioPlayer.h"

#define instancetype AVAudioPlayer
#define js_value_instancetype js_value_AVAudioPlayer

NAVAudioPlayer::NAVAudioPlayer () {}
NAVAudioPlayer::~NAVAudioPlayer () {}

JS_INIT_CLASS(AVAudioPlayer, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(prepareToPlay);
  JS_ASSIGN_PROTO_METHOD(play);
  JS_ASSIGN_PROTO_METHOD(playAtTime);
  JS_ASSIGN_PROTO_METHOD(pause);
  JS_ASSIGN_PROTO_METHOD(stop);
  JS_ASSIGN_PROTO_METHOD(setVolumeFadeDuration);
  JS_ASSIGN_PROTO_METHOD(updateMeters);
  JS_ASSIGN_PROTO_METHOD(peakPowerForChannel);
  JS_ASSIGN_PROTO_METHOD(averagePowerForChannel);
  #if TODO
// AVAudioPlayerDelegate
  JS_ASSIGN_PROTO_METHOD(audioPlayerDidFinishPlayingSuccessfully);
  JS_ASSIGN_PROTO_METHOD(audioPlayerDecodeErrorDidOccurError);
  JS_ASSIGN_PROTO_METHOD(audioPlayerBeginInterruption);
  JS_ASSIGN_PROTO_METHOD(audioPlayerEndInterruptionWithOptions);
  JS_ASSIGN_PROTO_METHOD(audioPlayerEndInterruptionWithFlags);
  JS_ASSIGN_PROTO_METHOD(audioPlayerEndInterruption);
  #endif
// AVAudioPlayer
  JS_ASSIGN_PROTO_PROP_READONLY(isPlaying);
  JS_ASSIGN_PROTO_PROP_READONLY(numberOfChannels);
  JS_ASSIGN_PROTO_PROP_READONLY(duration);
#ifndef __IPHONEOS__
  JS_ASSIGN_PROTO_PROP(currentDevice);
#endif
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(url);
  JS_ASSIGN_PROTO_PROP_READONLY(data);
  JS_ASSIGN_PROTO_PROP(pan);
  JS_ASSIGN_PROTO_PROP(volume);
  JS_ASSIGN_PROTO_PROP(enableRate);
  JS_ASSIGN_PROTO_PROP(rate);
  JS_ASSIGN_PROTO_PROP(currentTime);
  JS_ASSIGN_PROTO_PROP_READONLY(deviceCurrentTime);
  JS_ASSIGN_PROTO_PROP(numberOfLoops);
  JS_ASSIGN_PROTO_PROP_READONLY(settings);
  JS_ASSIGN_PROTO_PROP_READONLY(format);
  JS_ASSIGN_PROTO_PROP(isMeteringEnabled);
  JS_ASSIGN_PROTO_PROP(channelAssignments);
  
  // static members (ctor)
  JS_INIT_CTOR(AVAudioPlayer, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithContentsOfURLError);
  JS_ASSIGN_STATIC_METHOD(initWithDataError);
  JS_ASSIGN_STATIC_METHOD(initWithContentsOfURLFileTypeHintError);
  JS_ASSIGN_STATIC_METHOD(initWithDataFileTypeHintError);
  
JS_INIT_CLASS_END(AVAudioPlayer, NSObject);

NAN_METHOD(NAVAudioPlayer::New) {
  Nan::HandleScope scope;

  Local<Object> obj = info.This();

  NAVAudioPlayer *av = new NAVAudioPlayer();

  if (info[0]->IsExternal()) {
    av->SetNSObject((__bridge AVAudioPlayer *)(info[0].As<External>()->Value()));
  } else {
    std::string path;
    if (info[0]->IsString()) {
      Nan::Utf8String utf8Value(Local<String>::Cast(info[0]));
      path = *utf8Value;
    } else {
      Nan::ThrowError("NNSBundle::PathForResource: invalid argument resource");
    }
    @autoreleasepool {
      NSURL *url = [[NSURL alloc] initFileURLWithPath:[NSString stringWithUTF8String:path.c_str()]];
      av->SetNSObject([[AVAudioPlayer alloc] initWithContentsOfURL:url error:nullptr]);
    }
  }

  av->Wrap(obj);

  info.GetReturnValue().Set(obj);
}

#include "NNSURL.h"

NAN_METHOD(NAVAudioPlayer::initWithContentsOfURLError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioPlayer alloc] initWithContentsOfURL: url error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioPlayer::initWithDataError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSData, data);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioPlayer alloc] initWithData: data error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioPlayer::initWithContentsOfURLFileTypeHintError) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSURL, url);
    declare_value(NSString-pointer-__nullable, utiString);
    declare_pointer(NSError-pointer, outError);
    JS_SET_RETURN(js_value_instancetype([[AVAudioPlayer alloc] initWithContentsOfURL: url fileTypeHint: utiString error: outError]));
    #endif
  }
}

NAN_METHOD(NAVAudioPlayer::initWithDataFileTypeHintError) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_pointer(NSData, data);
    declare_value(NSString-pointer-__nullable, utiString);
    declare_pointer(NSError-pointer, outError);
    JS_SET_RETURN(js_value_instancetype([[AVAudioPlayer alloc] initWithData: data fileTypeHint: utiString error: outError]));
    #endif
  }
}

NAN_METHOD(NAVAudioPlayer::prepareToPlay) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self prepareToPlay]));
  }
}

NAN_METHOD(NAVAudioPlayer::play) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self play]));
  }
}

NAN_METHOD(NAVAudioPlayer::playAtTime) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, time);
    JS_SET_RETURN(js_value_BOOL([self playAtTime: time]));
  }
}

NAN_METHOD(NAVAudioPlayer::pause) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    [self pause];
  }
}

NAN_METHOD(NAVAudioPlayer::stop) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    [self stop];
  }
}

NAN_METHOD(NAVAudioPlayer::setVolumeFadeDuration) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(float, volume);
    declare_value(NSTimeInterval, duration);
    [self setVolume: volume fadeDuration: duration];
  }
}

NAN_METHOD(NAVAudioPlayer::updateMeters) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    [self updateMeters];
  }
}

NAN_METHOD(NAVAudioPlayer::peakPowerForChannel) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, channelNumber);
    JS_SET_RETURN(js_value_float([self peakPowerForChannel: channelNumber]));
  }
}

NAN_METHOD(NAVAudioPlayer::averagePowerForChannel) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(NSUInteger, channelNumber);
    JS_SET_RETURN(js_value_float([self averagePowerForChannel: channelNumber]));
  }
}

#if TODO
NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerDidFinishPlayingSuccessfully) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    declare_value(BOOL, flag);
    [self audioPlayerDidFinishPlaying: player successfully: flag];
  }
}

NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerDecodeErrorDidOccurError) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    declare_value(NSError-pointer-__nullable, error);
    [self audioPlayerDecodeErrorDidOccur: player error: error];
  }
}

NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerBeginInterruption) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    [self audioPlayerBeginInterruption: player];
  }
}

NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerEndInterruptionWithOptions) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    declare_value(NSUInteger, flags);
    [self audioPlayerEndInterruption: player withOptions: flags];
  }
}

NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerEndInterruptionWithFlags) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    declare_value(NSUInteger, flags);
    [self audioPlayerEndInterruption: player withFlags: flags];
  }
}

NAN_METHOD(NAVAudioPlayerDelegate::audioPlayerEndInterruption) {
  JS_UNWRAP(AVAudioPlayerDelegate, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPlayer, player);
    [self audioPlayerEndInterruption: player];
  }
}
#endif

NAN_GETTER(NAVAudioPlayer::isPlayingGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPlaying]));
  }
}

NAN_GETTER(NAVAudioPlayer::numberOfChannelsGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self numberOfChannels]));
  }
}

NAN_GETTER(NAVAudioPlayer::durationGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self duration]));
  }
}

#ifndef __IPHONEOS__
NAN_GETTER(NAVAudioPlayer::currentDeviceGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSString([self currentDevice]));
  }
}

NAN_SETTER(NAVAudioPlayer::currentDeviceSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSString, input);
    [self setCurrentDevice: input];
  }
}
#endif

NAN_GETTER(NAVAudioPlayer::delegateGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_id/* <AVAudioPlayerDelegate>*/([self delegate]));
  }
}

NAN_SETTER(NAVAudioPlayer::delegateSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(id/* <AVAudioPlayerDelegate>*/, input);
    [self setDelegate: input];
  }
}

NAN_GETTER(NAVAudioPlayer::urlGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self url]));
  }
}

NAN_GETTER(NAVAudioPlayer::dataGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self data]));
  }
}

NAN_GETTER(NAVAudioPlayer::panGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self pan]));
  }
}

NAN_SETTER(NAVAudioPlayer::panSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setPan: input];
  }
}

NAN_GETTER(NAVAudioPlayer::volumeGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self volume]));
  }
}

NAN_SETTER(NAVAudioPlayer::volumeSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVolume: input];
  }
}

NAN_GETTER(NAVAudioPlayer::enableRateGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self enableRate]));
  }
}

NAN_SETTER(NAVAudioPlayer::enableRateSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setEnableRate: input];
  }
}

NAN_GETTER(NAVAudioPlayer::rateGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self rate]));
  }
}

NAN_SETTER(NAVAudioPlayer::rateSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRate: input];
  }
}

NAN_GETTER(NAVAudioPlayer::currentTimeGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self currentTime]));
  }
}

NAN_SETTER(NAVAudioPlayer::currentTimeSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSTimeInterval, input);
    [self setCurrentTime: input];
  }
}

NAN_GETTER(NAVAudioPlayer::deviceCurrentTimeGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSTimeInterval([self deviceCurrentTime]));
  }
}

NAN_GETTER(NAVAudioPlayer::numberOfLoopsGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSInteger([self numberOfLoops]));
  }
}

NAN_SETTER(NAVAudioPlayer::numberOfLoopsSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(NSInteger, input);
    [self setNumberOfLoops: input];
  }
}

NAN_GETTER(NAVAudioPlayer::settingsGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self settings]));
  }
}

#include "NAVAudioFormat.h"

NAN_GETTER(NAVAudioPlayer::formatGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self format]));
  }
}

NAN_GETTER(NAVAudioPlayer::isMeteringEnabledGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMeteringEnabled]));
  }
}

NAN_SETTER(NAVAudioPlayer::isMeteringEnabledSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMeteringEnabled: input];
  }
}

NAN_GETTER(NAVAudioPlayer::channelAssignmentsGetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<AVAudioSessionChannelDescription*>([self channelAssignments]));
  }
}

NAN_SETTER(NAVAudioPlayer::channelAssignmentsSetter) {
  JS_UNWRAP(AVAudioPlayer, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSArray<AVAudioSessionChannelDescription*>, input);
    [self setChannelAssignments: input];
  }
}

