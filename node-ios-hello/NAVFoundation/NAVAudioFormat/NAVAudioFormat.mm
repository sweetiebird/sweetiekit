//
//  NAVAudioFormat.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioFormat.h"
#include "NCoreAudioTypes.h"

#define instancetype AVAudioFormat
#define js_value_instancetype js_value_AVAudioFormat

NAVAudioFormat::NAVAudioFormat() {}
NAVAudioFormat::~NAVAudioFormat() {}

JS_INIT_CLASS(AVAudioFormat, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(isEqual);
  JS_ASSIGN_PROTO_PROP_READONLY(isStandard);
  JS_ASSIGN_PROTO_PROP_READONLY(commonFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(channelCount);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleRate);
  JS_ASSIGN_PROTO_PROP_READONLY(isInterleaved);
  JS_ASSIGN_PROTO_PROP_READONLY(streamDescription);
  JS_ASSIGN_PROTO_PROP_READONLY(channelLayout);
  JS_ASSIGN_PROTO_PROP(magicCookie);
  JS_ASSIGN_PROTO_PROP_READONLY(settings);
  JS_ASSIGN_PROTO_PROP_READONLY(formatDescription);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioFormat, NSObject);
  JS_ASSIGN_STATIC_METHOD(initWithStreamDescription);
  JS_ASSIGN_STATIC_METHOD(initWithStreamDescriptionChannelLayout);
  JS_ASSIGN_STATIC_METHOD(initStandardFormatWithSampleRateChannels);
  JS_ASSIGN_STATIC_METHOD(initStandardFormatWithSampleRateChannelLayout);
  JS_ASSIGN_STATIC_METHOD(initWithCommonFormatSampleRateChannelsInterleaved);
  JS_ASSIGN_STATIC_METHOD(initWithCommonFormatSampleRateInterleavedChannelLayout);
  JS_ASSIGN_STATIC_METHOD(initWithSettings);
  JS_ASSIGN_STATIC_METHOD(initWithCMAudioFormatDescription);
JS_INIT_CLASS_END(AVAudioFormat, NSObject);

NAN_METHOD(NAVAudioFormat::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioFormat(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioFormat, info);
      return;
    }

    AVAudioFormat* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioFormat *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioFormat alloc] init];
    }
    if (self) {
      NAVAudioFormat *wrapper = new NAVAudioFormat();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioFormat::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVAudioFormat::initWithStreamDescription) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioStreamBasicDescription, asbd);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithStreamDescription: &asbd]));
  }
}

#include "NAVAudioChannelLayout.h"

NAN_METHOD(NAVAudioFormat::initWithStreamDescriptionChannelLayout) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioStreamBasicDescription, asbd);
    declare_nullable_pointer(AVAudioChannelLayout, layout);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithStreamDescription: &asbd channelLayout: layout]));
  }
}

#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioFormat::initStandardFormatWithSampleRateChannels) {
  declare_autoreleasepool {
    declare_args();
    declare_value(double, sampleRate);
    declare_value(AVAudioChannelCount, channels);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initStandardFormatWithSampleRate: sampleRate channels: channels]));
  }
}

NAN_METHOD(NAVAudioFormat::initStandardFormatWithSampleRateChannelLayout) {
  declare_autoreleasepool {
    declare_args();
    declare_value(double, sampleRate);
    declare_pointer(AVAudioChannelLayout, layout);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initStandardFormatWithSampleRate: sampleRate channelLayout: layout]));
  }
}

NAN_METHOD(NAVAudioFormat::initWithCommonFormatSampleRateChannelsInterleaved) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioCommonFormat, format);
    declare_value(double, sampleRate);
    declare_value(AVAudioChannelCount, channels);
    declare_value(BOOL, interleaved);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithCommonFormat: format sampleRate: sampleRate channels: channels interleaved: interleaved]));
  }
}

NAN_METHOD(NAVAudioFormat::initWithCommonFormatSampleRateInterleavedChannelLayout) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioCommonFormat, format);
    declare_value(double, sampleRate);
    declare_value(BOOL, interleaved);
    declare_pointer(AVAudioChannelLayout, layout);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithCommonFormat: format sampleRate: sampleRate interleaved: interleaved channelLayout: layout]));
  }
}

NAN_METHOD(NAVAudioFormat::initWithSettings) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSDictionary/* <NSString*, id>*/, settings);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithSettings: settings]));
  }
}

NAN_METHOD(NAVAudioFormat::initWithCMAudioFormatDescription) {
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    declare_args();
    declare_value(CMAudioFormatDescriptionRef, formatDescription);
    JS_SET_RETURN(js_value_instancetype([[AVAudioFormat alloc] initWithCMAudioFormatDescription: formatDescription]));
    #endif
  }
}

NAN_METHOD(NAVAudioFormat::isEqual) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(id, object);
    JS_SET_RETURN(js_value_BOOL([self isEqual: object]));
  }
}

NAN_GETTER(NAVAudioFormat::isStandardGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isStandard]));
  }
}

NAN_GETTER(NAVAudioFormat::commonFormatGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioCommonFormat([self commonFormat]));
  }
}

NAN_GETTER(NAVAudioFormat::channelCountGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioChannelCount([self channelCount]));
  }
}

NAN_GETTER(NAVAudioFormat::sampleRateGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self sampleRate]));
  }
}

NAN_GETTER(NAVAudioFormat::isInterleavedGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isInterleaved]));
  }
}

NAN_GETTER(NAVAudioFormat::streamDescriptionGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AudioStreamBasicDescription([self streamDescription]));
  }
}

NAN_GETTER(NAVAudioFormat::channelLayoutGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioChannelLayout([self channelLayout]));
  }
}

NAN_GETTER(NAVAudioFormat::magicCookieGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSData([self magicCookie]));
  }
}

NAN_SETTER(NAVAudioFormat::magicCookieSetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    declare_setter();
    declare_pointer(NSData, input);
    [self setMagicCookie: input];
  }
}

NAN_GETTER(NAVAudioFormat::settingsGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSDictionary/* <NSString*, id>*/([self settings]));
  }
}

NAN_GETTER(NAVAudioFormat::formatDescriptionGetter) {
  JS_UNWRAP(AVAudioFormat, self);
  declare_autoreleasepool {
    JS_TODO();
    #if TODO
    JS_SET_RETURN(js_value_CMAudioFormatDescriptionRef([self formatDescription]));
    #endif
  }
}

