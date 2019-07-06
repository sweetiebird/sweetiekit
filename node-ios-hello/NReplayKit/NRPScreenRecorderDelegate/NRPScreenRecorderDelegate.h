//
//  NRPScreenRecorderDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPScreenRecorderDelegate_h
#define NRPScreenRecorderDelegate_h    

#include "NNSObject.h"

#define js_value_RPScreenRecorderDelegate(x) js_protocol_wrapper(x, RPScreenRecorderDelegate)
#define to_value_RPScreenRecorderDelegate(x) to_protocol_wrapper(x, RPScreenRecorderDelegate)
#define is_value_RPScreenRecorderDelegate(x) is_protocol_wrapper(x, RPScreenRecorderDelegate)

JS_WRAP_PROTOCOL(RPScreenRecorderDelegate, NSObject);
#if DEPRECATED
  JS_PROP(screenRecorderDidStopRecordingWithErrorPreviewViewController);
#endif
  JS_PROP(screenRecorderDidStopRecordingWithPreviewViewControllerError);
  JS_PROP(screenRecorderDidChangeAvailability);
JS_WRAP_PROTOCOL_END(RPScreenRecorderDelegate, NSObject);

#if __OBJC__
@interface RPScreenRecorderDelegateType : NSObject<RPScreenRecorderDelegate>

/*! @abstract Called when recording has stopped due to an error.
 @param screenRecorder The instance of the screen recorder.
 @param error An NSError describing why recording has stopped in the RPRecordingErrorDomain.
 @param previewViewController If a partial movie is available before it was stopped, an instance of RPPreviewViewController will be returned.
 */
#if DEPRECATED
- (void)screenRecorder:(RPScreenRecorder *)screenRecorder didStopRecordingWithError:(NSError *)error previewViewController:(nullable RPPreviewViewController *)previewViewController API_DEPRECATED("No longer supported", ios(9.0, 10.0), tvos(10.0,10.0));
#endif
- (void)screenRecorder:(RPScreenRecorder *)screenRecorder didStopRecordingWithPreviewViewController:(nullable RPPreviewViewController *)previewViewController error:(nullable NSError *)error API_AVAILABLE(ios(11.0), tvos(11.0));

/*! @abstract Called when the recorder becomes available or stops being available. Check the screen recorder's availability property to check the current availability state. Possible reasons for the recorder to be unavailable include an in-progress Airplay/TVOut session or unsupported hardware.
 @param screenRecorder The instance of the screen recorder.
 */
- (void)screenRecorderDidChangeAvailability:(RPScreenRecorder *)screenRecorder;

@end
#endif

#endif /* NRPScreenRecorderDelegate_h */
