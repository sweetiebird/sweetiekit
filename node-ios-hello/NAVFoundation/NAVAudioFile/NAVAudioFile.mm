//
//  NAVAudioFile.mm
//
//  Created by Shawn Presser on 6/10/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVAudioFile.h"

#define instancetype AVAudioFile
#define js_value_instancetype js_value_AVAudioFile

NAVAudioFile::NAVAudioFile() {}
NAVAudioFile::~NAVAudioFile() {}

JS_INIT_CLASS(AVAudioFile, NSObject);
  // instance members (proto)
  JS_ASSIGN_PROTO_METHOD(readIntoBufferError);
  JS_ASSIGN_PROTO_METHOD(readIntoBufferFrameCountError);
  JS_ASSIGN_PROTO_METHOD(writeFromBufferError);
  JS_ASSIGN_PROTO_PROP_READONLY(url);
  JS_ASSIGN_PROTO_PROP_READONLY(fileFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(processingFormat);
  JS_ASSIGN_PROTO_PROP_READONLY(length);
  JS_ASSIGN_PROTO_PROP(framePosition);
  // static members (ctor)
  JS_INIT_CTOR(AVAudioFile, NSObject);
  JS_ASSIGN_STATIC_METHOD(initForReadingError);
  JS_ASSIGN_STATIC_METHOD(initForReadingCommonFormatInterleavedError);
  JS_ASSIGN_STATIC_METHOD(initForWritingSettingsError);
  JS_ASSIGN_STATIC_METHOD(initForWritingSettingsCommonFormatInterleavedError);
JS_INIT_CLASS_END(AVAudioFile, NSObject);

NAN_METHOD(NAVAudioFile::New) {
  @autoreleasepool {
    if (!info.IsConstructCall()) {
      // Invoked as plain function 'AVAudioFile(...)', turn into construct call.
      JS_SET_RETURN_NEW(AVAudioFile, info);
      return;
    }

    AVAudioFile* self = nullptr;
    if (info[0]->IsExternal()) {
      self = (__bridge AVAudioFile *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[AVAudioFile alloc] init];
    }
    if (self) {
      NAVAudioFile *wrapper = new NAVAudioFile();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVAudioFile::New: invalid arguments");
    }
  }
}

#include "NNSURL.h"

NAN_METHOD(NAVAudioFile::initForReadingError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, fileURL);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioFile alloc] initForReading: fileURL error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVAudioFormat.h"

NAN_METHOD(NAVAudioFile::initForReadingCommonFormatInterleavedError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, fileURL);
    declare_value(AVAudioCommonFormat, format);
    declare_value(BOOL, interleaved);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioFile alloc] initForReading: fileURL commonFormat: format interleaved: interleaved error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioFile::initForWritingSettingsError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, fileURL);
    declare_pointer(NSDictionary/* <NSString*, id>*/, settings);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioFile alloc] initForWriting: fileURL settings: settings error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioFile::initForWritingSettingsCommonFormatInterleavedError) {
  declare_autoreleasepool {
    declare_args();
    declare_pointer(NSURL, fileURL);
    declare_pointer(NSDictionary/* <NSString*, id>*/, settings);
    declare_value(AVAudioCommonFormat, format);
    declare_value(BOOL, interleaved);
    declare_error();
    JS_SET_RETURN(js_value_instancetype([[AVAudioFile alloc] initForWriting: fileURL settings: settings commonFormat: format interleaved: interleaved error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVAudioPCMBuffer.h"

NAN_METHOD(NAVAudioFile::readIntoBufferError) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self readIntoBuffer: buffer error: &error]));
    js_panic_NSError(error);
  }
}

#include "NAVAudioNode.h"

NAN_METHOD(NAVAudioFile::readIntoBufferFrameCountError) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_value(AVAudioFrameCount, frames);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self readIntoBuffer: buffer frameCount: frames error: &error]));
    js_panic_NSError(error);
  }
}

NAN_METHOD(NAVAudioFile::writeFromBufferError) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    declare_args();
    declare_pointer(AVAudioPCMBuffer, buffer);
    declare_error();
    JS_SET_RETURN(js_value_BOOL([self writeFromBuffer: buffer error: &error]));
    js_panic_NSError(error);
  }
}

NAN_GETTER(NAVAudioFile::urlGetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_NSURL([self url]));
  }
}

NAN_GETTER(NAVAudioFile::fileFormatGetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self fileFormat]));
  }
}

NAN_GETTER(NAVAudioFile::processingFormatGetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFormat([self processingFormat]));
  }
}

NAN_GETTER(NAVAudioFile::lengthGetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFramePosition([self length]));
  }
}

NAN_GETTER(NAVAudioFile::framePositionGetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_AVAudioFramePosition([self framePosition]));
  }
}

NAN_SETTER(NAVAudioFile::framePositionSetter) {
  JS_UNWRAP(AVAudioFile, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(AVAudioFramePosition, input);
    [self setFramePosition: input];
  }
}

