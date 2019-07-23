//
//  NRPScreenRecorderDelegate.mm
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NRPScreenRecorderDelegate.h"

#define instancetype RPScreenRecorderDelegate
#define js_value_instancetype js_value_RPScreenRecorderDelegate

NRPScreenRecorderDelegate::NRPScreenRecorderDelegate() {}
NRPScreenRecorderDelegate::~NRPScreenRecorderDelegate() {}

JS_INIT_PROTOCOL(RPScreenRecorderDelegate, NSObject);
#if DEPRECATED
  JS_ASSIGN_PROTO_PROP(screenRecorderDidStopRecordingWithErrorPreviewViewController);
#endif
  JS_ASSIGN_PROTO_PROP(screenRecorderDidStopRecordingWithPreviewViewControllerError);
  JS_ASSIGN_PROTO_PROP(screenRecorderDidChangeAvailability);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(RPScreenRecorderDelegate, NSObject);
  // constant values (exports)
JS_INIT_PROTOCOL_END(RPScreenRecorderDelegate, NSObject);

NAN_METHOD(NRPScreenRecorderDelegate::New) {
  JS_RECONSTRUCT_PROTOCOL(RPScreenRecorderDelegate);
  @autoreleasepool {
    id<RPScreenRecorderDelegate> self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge id<RPScreenRecorderDelegate>)(info[0].As<External>()->Value());
    } else if (info.Length() >= 1 && is_value_protocol< id<RPScreenRecorderDelegate> >(info[0])) {
      JS_UNWRAPPED_PROTOCOL(info[0], RPScreenRecorderDelegate, value);
      self = value;
    } else if (info.Length() <= 0) {
      self = [[RPScreenRecorderDelegateType alloc] init];
    }
    if (self) {
      NRPScreenRecorderDelegate *wrapper = new NRPScreenRecorderDelegate();
      wrapper->set_self(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("RPScreenRecorderDelegate::New: invalid arguments");
    }
  }
}

#if DEPRECATED
DELEGATE_PROTOCOL_PROP(RPScreenRecorderDelegate, screenRecorderDidStopRecordingWithErrorPreviewViewController);
#endif
DELEGATE_PROTOCOL_PROP(RPScreenRecorderDelegate, screenRecorderDidStopRecordingWithPreviewViewControllerError);
DELEGATE_PROTOCOL_PROP(RPScreenRecorderDelegate, screenRecorderDidChangeAvailability);

#include "NRPScreenRecorder.h"
#include "NRPPreviewViewController.h"
#include "NNSError.h"

@implementation RPScreenRecorderDelegateType

#if DEPRECATED
/*! @abstract Called when recording has stopped due to an error.
 @param screenRecorder The instance of the screen recorder.
 @param error An NSError describing why recording has stopped in the RPRecordingErrorDomain.
 @param previewViewController If a partial movie is available before it was stopped, an instance of RPPreviewViewController will be returned.
 */
- (void)screenRecorder:(RPScreenRecorder *)screenRecorder didStopRecordingWithError:(NSError *)error previewViewController:(nullable RPPreviewViewController *)previewViewController API_DEPRECATED("No longer supported", ios(9.0, 10.0), tvos(10.0,10.0))
{
  call_delegate_async(noop(), screenRecorderDidStopRecordingWithErrorPreviewViewController,
    js_value_RPScreenRecorder(screenRecorder),
    js_value_NSError(error),
    js_value_RPPreviewViewController(previewViewController));
}
#endif

- (void)screenRecorder:(RPScreenRecorder *)screenRecorder didStopRecordingWithPreviewViewController:(nullable RPPreviewViewController *)previewViewController error:(nullable NSError *)error API_AVAILABLE(ios(11.0), tvos(11.0))
{
  call_delegate_async(noop(), screenRecorderDidStopRecordingWithPreviewViewControllerError,
    js_value_RPScreenRecorder(screenRecorder),
    js_value_RPPreviewViewController(previewViewController),
    js_value_NSError(error));
}

/*! @abstract Called when the recorder becomes available or stops being available. Check the screen recorder's availability property to check the current availability state. Possible reasons for the recorder to be unavailable include an in-progress Airplay/TVOut session or unsupported hardware.
 @param screenRecorder The instance of the screen recorder.
 */
- (void)screenRecorderDidChangeAvailability:(RPScreenRecorder *)screenRecorder
{
  call_delegate_async(noop(), screenRecorderDidChangeAvailability,
    js_value_RPScreenRecorder(screenRecorder));
}

@end
