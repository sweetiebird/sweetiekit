//
//  NUIPickerViewManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPickerViewManager_h
#define NUIPickerViewManager_h    

#include "NNSObject.h"

#define js_value_UIPickerViewManager(x) js_value_wrapper(x, UIPickerViewManager)
#define to_value_UIPickerViewManager(x) to_value_wrapper(x, UIPickerViewManager)
#define is_value_UIPickerViewManager(x) is_value_wrapper(x, UIPickerViewManager)

JS_WRAP_CLASS(UIPickerViewManager, NSObject);
  JS_PROP(titleForRow);
  JS_PROP(didSelectRow);
  JS_PROP(attributedTitleForRow);
  
  sweetiekit::JSFunction _numberComponents;
  sweetiekit::JSFunction _numberRowsInComponent;
  sweetiekit::JSFunction _titleForRow;
  sweetiekit::JSFunction _attributedTitleForRow;
  sweetiekit::JSFunction _didSelectRow;
JS_WRAP_CLASS_END(UIPickerViewManager);

#endif /* NUIPickerViewManager_h */
