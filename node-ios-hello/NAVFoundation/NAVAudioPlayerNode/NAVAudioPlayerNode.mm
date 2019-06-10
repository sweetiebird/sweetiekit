//
//  NAVAudioPlayerNode.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioPlayerNode.h"

#define instancetype AVAudioPlayerNode
#define js_value_instancetype js_value_AVAudioPlayerNode

NAVAudioPlayerNode::NAVAudioPlayerNode() {}
NAVAudioPlayerNode::~NAVAudioPlayerNode() {}

JS_INIT_CLASS(AVAudioPlayerNode, AVAudioNode);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(scheduleBufferCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleBufferCompletionCallbackTypeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleBufferAtTimeOptionsCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleBufferAtTimeOptionsCompletionCallbackTypeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleFileAtTimeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleFileAtTimeCompletionCallbackTypeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleSegmentStartingFrameFrameCountAtTimeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(scheduleSegmentStartingFrameFrameCountAtTimeCompletionCallbackTypeCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(stop);
  JS_ASSIGN_PROTO_METHOD(prepareWithFrameCount);
  JS_ASSIGN_PROTO_METHOD(play);
  JS_ASSIGN_PROTO_METHOD(playAtTime);
  JS_ASSIGN_PROTO_METHOD(pause);
  JS_ASSIGN_PROTO_METHOD(nodeTimeForPlayerTime);
  JS_ASSIGN_PROTO_METHOD(playerTimeForNodeTime);
  JS_ASSIGN_PROTO_PROP_READONLY(isPlaying);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioPlayerNode, AVAudioNode);
  JS_ASSIGN_STATIC_METHOD(init);
JS_INIT_CLASS_END(AVAudioPlayerNode, AVAudioNode);

NAN_METHOD(NAVAudioPlayerNode::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioPlayerNode(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioPlayerNode, info);
      return;
    }

    AVAudioPlayerNode* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioPlayerNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioPlayerNode alloc] init];
    }
    if (self) {
      NAVAudioPlayerNode *wrapper = new NAVAudioPlayerNode();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioPlayerNode::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioPlayerNode::init) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_instancetype([[AVAudioPlayerNode alloc] init]));
  }
}

#include "NAVAudioPCMBuffer.h"

NAN_METHOD(NAVAudioPlayerNode::scheduleBufferCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_callback_function(completionHandler);
    [self scheduleBuffer: buffer completionHandler:^{
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleBufferCompletionHandler");
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::scheduleBufferCompletionCallbackTypeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_value(AVAudioPlayerNodeCompletionCallbackType, callbackType);
    declare_callback_function(completionHandler);
    [self scheduleBuffer: buffer completionCallbackType: callbackType
          completionHandler:^(AVAudioPlayerNodeCompletionCallbackType callbackType)
    {
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleBufferCompletionCallbackTypeCompletionHandler",
          js_value_AVAudioPlayerNodeCompletionCallbackType(callbackType));
      });
    }];
  }
}

#include "NAVAudioTime.h"

NAN_METHOD(NAVAudioPlayerNode::scheduleBufferAtTimeOptionsCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_nullable_pointer(AVAudioTime, when);
    declare_value(AVAudioPlayerNodeBufferOptions, options);
    declare_callback_function(completionHandler);
    [self scheduleBuffer: buffer atTime: when options: options completionHandler:^{
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleBufferAtTimeOptionsCompletionHandler");
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::scheduleBufferAtTimeOptionsCompletionCallbackTypeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_nullable_pointer(AVAudioTime, when);
    declare_value(AVAudioPlayerNodeBufferOptions, options);
    declare_value(AVAudioPlayerNodeCompletionCallbackType, callbackType);
    declare_callback_function(completionHandler);
    [self scheduleBuffer: buffer atTime: when options: options
          completionCallbackType:callbackType
          completionHandler:^(AVAudioPlayerNodeCompletionCallbackType callbackType) {
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleBufferAtTimeOptionsCompletionCallbackTypeCompletionHandler",
          js_value_AVAudioPlayerNodeCompletionCallbackType(callbackType));
      });
    }];
  }
}

#include "NAVAudioFile.h"

NAN_METHOD(NAVAudioPlayerNode::scheduleFileAtTimeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFile, file);
    declare_nullable_pointer(AVAudioTime, when);
    declare_callback_function(completionHandler);
    [self scheduleFile: file atTime: when completionHandler:^{
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleFileAtTimeCompletionHandler");
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::scheduleFileAtTimeCompletionCallbackTypeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFile, file);
    declare_nullable_pointer(AVAudioTime, when);
    declare_value(AVAudioPlayerNodeCompletionCallbackType, callbackType);
    declare_callback_function(completionHandler);
    [self scheduleFile: file atTime: when completionCallbackType: callbackType completionHandler:^(AVAudioPlayerNodeCompletionCallbackType callbackType) {
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleFileAtTimeCompletionCallbackTypeCompletionHandler",
          js_value_AVAudioPlayerNodeCompletionCallbackType(callbackType));
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::scheduleSegmentStartingFrameFrameCountAtTimeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFile, file);
    declare_value(AVAudioFramePosition, startFrame);
    declare_value(AVAudioFrameCount, numberFrames);
    declare_nullable_pointer(AVAudioTime, when);
    declare_callback_function(completionHandler);
    [self scheduleSegment: file startingFrame: startFrame frameCount: numberFrames atTime: when completionHandler:^{
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleSegmentStartingFrameFrameCountAtTimeCompletionHandler");
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::scheduleSegmentStartingFrameFrameCountAtTimeCompletionCallbackTypeCompletionHandler) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioFile, file);
    declare_value(AVAudioFramePosition, startFrame);
    declare_value(AVAudioFrameCount, numberFrames);
    declare_nullable_pointer(AVAudioTime, when);
    declare_value(AVAudioPlayerNodeCompletionCallbackType, callbackType);
    declare_callback_function(completionHandler);
    [self scheduleSegment: file startingFrame: startFrame frameCount: numberFrames atTime: when
          completionCallbackType:callbackType
          completionHandler:^(AVAudioPlayerNodeCompletionCallbackType callbackType) {
      dispatch_main(^{
        completionHandler("NAVAudioPlayerNode::scheduleSegmentStartingFrameFrameCountAtTimeCompletionCallbackTypeCompletionHandler",
          js_value_AVAudioPlayerNodeCompletionCallbackType(callbackType));
      });
    }];
  }
}

NAN_METHOD(NAVAudioPlayerNode::stop) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    [self stop];
  }
}

NAN_METHOD(NAVAudioPlayerNode::prepareWithFrameCount) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioFrameCount, frameCount);
    [self prepareWithFrameCount: frameCount];
  }
}

NAN_METHOD(NAVAudioPlayerNode::play) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    [self play];
  }
}

NAN_METHOD(NAVAudioPlayerNode::playAtTime) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_nullable_pointer(AVAudioTime, when);
    [self playAtTime: when];
  }
}

NAN_METHOD(NAVAudioPlayerNode::pause) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    [self pause];
  }
}

NAN_METHOD(NAVAudioPlayerNode::nodeTimeForPlayerTime) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioTime, playerTime);
    JS_SET_RETURN(js_value_AVAudioTime([self nodeTimeForPlayerTime: playerTime]));
  }
}

NAN_METHOD(NAVAudioPlayerNode::playerTimeForNodeTime) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioTime, nodeTime);
    JS_SET_RETURN(js_value_AVAudioTime([self playerTimeForNodeTime: nodeTime]));
  }
}

NAN_GETTER(NAVAudioPlayerNode::isPlayingGetter) {
  JS_UNWRAP(AVAudioPlayerNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPlaying]));
  }
}
