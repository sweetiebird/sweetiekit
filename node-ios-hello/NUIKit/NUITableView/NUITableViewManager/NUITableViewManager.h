//
//  NUITableViewManager.h
//
//  Created by Emily Kolar on 5/5/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewManager_h
#define NUITableViewManager_h

#include "NNSObject.h"

#define js_value_UITableViewManager(x) js_value_wrapper(x, UITableViewManager)
#define to_value_UITableViewManager(x) to_value_wrapper(x, UITableViewManager)
#define is_value_UITableViewManager(x) JS_INSTANCEOF(x, SUITableViewManager)

JS_WRAP_CLASS(UITableViewManager, NSObject);
  JS_PROP(DidSelectRowAt);
  JS_PROP(NumberOfSections);
  JS_PROP(heightForRowAtIndexPath);
  JS_PROP(titleForHeaderInSection);
  sweetiekit::JSFunction _numberRowsInSection;
  sweetiekit::JSFunction _numberSections;
  sweetiekit::JSFunction _cellForRowAt;
  sweetiekit::JSFunction _didSelectRowAt;
  sweetiekit::JSFunction _titleForSection;
  sweetiekit::JSFunction _heightForRow;
JS_WRAP_CLASS_END(UITableViewManager);

#endif /* NUITableViewManager_h */
