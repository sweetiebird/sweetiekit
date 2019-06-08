//
//  NMPMusicPlayerController.mm
//
//  Created by Shawn Presser on 6/7/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NMPMusicPlayerController.h"

#define instancetype MPMusicPlayerController
#define js_value_instancetype js_value_MPMusicPlayerController

NMPMusicPlayerController::NMPMusicPlayerController() {}
NMPMusicPlayerController::~NMPMusicPlayerController() {}

JS_INIT_CLASS(MPMusicPlayerController, NSObject);
  // instance members (proto)
#if TODO_PROTOCOL
// MPSystemMusicPlayerController
  JS_ASSIGN_PROTO_METHOD(openToPlayQueueDescriptor);
#endif
// MPMusicPlayerController
  JS_ASSIGN_PROTO_METHOD(setQueueWithQuery);
  JS_ASSIGN_PROTO_METHOD(setQueueWithItemCollection);
  JS_ASSIGN_PROTO_METHOD(setQueueWithStoreIDs);
  JS_ASSIGN_PROTO_METHOD(setQueueWithDescriptor);
  JS_ASSIGN_PROTO_METHOD(prependQueueDescriptor);
  JS_ASSIGN_PROTO_METHOD(appendQueueDescriptor);
  JS_ASSIGN_PROTO_METHOD(prepareToPlayWithCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(skipToNextItem);
  JS_ASSIGN_PROTO_METHOD(skipToBeginning);
  JS_ASSIGN_PROTO_METHOD(skipToPreviousItem);
  JS_ASSIGN_PROTO_METHOD(beginGeneratingPlaybackNotifications);
  JS_ASSIGN_PROTO_METHOD(endGeneratingPlaybackNotifications);
  JS_ASSIGN_PROTO_PROP_READONLY(playbackState);
  JS_ASSIGN_PROTO_PROP(repeatMode);
  JS_ASSIGN_PROTO_PROP(shuffleMode);
  JS_ASSIGN_PROTO_PROP(volume);
  JS_ASSIGN_PROTO_PROP(nowPlayingItem);
  JS_ASSIGN_PROTO_PROP_READONLY(indexOfNowPlayingItem);
  // static members (ctor)
  JS_INIT_CTOR(MPMusicPlayerController, NSObject);
  JS_ASSIGN_STATIC_PROP_READONLY(applicationMusicPlayer);
  JS_ASSIGN_STATIC_PROP_READONLY(applicationQueuePlayer);
  JS_ASSIGN_STATIC_PROP_READONLY(systemMusicPlayer);
  JS_ASSIGN_STATIC_PROP_READONLY(iPodMusicPlayer);
JS_INIT_CLASS_END(MPMusicPlayerController, NSObject);

NAN_METHOD(NMPMusicPlayerController::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'MPMusicPlayerController(...)', turn into construct call.
      JS_SET_RETURN_NEW(MPMusicPlayerController, info);
      return;
    }

    MPMusicPlayerController* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge MPMusicPlayerController *)(info[0].As<External>()->Value());
    }
    if (self) {
      NMPMusicPlayerController *wrapper = new NMPMusicPlayerController();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("MPMusicPlayerController::New: invalid arguments");
    }
  }
}

#if TODO_PROTOCOL
NAN_METHOD(NMPSystemMusicPlayerController::openToPlayQueueDescriptor) {
  JS_UNWRAP(MPSystemMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMusicPlayerQueueDescriptor, queueDescriptor);
    [self openToPlayQueueDescriptor: queueDescriptor];
  }
}
#endif

#include "NMPMediaQuery.h"

NAN_METHOD(NMPMusicPlayerController::setQueueWithQuery) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMediaQuery, query);
    [self setQueueWithQuery: query];
  }
}

#include "NMPMediaItemCollection.h"

NAN_METHOD(NMPMusicPlayerController::setQueueWithItemCollection) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMediaItemCollection, itemCollection);
    [self setQueueWithItemCollection: itemCollection];
  }
}

NAN_METHOD(NMPMusicPlayerController::setQueueWithStoreIDs) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSArray<NSString*>, storeIDs);
    [self setQueueWithStoreIDs: storeIDs];
  }
}

#include "NMPMusicPlayerQueueDescriptor.h"

NAN_METHOD(NMPMusicPlayerController::setQueueWithDescriptor) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMusicPlayerQueueDescriptor, descriptor);
    [self setQueueWithDescriptor: descriptor];
  }
}

NAN_METHOD(NMPMusicPlayerController::prependQueueDescriptor) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMusicPlayerQueueDescriptor, descriptor);
    [self prependQueueDescriptor: descriptor];
  }
}

NAN_METHOD(NMPMusicPlayerController::appendQueueDescriptor) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(MPMusicPlayerQueueDescriptor, descriptor);
    [self appendQueueDescriptor: descriptor];
  }
}

#include "NNSError.h"

NAN_METHOD(NMPMusicPlayerController::prepareToPlayWithCompletionHandler) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback_function(completionHandler);
//    declare_value(void-^-NSError-pointer,_Nullable,error, completionHandler);
    [self prepareToPlayWithCompletionHandler:^(NSError * _Nullable error) {
      dispatch_main(^{
        completionHandler("NMPMusicPlayerController::prepareToPlayWithCompletionHandler", js_value_NSError(error));
      });
    }];
  }
}

NAN_METHOD(NMPMusicPlayerController::skipToNextItem) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    [self skipToNextItem];
  }
}

NAN_METHOD(NMPMusicPlayerController::skipToBeginning) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    [self skipToBeginning];
  }
}

NAN_METHOD(NMPMusicPlayerController::skipToPreviousItem) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    [self skipToPreviousItem];
  }
}

NAN_METHOD(NMPMusicPlayerController::beginGeneratingPlaybackNotifications) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    [self beginGeneratingPlaybackNotifications];
  }
}

NAN_METHOD(NMPMusicPlayerController::endGeneratingPlaybackNotifications) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    [self endGeneratingPlaybackNotifications];
  }
}

NAN_GETTER(NMPMusicPlayerController::applicationMusicPlayerGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicPlayerController([MPMusicPlayerController applicationMusicPlayer]));
  }
}

#include "NMPMusicPlayerApplicationController.h"

NAN_GETTER(NMPMusicPlayerController::applicationQueuePlayerGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicPlayerApplicationController([MPMusicPlayerController applicationQueuePlayer]));
  }
}

NAN_GETTER(NMPMusicPlayerController::systemMusicPlayerGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicPlayerController/* <MPSystemMusicPlayerController>*/([MPMusicPlayerController systemMusicPlayer]));
  }
}

NAN_GETTER(NMPMusicPlayerController::playbackStateGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicPlaybackState([self playbackState]));
  }
}

NAN_GETTER(NMPMusicPlayerController::repeatModeGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicRepeatMode([self repeatMode]));
  }
}

NAN_SETTER(NMPMusicPlayerController::repeatModeSetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MPMusicRepeatMode, input);
    [self setRepeatMode: input];
  }
}

NAN_GETTER(NMPMusicPlayerController::shuffleModeGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicShuffleMode([self shuffleMode]));
  }
}

NAN_SETTER(NMPMusicPlayerController::shuffleModeSetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(MPMusicShuffleMode, input);
    [self setShuffleMode: input];
  }
}

NAN_GETTER(NMPMusicPlayerController::volumeGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self volume]));
  }
}

NAN_SETTER(NMPMusicPlayerController::volumeSetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVolume: input];
  }
}

#include "NMPMediaItem.h"

NAN_GETTER(NMPMusicPlayerController::nowPlayingItemGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMediaItem([self nowPlayingItem]));
  }
}

NAN_SETTER(NMPMusicPlayerController::nowPlayingItemSetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(MPMediaItem, input);
    [self setNowPlayingItem: input];
  }
}

NAN_GETTER(NMPMusicPlayerController::indexOfNowPlayingItemGetter) {
  JS_UNWRAP(MPMusicPlayerController, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSUInteger([self indexOfNowPlayingItem]));
  }
}

NAN_GETTER(NMPMusicPlayerController::iPodMusicPlayerGetter) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_MPMusicPlayerController([MPMusicPlayerController iPodMusicPlayer]));
  }
}

