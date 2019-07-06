////
////  RPScreenRecorder.mm
////
////  Created by Emily Kolar on 2019-5-26.
////  Copyright © 2019 sweetiebird. All rights reserved.
////
#include "NRPScreenRecorder.h"
#include "NRPPreviewViewController.h"

NRPScreenRecorder::NRPScreenRecorder () {}
NRPScreenRecorder::~NRPScreenRecorder () {}

JS_INIT_CLASS(RPScreenRecorder, NSObject);
  JS_ASSIGN_STATIC_METHOD(sharedRecorder);
  JS_ASSIGN_PROTO_METHOD(startRecordingWithMicrophoneEnabledHandler);
  JS_ASSIGN_PROTO_METHOD(startRecordingWithHandler);
  JS_ASSIGN_PROTO_METHOD(stopRecordingWithHandler);
  JS_ASSIGN_PROTO_METHOD(discardRecordingWithHandler);
  JS_ASSIGN_PROTO_METHOD(startCaptureWithHandlerCompletionHandler);
  JS_ASSIGN_PROTO_METHOD(stopCaptureWithHandler);
  JS_ASSIGN_PROTO_PROP(delegate);
  JS_ASSIGN_PROTO_PROP_READONLY(isAvailable);
  JS_ASSIGN_PROTO_PROP_READONLY(isRecording);
  JS_ASSIGN_PROTO_PROP(isMicrophoneEnabled);
  JS_ASSIGN_PROTO_PROP(isCameraEnabled);
  JS_ASSIGN_PROTO_PROP(cameraPosition);
  JS_ASSIGN_PROTO_PROP_READONLY(cameraPreviewView);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(RPScreenRecorder, NSObject);
  // constants (exports)

  //API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos)
  //typedef NS_ENUM(NSInteger, RPCameraPosition) {
    JS_ASSIGN_ENUM(RPCameraPositionFront, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(RPCameraPositionBack, NSInteger); //
  //};

  //API_AVAILABLE(ios(10.0),tvos(10.0))
  //typedef NS_ENUM(NSInteger, RPSampleBufferType) {
    JS_ASSIGN_ENUM(RPSampleBufferTypeVideo, NSInteger); //  = 1,
    JS_ASSIGN_ENUM(RPSampleBufferTypeAudioApp, NSInteger);
    JS_ASSIGN_ENUM(RPSampleBufferTypeAudioMic, NSInteger);
  //};

JS_INIT_CLASS_END(RPScreenRecorder, NSObject);

NAN_METHOD(NRPScreenRecorder::New) {
  JS_RECONSTRUCT(RPScreenRecorder);
  @autoreleasepool {
    RPScreenRecorder* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge RPScreenRecorder *)(info[0].As<External>()->Value());
    }
    if (self) {
      NRPScreenRecorder *wrapper = new NRPScreenRecorder();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("RPScreenRecorder::New: invalid arguments");
    }
  }
}

NAN_METHOD(NRPScreenRecorder::sharedRecorder) {
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_RPScreenRecorder([RPScreenRecorder sharedRecorder]));
  }
}

#include "NNSError.h"

NAN_METHOD(NRPScreenRecorder::startRecordingWithMicrophoneEnabledHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_value(BOOL, microphoneEnabled);
    declare_callback(handler);
    [self startRecordingWithMicrophoneEnabled: microphoneEnabled handler:^(NSError * _Nullable error) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NRPScreenRecorder::startRecordingWithMicrophoneEnabledHandler",
            js_value_NSError(error));
        }
      });
    }];
  }
}

NAN_METHOD(NRPScreenRecorder::startRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [self startRecordingWithHandler:^(NSError * _Nullable error) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NRPScreenRecorder::startRecordingWithHandler",
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NRPPreviewViewController.h"

NAN_METHOD(NRPScreenRecorder::stopRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [self stopRecordingWithHandler:^(RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NRPScreenRecorder::stopRecordingWithHandler",
            js_value_RPPreviewViewController(previewViewController),
            js_value_NSError(error));
        }
      });
    }];
  }
}

NAN_METHOD(NRPScreenRecorder::discardRecordingWithHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [self discardRecordingWithHandler:^{
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NRPScreenRecorder::discardRecordingWithHandler");
        }
      });
    }];
  }
}

NAN_METHOD(NRPScreenRecorder::startCaptureWithHandlerCompletionHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(captureHandler);
    declare_callback(completionHandler);
    [self startCaptureWithHandler:^(CMSampleBufferRef  _Nonnull sampleBuffer, RPSampleBufferType bufferType, NSError * _Nullable error) {
      dispatch_main(^{
        if (captureHandler) {
          [captureHandler jsFunction]->Call("NRPScreenRecorder::startCaptureWithHandlerCompletionHandler::captureHandler",
            js_value_CMSampleBufferRef(sampleBuffer),
            js_value_RPSampleBufferType(bufferType),
            js_value_NSError(error));
        }
      });
    } completionHandler:^(NSError * _Nullable error) {
      dispatch_main(^{
        if (completionHandler) {
          [completionHandler jsFunction]->Call("NRPScreenRecorder::startCaptureWithHandlerCompletionHandler::completionHandler",
            js_value_NSError(error));
        }
      });
    }];
  }
}

NAN_METHOD(NRPScreenRecorder::stopCaptureWithHandler) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_args();
    declare_callback(handler);
    [self stopCaptureWithHandler:^(NSError * _Nullable error) {
      dispatch_main(^{
        if (handler) {
          [handler jsFunction]->Call("NRPScreenRecorder::stopCaptureWithHandler",
            js_value_NSError(error));
        }
      });
    }];
  }
}

#include "NRPScreenRecorderDelegate.h"

NAN_GETTER(NRPScreenRecorder::delegateGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_RPScreenRecorderDelegate([self delegate]));
  }
}

NAN_SETTER(NRPScreenRecorder::delegateSetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_protocol(RPScreenRecorderDelegate, input);
    [self setDelegate: input];
    [self associateValue:input withKey:@"NRPScreenRecorder::delegate"];
  }
}

NAN_GETTER(NRPScreenRecorder::isAvailableGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isAvailable]));
  }
}

NAN_GETTER(NRPScreenRecorder::isRecordingGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isRecording]));
  }
}

NAN_GETTER(NRPScreenRecorder::isMicrophoneEnabledGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isMicrophoneEnabled]));
  }
}

NAN_SETTER(NRPScreenRecorder::isMicrophoneEnabledSetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setMicrophoneEnabled: input];
  }
}

NAN_GETTER(NRPScreenRecorder::isCameraEnabledGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_BOOL([self isCameraEnabled]));
  }
}

NAN_SETTER(NRPScreenRecorder::isCameraEnabledSetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(BOOL, input);
    [self setCameraEnabled: input];
  }
}

NAN_GETTER(NRPScreenRecorder::cameraPositionGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_RPCameraPosition([self cameraPosition]));
  }
}

NAN_SETTER(NRPScreenRecorder::cameraPositionSetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    declare_setter();
    declare_value(RPCameraPosition, input);
    [self setCameraPosition: input];
  }
}

#include "NUIView.h"

NAN_GETTER(NRPScreenRecorder::cameraPreviewViewGetter) {
  JS_UNWRAP(RPScreenRecorder, self);
  declare_autoreleasepool {
    JS_SET_RETURN(js_value_UIView([self cameraPreviewView]));
  }
}
