//
//  NMPMusicPlayerController.h
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NMPMusicPlayerController_h
#define NMPMusicPlayerController_h    

#include "NNSObject.h"

#define js_value_MPMusicPlayerController(x) js_value_wrapper(x, MPMusicPlayerController)
#define to_value_MPMusicPlayerController(x) to_value_wrapper(x, MPMusicPlayerController)
#define is_value_MPMusicPlayerController(x) is_value_wrapper(x, MPMusicPlayerController)

// SpriteKit enums
#define js_value_MPMusicPlaybackState(x) JS_ENUM(MPMusicPlaybackState, NSInteger, x)
#define to_value_MPMusicPlaybackState(x) TO_ENUM(MPMusicPlaybackState, NSInteger, x)
#define is_value_MPMusicPlaybackState(x) IS_ENUM(MPMusicPlaybackState, NSInteger, x)

#define js_value_MPMusicRepeatMode(x) JS_ENUM(MPMusicRepeatMode, NSInteger, x)
#define to_value_MPMusicRepeatMode(x) TO_ENUM(MPMusicRepeatMode, NSInteger, x)
#define is_value_MPMusicRepeatMode(x) IS_ENUM(MPMusicRepeatMode, NSInteger, x)

#define js_value_MPMusicShuffleMode(x) JS_ENUM(MPMusicShuffleMode, NSInteger, x)
#define to_value_MPMusicShuffleMode(x) TO_ENUM(MPMusicShuffleMode, NSInteger, x)
#define is_value_MPMusicShuffleMode(x) IS_ENUM(MPMusicShuffleMode, NSInteger, x)

JS_WRAP_CLASS(MPMusicPlayerController, NSObject);
// MPMusicPlayerController
#if TODO_PROTOCOL
// MPSystemMusicPlayerController
  JS_METHOD(openToPlayQueueDescriptor);
#endif
// MPMusicPlayerController
  JS_METHOD(setQueueWithQuery);
  JS_METHOD(setQueueWithItemCollection);
  JS_METHOD(setQueueWithStoreIDs);
  JS_METHOD(setQueueWithDescriptor);
  JS_METHOD(prependQueueDescriptor);
  JS_METHOD(appendQueueDescriptor);
  JS_METHOD(prepareToPlayWithCompletionHandler);
  JS_METHOD(skipToNextItem);
  JS_METHOD(skipToBeginning);
  JS_METHOD(skipToPreviousItem);
  JS_METHOD(beginGeneratingPlaybackNotifications);
  JS_METHOD(endGeneratingPlaybackNotifications);
  JS_STATIC_PROP_READONLY(applicationMusicPlayer);
  JS_STATIC_PROP_READONLY(applicationQueuePlayer);
  JS_STATIC_PROP_READONLY(systemMusicPlayer);
  JS_PROP_READONLY(playbackState);
  JS_PROP(repeatMode);
  JS_PROP(shuffleMode);
  JS_PROP(volume);
  JS_PROP(nowPlayingItem);
  JS_PROP_READONLY(indexOfNowPlayingItem);
  JS_STATIC_PROP_READONLY(iPodMusicPlayer);
JS_WRAP_CLASS_END(MPMusicPlayerController);

#endif /* NMPMusicPlayerController_h */
