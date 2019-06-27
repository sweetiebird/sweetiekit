//
//  NAVAudioEnvironmentNode.mm
//
//  Created by Shawn Presser on 6/26/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioEnvironmentNode.h"

#define instancetype AVAudioEnvironmentNode
#define js_value_instancetype js_value_AVAudioEnvironmentNode

NAVAudioEnvironmentNode::NAVAudioEnvironmentNode() {}
NAVAudioEnvironmentNode::~NAVAudioEnvironmentNode() {}

JS_INIT_CLASS(AVAudioEnvironmentNode, AVAudioMixing);
  JS_ASSIGN_PROTO_PROP(outputVolume);
  JS_ASSIGN_PROTO_PROP_READONLY(nextAvailableInputBus);
  JS_ASSIGN_PROTO_PROP(listenerPosition);
  JS_ASSIGN_PROTO_PROP(listenerVectorOrientation);
  JS_ASSIGN_PROTO_PROP(listenerAngularOrientation);
  JS_ASSIGN_PROTO_PROP_READONLY(distanceAttenuationParameters);
  JS_ASSIGN_PROTO_PROP_READONLY(reverbParameters);
  JS_ASSIGN_PROTO_PROP_READONLY(applicableRenderingAlgorithms);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioEnvironmentNode, AVAudioMixing);
  // constant values (exports)

  /*! @enum AVAudioEnvironmentDistanceAttenuationModel
      @abstract Types of distance attenuation models
      @discussion
          Distance attenuation is the natural attenuation of sound when traveling from the source to 
          the listener. The different attenuation models listed below describe the drop-off in gain as 
          the source moves away from the listener.
       
          AVAudioEnvironmentDistanceAttenuationModelExponential
              distanceGain = (distance / referenceDistance) ^ (-rolloffFactor)
       
          AVAudioEnvironmentDistanceAttenuationModelInverse
              distanceGain = referenceDistance /  (referenceDistance + rolloffFactor *
                                                  (distance – referenceDistance))
       
          AVAudioEnvironmentDistanceAttenuationModelLinear
              distanceGain = (1 – rolloffFactor * (distance – referenceDistance) /
                                                  (maximumDistance – referenceDistance))
       
          With all the distance models, if the formula can not be evaluated then the source will not 
          be attenuated. For example, if a linear model is being used with referenceDistance equal 
          to maximumDistance, then the gain equation will have a divide-by-zero error in it. In this case,
          there is no attenuation for that source.
       
          All the values for distance are specified in meters.
  */

  //typedef NS_ENUM(NSInteger, AVAudioEnvironmentDistanceAttenuationModel) {
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelExponential, NSInteger); //    = 1,
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelInverse, NSInteger); //        = 2,
    JS_ASSIGN_ENUM(AVAudioEnvironmentDistanceAttenuationModelLinear, NSInteger); //         = 3
  //} NS_ENUM_AVAILABLE(10_10, 8_0);

JS_INIT_CLASS_END(AVAudioEnvironmentNode, AVAudioMixing);

NAN_METHOD(NAVAudioEnvironmentNode::New) {
  JS_RECONSTRUCT(AVAudioEnvironmentNode);
  @autoreleasepool {
    AVAudioEnvironmentNode* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioEnvironmentNode *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioEnvironmentNode alloc] init];
    }
    if (self) {
      NAVAudioEnvironmentNode *wrapper = new NAVAudioEnvironmentNode();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioEnvironmentNode::New: invalid arguments");
    }
  }
}

NAN_GETTER(NAVAudioEnvironmentNode::outputVolumeGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_float([self outputVolume]));
  }
}

NAN_SETTER(NAVAudioEnvironmentNode::outputVolumeSetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(float, input);
    [self setOutputVolume: input];
  }
}

#include "NAVAudioNode.h"

NAN_GETTER(NAVAudioEnvironmentNode::nextAvailableInputBusGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioNodeBus([self nextAvailableInputBus]));
  }
}

#include "NAVAudioTypes.h"

NAN_GETTER(NAVAudioEnvironmentNode::listenerPositionGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudio3DPoint([self listenerPosition]));
  }
}

NAN_SETTER(NAVAudioEnvironmentNode::listenerPositionSetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudio3DPoint, input);
    [self setListenerPosition: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentNode::listenerVectorOrientationGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudio3DVectorOrientation([self listenerVectorOrientation]));
  }
}

NAN_SETTER(NAVAudioEnvironmentNode::listenerVectorOrientationSetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudio3DVectorOrientation, input);
    [self setListenerVectorOrientation: input];
  }
}

NAN_GETTER(NAVAudioEnvironmentNode::listenerAngularOrientationGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudio3DAngularOrientation([self listenerAngularOrientation]));
  }
}

NAN_SETTER(NAVAudioEnvironmentNode::listenerAngularOrientationSetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudio3DAngularOrientation, input);
    [self setListenerAngularOrientation: input];
  }
}

#include "NAVAudioEnvironmentDistanceAttenuationParameters.h"

NAN_GETTER(NAVAudioEnvironmentNode::distanceAttenuationParametersGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEnvironmentDistanceAttenuationParameters([self distanceAttenuationParameters]));
  }
}

#include "NAVAudioEnvironmentReverbParameters.h"

NAN_GETTER(NAVAudioEnvironmentNode::reverbParametersGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioEnvironmentReverbParameters([self reverbParameters]));
  }
}

NAN_GETTER(NAVAudioEnvironmentNode::applicableRenderingAlgorithmsGetter) {
  JS_UNWRAP(AVAudioEnvironmentNode, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSArray<NSNumber*>([self applicableRenderingAlgorithms]));
  }
}
