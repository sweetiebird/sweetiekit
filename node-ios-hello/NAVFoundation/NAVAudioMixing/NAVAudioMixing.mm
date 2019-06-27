//
//  NAVAudioMixing.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioMixing.h"

#define instancetype AVAudioMixing
#define js_value_instancetype js_value_AVAudioMixing

NAVAudioMixing::NAVAudioMixing() {}
NAVAudioMixing::~NAVAudioMixing() {}

JS_INIT_PROTOCOL(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/); // TODO: conform to AVAudio3DMixing
  JS_ASSIGN_PROTO_PROP(destinationForMixerBus);
  JS_ASSIGN_PROTO_PROP(volume);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);
  // constant values (exports)

  //typedef NS_ENUM(NSInteger, AVAudio3DMixingRenderingAlgorithm) {
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmEqualPowerPanning, NSInteger); //       = 0,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmSphericalHead, NSInteger); //           = 1,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmHRTF, NSInteger); //                    = 2,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmSoundField, NSInteger); //              = 3,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmStereoPassThrough, NSInteger); //       = 5,
    JS_ASSIGN_ENUM(AVAudio3DMixingRenderingAlgorithmHRTFHQ, NSInteger); //                  = 6
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_PROTOCOL_END(AVAudioMixing, AVAudioStereoMixing/*, AVAudio3DMixing*/);


NAN_METHOD(NAVAudioMixing::New) {
  JS_RECONSTRUCT_PROTOCOL(AVAudioMixing);
  @autoreleasepool {
    id<AVAudioMixing> self = nil;

    if (info[0]->IsExternal()) {
      self = (__bridge id<AVAudioMixing>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<AVAudioMixing> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], AVAudioMixing, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[AVAudioMixingType alloc] init];
    }
    if (self) {
      NAVAudioMixing *wrapper = new NAVAudioMixing();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioMixing::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVAudioMixing::volumeGetter) {
  JS_UNWRAP_PROTOCOL(AVAudioMixing, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self volume]));
  }
}

NAN_SETTER(NAVAudioMixing::volumeSetter) {
  JS_UNWRAP_PROTOCOL(AVAudioMixing, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setVolume: input];
  }
}


DELEGATE_PROTOCOL_PROP(AVAudioMixing, destinationForMixerBus);

#include "NAVAudioMixingDestination.h"
#include "NAVAudioNode.h"

@implementation AVAudioMixingType

/*! @method destinationForMixer:bus:
  @abstract Returns the AVAudioMixingDestination object corresponding to specified mixer node and
    its input bus
  @discussion
    When a source node is connected to multiple mixers downstream, setting AVAudioMixing 
    properties directly on the source node will apply the change to all the mixers downstream. 
    If you want to set/get properties on a specific mixer, use this method to get the 
    corresponding AVAudioMixingDestination and set/get properties on it. 
 
    Note:
    - Properties set on individual AVAudioMixingDestination instances will not reflect at the
      source node level.

    - AVAudioMixingDestination reference returned by this method could become invalid when
      there is any disconnection between the source and the mixer node. Hence this reference
      should not be retained and should be fetched every time you want to set/get properties 
      on a specific mixer.
 
    If the source node is not connected to the specified mixer/input bus, this method
    returns nil.
    Calling this on an AVAudioMixingDestination instance returns self if the specified
    mixer/input bus match its connection point, otherwise returns nil.
*/
- (nullable AVAudioMixingDestination *)destinationForMixer:(AVAudioNode *)mixer bus:(AVAudioNodeBus)bus API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0))
{
  __block AVAudioMixingDestination *_Nullable result = nil;
  call_delegate(result = to_value_AVAudioMixingDestination(JS_RESULT), destinationForMixerBus,
    js_value_AVAudioNode(mixer),
    js_value_AVAudioNodeBus(bus));
  return result;
}

@end
