//
//  NRPPreviewViewControllerDelegate.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewControllerDelegate_h
#define NRPPreviewViewControllerDelegate_h    

#include "NNSObject.h"

#define js_value_RPPreviewViewControllerDelegate(x) js_protocol_wrapper(x, RPPreviewViewControllerDelegate)
#define to_value_RPPreviewViewControllerDelegate(x) to_protocol_wrapper(x, RPPreviewViewControllerDelegate)
#define is_value_RPPreviewViewControllerDelegate(x) is_protocol_wrapper(x, RPPreviewViewControllerDelegate)

JS_WRAP_PROTOCOL(RPPreviewViewControllerDelegate, NSObject);
  JS_PROP(previewControllerDidFinish);
  JS_PROP(previewControllerDidFinishWithActivityTypes);
JS_WRAP_PROTOCOL_END(RPPreviewViewControllerDelegate, NSObject);

#if __OBJC__
@interface RPPreviewViewControllerDelegateType : NSObject<RPPreviewViewControllerDelegate>

/* @abstract Called when the view controller is finished. */
- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController;

/* @abstract Called when the view controller is finished and returns a set of activity types that the user has completed on the recording. The built in activity types are listed in UIActivity.h. */
- (void)previewController:(RPPreviewViewController *)previewController didFinishWithActivityTypes:(NSSet <NSString *> *)activityTypes __TVOS_PROHIBITED;

@end
#endif

#endif /* NRPPreviewViewControllerDelegate_h */
