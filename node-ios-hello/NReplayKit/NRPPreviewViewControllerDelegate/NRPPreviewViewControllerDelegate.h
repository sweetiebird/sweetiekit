//
//  NRPPreviewViewControllerDelegate.h
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewControllerDelegate_h
#define NRPPreviewViewControllerDelegate_h    

#include "NNSObject.h"

#define js_value_RPPreviewViewControllerDelegate(x) js_value_wrapper(x, RPPreviewViewControllerDelegate)
#define to_value_RPPreviewViewControllerDelegate(x) to_value_wrapper(x, RPPreviewViewControllerDelegate)
#define is_value_RPPreviewViewControllerDelegate(x) is_value_wrapper(x, RPPreviewViewControllerDelegate)

JS_WRAP_CLASS(RPPreviewViewControllerDelegate, NSObject);
  JS_PROP(previewControllerDidFinish);
  sweetiekit::JSFunction _didFinish;
JS_WRAP_CLASS_END(RPPreviewViewControllerDelegate);

#endif /* NRPPreviewViewControllerDelegate_h */
