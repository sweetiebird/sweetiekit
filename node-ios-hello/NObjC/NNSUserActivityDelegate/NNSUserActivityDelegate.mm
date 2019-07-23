//
//  NNSUserActivityDelegate.mm
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//
#include "NNSUserActivityDelegate.h"

#define instancetype NSUserActivityDelegate
#define js_value_instancetype js_value_NSUserActivityDelegate

NNSUserActivityDelegate::NNSUserActivityDelegate() {}
NNSUserActivityDelegate::~NNSUserActivityDelegate() {}

JS_INIT_CLASS(NSUserActivityDelegate, NSObject);
  JS_ASSIGN_PROTO_PROP(userActivityWillSave);
  JS_ASSIGN_PROTO_PROP(userActivityWasContinued);
  JS_ASSIGN_PROTO_PROP(userActivityDidReceiveInputStreamOutputStream);

  // instance members (proto)
  // static members (ctor)
  JS_INIT_CTOR(NSUserActivityDelegate, NSObject);
  // constant values (exports)
JS_INIT_CLASS_END(NSUserActivityDelegate, NSObject);

NAN_METHOD(NNSUserActivityDelegate::New) {
  JS_RECONSTRUCT(NSUserActivityDelegate);
  @autoreleasepool {
    NSUserActivityDelegate* self = nullptr;

    if (info[0]->IsExternal()) {
      self = (__bridge NSUserActivityDelegate *)(info[0].As<External>()->Value());
    } else if (info.Length() <= 0) {
      self = [[NSUserActivityDelegate alloc] init];
    }
    if (self) {
      NNSUserActivityDelegate *wrapper = new NNSUserActivityDelegate();
      wrapper->SetNSObject(self);
      Local<Object> obj(info.This());
      wrapper->Wrap(obj);
      JS_SET_RETURN(obj);
    } else {
      Nan::ThrowError("NSUserActivityDelegate::New: invalid arguments");
    }
  }
}

DELEGATE_PROP(NSUserActivityDelegate, userActivityWillSave);
DELEGATE_PROP(NSUserActivityDelegate, userActivityWasContinued);
DELEGATE_PROP(NSUserActivityDelegate, userActivityDidReceiveInputStreamOutputStream);

#include "NNSUserActivity.h"
#include "NNSInputStream.h"
#include "NNSOutputStream.h"

@implementation NSUserActivityDelegate

/* The user activity will be saved (to be continued or persisted). The receiver should update the activity with current activity state.
*/
- (void)userActivityWillSave:(NSUserActivity *)userActivity
{
  call_delegate_async(noop(), userActivityWillSave,
    js_value_NSUserActivity(userActivity));
}

/* The user activity was continued on another device.
*/
- (void)userActivityWasContinued:(NSUserActivity *)userActivity
{
  call_delegate_async(noop(), userActivityWasContinued,
    js_value_NSUserActivity(userActivity));
}

/* If supportsContinuationStreams is set to YES the continuing side can request streams back to this user activity. This delegate callback will be received with the incoming streams from the other side. The streams will be in an unopened state. The streams should be opened immediately to start receiving requests from the continuing side.
*/
- (void)userActivity:(NSUserActivity *)userActivity didReceiveInputStream:(NSInputStream *) inputStream outputStream:(NSOutputStream *)outputStream
{
  call_delegate_async(noop(), userActivityDidReceiveInputStreamOutputStream,
    js_value_NSUserActivity(userActivity),
    js_value_NSInputStream(inputStream),
    js_value_NSOutputStream(outputStream));
}

@end
