//
//  NUIPickerView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPickerView_h
#define NUIPickerView_h    

#include "NUIView.h"

#define js_value_UIPickerView(x) js_value_wrapper(x, UIPickerView)
#define to_value_UIPickerView(x) to_value_wrapper(x, UIPickerView)
#define is_value_UIPickerView(x) is_value_wrapper(x, UIPickerView)

JS_WRAP_CLASS(UIPickerView, UIView);
  JS_PROP(delegate);
  JS_PROP(dataSource);
  
  Nan::Persistent<Value> _dataSource;
  Nan::Persistent<Value> _delegate;
JS_WRAP_CLASS_END(UIPickerView);

#endif /* NUIPickerView_h */
