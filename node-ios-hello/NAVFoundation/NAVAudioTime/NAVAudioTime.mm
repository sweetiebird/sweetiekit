//
//  NAVAudioTime.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioTime.h"

#include "NAVAudioTypes.h"

#define instancetype AVAudioTime
#define js_value_instancetype js_value_AVAudioTime

NAVAudioTime::NAVAudioTime() {}
NAVAudioTime::~NAVAudioTime() {}

JS_INIT_CLASS(AVAudioTime, NSObject);
  JS_ASSIGN_STATIC_METHOD(timeWithAudioTimeStampSampleRate);
  JS_ASSIGN_STATIC_METHOD(timeWithHostTime);
  JS_ASSIGN_STATIC_METHOD(timeWithSampleTimeAtRate);
  JS_ASSIGN_STATIC_METHOD(timeWithHostTimeSampleTimeAtRate);
  JS_ASSIGN_STATIC_METHOD(hostTimeForSeconds);
  JS_ASSIGN_STATIC_METHOD(secondsForHostTime);
  JS_ASSIGN_PROTO_METHOD(initWithAudioTimeStampSampleRate);
  JS_ASSIGN_PROTO_METHOD(initWithHostTime);
  JS_ASSIGN_PROTO_METHOD(initWithSampleTimeAtRate);
  JS_ASSIGN_PROTO_METHOD(initWithHostTimeSampleTimeAtRate);
  JS_ASSIGN_PROTO_METHOD(extrapolateTimeFromAnchor);
  JS_ASSIGN_PROTO_PROP_READONLY(isHostTimeValid);
  JS_ASSIGN_PROTO_PROP_READONLY(hostTime);
  JS_ASSIGN_PROTO_PROP_READONLY(isSampleTimeValid);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleTime);
  JS_ASSIGN_PROTO_PROP_READONLY(sampleRate);
  JS_ASSIGN_PROTO_PROP_READONLY(audioTimeStamp);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVAudioTime, NSObject);
JS_INIT_CLASS_END(AVAudioTime, NSObject);

NAN_METHOD(NAVAudioTime::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioTime(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioTime, info);
      return;
    }

    AVAudioTime* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioTime *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioTime alloc] init];
    }
    if (self) {
      NAVAudioTime *wrapper = new NAVAudioTime();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioTime::New: invalid arguments");
    }
  }
}

#include "NCoreAudioBaseTypes.h"

NAN_METHOD(NAVAudioTime::timeWithAudioTimeStampSampleRate) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioTimeStamp, ts);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([AVAudioTime timeWithAudioTimeStamp: &ts sampleRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::timeWithHostTime) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint64_t, hostTime);
    JS_SET_RETURN(js_value_instancetype([AVAudioTime timeWithHostTime: hostTime]));
  }
}

NAN_METHOD(NAVAudioTime::timeWithSampleTimeAtRate) {
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioFramePosition, sampleTime);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([AVAudioTime timeWithSampleTime: sampleTime atRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::timeWithHostTimeSampleTimeAtRate) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint64_t, hostTime);
    declare_value(AVAudioFramePosition, sampleTime);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([AVAudioTime timeWithHostTime: hostTime sampleTime: sampleTime atRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::hostTimeForSeconds) {
  declare_autoreleasepool {
    declare_args();
    declare_value(NSTimeInterval, seconds);
    JS_SET_RETURN(js_value_uint64_t([AVAudioTime hostTimeForSeconds: seconds]));
  }
}

NAN_METHOD(NAVAudioTime::secondsForHostTime) {
  declare_autoreleasepool {
    declare_args();
    declare_value(uint64_t, hostTime);
    JS_SET_RETURN(js_value_NSTimeInterval([AVAudioTime secondsForHostTime: hostTime]));
  }
}

NAN_METHOD(NAVAudioTime::initWithAudioTimeStampSampleRate) {
  JS_UNWRAP_OR_ALLOC(AVAudioTime, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AudioTimeStamp, ts);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([self initWithAudioTimeStamp: &ts sampleRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::initWithHostTime) {
  JS_UNWRAP_OR_ALLOC(AVAudioTime, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint64_t, hostTime);
    JS_SET_RETURN(js_value_instancetype([self initWithHostTime: hostTime]));
  }
}

NAN_METHOD(NAVAudioTime::initWithSampleTimeAtRate) {
  JS_UNWRAP_OR_ALLOC(AVAudioTime, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(AVAudioFramePosition, sampleTime);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([self initWithSampleTime: sampleTime atRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::initWithHostTimeSampleTimeAtRate) {
  JS_UNWRAP_OR_ALLOC(AVAudioTime, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(uint64_t, hostTime);
    declare_value(AVAudioFramePosition, sampleTime);
    declare_value(double, sampleRate);
    JS_SET_RETURN(js_value_instancetype([self initWithHostTime: hostTime sampleTime: sampleTime atRate: sampleRate]));
  }
}

NAN_METHOD(NAVAudioTime::extrapolateTimeFromAnchor) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioTime, anchorTime);
    JS_SET_RETURN(js_value_AVAudioTime([self extrapolateTimeFromAnchor: anchorTime]));
  }
}

NAN_GETTER(NAVAudioTime::isHostTimeValidGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isHostTimeValid]));
  }
}

NAN_GETTER(NAVAudioTime::hostTimeGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_uint64_t([self hostTime]));
  }
}

NAN_GETTER(NAVAudioTime::isSampleTimeValidGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isSampleTimeValid]));
  }
}

NAN_GETTER(NAVAudioTime::sampleTimeGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFramePosition([self sampleTime]));
  }
}

NAN_GETTER(NAVAudioTime::sampleRateGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_double([self sampleRate]));
  }
}

NAN_GETTER(NAVAudioTime::audioTimeStampGetter) {
  JS_UNWRAP(AVAudioTime, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AudioTimeStamp([self audioTimeStamp]));
  }
}

