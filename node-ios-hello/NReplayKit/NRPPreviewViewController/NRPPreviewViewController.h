//
//  NRPPreviewViewController.h
//
//  Created by Emily Kolar on 2019-5-26.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NRPPreviewViewController_h
#define NRPPreviewViewController_h    

#include "NUIViewController.h"

#define js_value_RPPreviewViewController(x) js_value_wrapper(x, RPPreviewViewController)
#define to_value_RPPreviewViewController(x) to_value_wrapper(x, RPPreviewViewController)
#define is_value_RPPreviewViewController(x) is_value_wrapper(x, RPPreviewViewController)

JS_WRAP_CLASS(RPPreviewViewController, UIViewController);
  JS_PROP(previewControllerDelegate);
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(RPPreviewViewController);

#endif /* NRPPreviewViewController_h */
