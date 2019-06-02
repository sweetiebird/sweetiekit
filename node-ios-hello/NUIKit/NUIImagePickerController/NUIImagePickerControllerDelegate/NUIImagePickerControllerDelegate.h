//
//  NUIImagePickerControllerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerControllerDelegate_h
#define NUIImagePickerControllerDelegate_h

#include "NNSObject.h"

#define js_value_UIImagePickerControllerDelegate(x) js_value_wrapper(x, UIImagePickerControllerDelegate)
#define to_value_UIImagePickerControllerDelegate(x) to_value_wrapper(x, UIImagePickerControllerDelegate)
#define is_value_UIImagePickerControllerDelegate(x) is_value_wrapper(x, UIImagePickerControllerDelegate)

JS_WRAP_CLASS(UIImagePickerControllerDelegate, NSObject);
  JS_PROP(Result);
  JS_PROP(OnInfo);
  JS_PROP(OnCancel);
  Nan::Persistent<Function>* _onInfo;
  Nan::Persistent<Function>* _onCancel;
JS_WRAP_CLASS_END(UIImagePickerControllerDelegate);

#endif /* NUIImagePickerControllerDelegate_h */
