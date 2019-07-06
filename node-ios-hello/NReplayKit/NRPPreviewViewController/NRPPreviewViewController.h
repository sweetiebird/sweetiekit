//
//  NRPPreviewViewController.h
//
//  Created by Shawn Presser on 7/4/2019.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewController_h
#define NRPPreviewViewController_h    

#include "NUIViewController.h"

#define js_value_RPPreviewViewController(x) js_value_wrapper(x, RPPreviewViewController)
#define to_value_RPPreviewViewController(x) to_value_wrapper(x, RPPreviewViewController)
#define is_value_RPPreviewViewController(x) is_value_wrapper(x, RPPreviewViewController)

#define js_value_RPPreviewViewControllerMode(x) JS_ENUM(RPPreviewViewControllerMode, NSInteger, x)
#define to_value_RPPreviewViewControllerMode(x) TO_ENUM(RPPreviewViewControllerMode, NSInteger, x)
#define is_value_RPPreviewViewControllerMode(x) IS_ENUM(RPPreviewViewControllerMode, NSInteger, x)

JS_WRAP_CLASS(RPPreviewViewController, UIViewController);
  JS_PROP(previewControllerDelegate);
#if !TARGET_OS_IPHONE
  JS_PROP(mode);
#endif
JS_WRAP_CLASS_END(RPPreviewViewController);

#endif /* NRPPreviewViewController_h */
