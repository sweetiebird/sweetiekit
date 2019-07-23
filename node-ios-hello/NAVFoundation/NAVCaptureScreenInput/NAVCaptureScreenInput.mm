//
//  NAVCaptureScreenInput.mm
//
//  Created by Shawn Presser on 7/9/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NAVCaptureScreenInput.h"

#if !TARGET_OS_IPHONE && !TARGET_OS_WATCH && !TARGET_OS_TV

#define instancetype AVCaptureScreenInput
#define js_value_instancetype js_value_AVCaptureScreenInput

NAVCaptureScreenInput::NAVCaptureScreenInput() {}
NAVCaptureScreenInput::~NAVCaptureScreenInput() {}

JS_INIT_CLASS(AVCaptureScreenInput, AVCaptureInput);
  JS_ASSIGN_PROTO_METHOD(initWithDisplayID);
  JS_ASSIGN_PROTO_PROP(minFrameDuration);
  JS_ASSIGN_PROTO_PROP(cropRect);
  JS_ASSIGN_PROTO_PROP(scaleFactor);
  JS_ASSIGN_PROTO_PROP(capturesMouseClicks);
  JS_ASSIGN_PROTO_PROP(capturesCursor);
  JS_ASSIGN_PROTO_PROP(removesDuplicateFrames);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(AVCaptureScreenInput, AVCaptureInput);
  // constant values (exports)
JS_INIT_CLASS_END(AVCaptureScreenInput, AVCaptureInput);

NAN_METHOD(NAVCaptureScreenInput::New) {
  JS_RECONSTRUCT(AVCaptureScreenInput);
  @autoreleasepool {
    AVCaptureScreenInput* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge AVCaptureScreenInput *)(info[0].As<External>()->Value());
    }
    if (self) {
      NAVCaptureScreenInput *wrapper = new NAVCaptureScreenInput();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("AVCaptureScreenInput::New: invalid arguments");
    }
  }
}

NAN_METHOD(NAVCaptureScreenInput::initWithDisplayID) {
  JS_UNWRAP_OR_ALLOC(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(CGDirectDisplayID, displayID);
    JS_SET_RETURN(js_value_instancetype([self initWithDisplayID: displayID]));
  }
}

NAN_GETTER(NAVCaptureScreenInput::minFrameDurationGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CMTime([self minFrameDuration]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::minFrameDurationSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CMTime, input);
    [self setMinFrameDuration: input];
  }
}

NAN_GETTER(NAVCaptureScreenInput::cropRectGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGRect([self cropRect]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::cropRectSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGRect, input);
    [self setCropRect: input];
  }
}

NAN_GETTER(NAVCaptureScreenInput::scaleFactorGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_CGFloat([self scaleFactor]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::scaleFactorSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(CGFloat, input);
    [self setScaleFactor: input];
  }
}

NAN_GETTER(NAVCaptureScreenInput::capturesMouseClicksGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self capturesMouseClicks]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::capturesMouseClicksSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCapturesMouseClicks: input];
  }
}

NAN_GETTER(NAVCaptureScreenInput::capturesCursorGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self capturesCursor]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::capturesCursorSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCapturesCursor: input];
  }
}

NAN_GETTER(NAVCaptureScreenInput::removesDuplicateFramesGetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self removesDuplicateFrames]));
  }
}

NAN_SETTER(NAVCaptureScreenInput::removesDuplicateFramesSetter) {
  JS_UNWRAP(AVCaptureScreenInput, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setRemovesDuplicateFrames: input];
  }
}


#endif
