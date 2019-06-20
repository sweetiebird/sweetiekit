//
//  NNSUserActivityDelegate.h
//
//  Created by Shawn Presser on 6/19/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NNSUserActivityDelegate_h
#define NNSUserActivityDelegate_h    

#include "NNSObject.h"

#define js_value_NSUserActivityDelegate(x) js_value_wrapper(x, NSUserActivityDelegate)
#define to_value_NSUserActivityDelegate(x) to_value_wrapper(x, NSUserActivityDelegate)
#define is_value_NSUserActivityDelegate(x) is_value_wrapper(x, NSUserActivityDelegate)

JS_WRAP_CLASS(NSUserActivityDelegate, NSObject);
  JS_PROP(userActivityWillSave);
  JS_PROP(userActivityWasContinued);
  JS_PROP(userActivityDidReceiveInputStreamOutputStream);
JS_WRAP_CLASS_END(NSUserActivityDelegate);

#if __OBJC__
@interface NSUserActivityDelegate : NSObject<NSUserActivityDelegate>

/* The user activity will be saved (to be continued or persisted). The receiver should update the activity with current activity state.
*/
- (void)userActivityWillSave:(NSUserActivity *)userActivity;

/* The user activity was continued on another device.
*/
- (void)userActivityWasContinued:(NSUserActivity *)userActivity;

/* If supportsContinuationStreams is set to YES the continuing side can request streams back to this user activity. This delegate callback will be received with the incoming streams from the other side. The streams will be in an unopened state. The streams should be opened immediately to start receiving requests from the continuing side.
*/
- (void)userActivity:(NSUserActivity *)userActivity didReceiveInputStream:(NSInputStream *) inputStream outputStream:(NSOutputStream *)outputStream;

@end
#endif

#endif /* NNSUserActivityDelegate_h */
