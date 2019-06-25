//
//  NSCNAudioSource.mm
//
//  Created by Shawn Presser on 6/24/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NSCNAudioSource.h"

#define instancetype SCNAudioSource
#define js_value_instancetype js_value_SCNAudioSource

NSCNAudioSource::NSCNAudioSource() {}
NSCNAudioSource::~NSCNAudioSource() {}

#include "NSCNNode.h"

JS_INIT_CLASS(SCNAudioSource, NSObject);
  JS_ASSIGN_STATIC_METHOD(audioSourceNamed);
  JS_ASSIGN_PROTO_METHOD(initWithFileNamed);
  JS_ASSIGN_PROTO_METHOD(initWithURL);
  JS_ASSIGN_PROTO_METHOD(load);
  JS_ASSIGN_PROTO_PROP(isPositional);
  JS_ASSIGN_PROTO_PROP(volume);
  JS_ASSIGN_PROTO_PROP(rate);
  JS_ASSIGN_PROTO_PROP(reverbBlend);
  JS_ASSIGN_PROTO_PROP(loops);
  JS_ASSIGN_PROTO_PROP(shouldStream);

  // SCNNode (SCNAudioSupport)
  {
    JS_WITH_TYPE(SCNNode);
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNAudioSupport::addAudioPlayer, "addAudioPlayer");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNAudioSupport::removeAllAudioPlayers, "removeAllAudioPlayers");
    JS_ASSIGN_PROTO_METHOD_AS(NSCNNode_SCNAudioSupport::removeAudioPlayer, "removeAudioPlayer");
    JS_ASSIGN_PROTO_PROP_READONLY_AS(NSCNNode_SCNAudioSupport::audioPlayers, "audioPlayers");
  }
  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(SCNAudioSource, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(SCNAudioSource, NSObject);

NAN_METHOD(NSCNAudioSource::New) {
  JS_RECONSTRUCT(SCNAudioSource);
  @autoreleasepool {
    SCNAudioSource* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge SCNAudioSource *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[SCNAudioSource alloc] init];
    }
    if (self) {
      NSCNAudioSource *wrapper = new NSCNAudioSource();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("SCNAudioSource::New: invalid arguments");
    }
  }
}

NAN_METHOD(NSCNAudioSource::audioSourceNamed) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, fileName);
    JS_SET_RETURN(js_value_instancetype([SCNAudioSource audioSourceNamed: fileName]));
  }
}

NAN_METHOD(NSCNAudioSource::initWithFileNamed) {
  JS_UNWRAP_OR_ALLOC(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSString, name);
    JS_SET_RETURN(js_value_instancetype([self initWithFileNamed: name]));
  }
}

#include "NNSURL.h"

NAN_METHOD(NSCNAudioSource::initWithURL) {
  JS_UNWRAP_OR_ALLOC(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, url);
    JS_SET_RETURN(js_value_instancetype([self initWithURL: url]));
  }
}

NAN_METHOD(NSCNAudioSource::load) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    [self load];
  }
}

#include "NSCNAudioPlayer.h"

NAN_METHOD(NSCNNode_SCNAudioSupport::addAudioPlayer) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAudioPlayer, player);
    [self addAudioPlayer: player];
  }
}

NAN_METHOD(NSCNNode_SCNAudioSupport::removeAllAudioPlayers) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    [self removeAllAudioPlayers];
  }
}

NAN_METHOD(NSCNNode_SCNAudioSupport::removeAudioPlayer) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(SCNAudioPlayer, player);
    [self removeAudioPlayer: player];
  }
}

NAN_GETTER(NSCNNode_SCNAudioSupport::audioPlayersGetter) {
  JS_UNWRAP(SCNNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<SCNAudioPlayer*>([self audioPlayers]));
  }
}

NAN_GETTER(NSCNAudioSource::isPositionalGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isPositional]));
  }
}

NAN_SETTER(NSCNAudioSource::isPositionalSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setPositional: input];
  }
}

NAN_GETTER(NSCNAudioSource::volumeGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self volume]));
  }
}

NAN_SETTER(NSCNAudioSource::volumeSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVolume: input];
  }
}

NAN_GETTER(NSCNAudioSource::rateGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self rate]));
  }
}

NAN_SETTER(NSCNAudioSource::rateSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setRate: input];
  }
}

NAN_GETTER(NSCNAudioSource::reverbBlendGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self reverbBlend]));
  }
}

NAN_SETTER(NSCNAudioSource::reverbBlendSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setReverbBlend: input];
  }
}

NAN_GETTER(NSCNAudioSource::loopsGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self loops]));
  }
}

NAN_SETTER(NSCNAudioSource::loopsSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setLoops: input];
  }
}

NAN_GETTER(NSCNAudioSource::shouldStreamGetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self shouldStream]));
  }
}

NAN_SETTER(NSCNAudioSource::shouldStreamSetter) {
  JS_UNWRAP(SCNAudioSource, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setShouldStream: input];
  }
}
