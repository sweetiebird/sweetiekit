//
//  NUITableViewDataSource.h
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDataSource_h
#define NUITableViewDataSource_h

#include "NNSObject.h"

#define js_value_UITableViewDataSource(x) js_value_wrapper(x, UITableViewDataSource)
#define to_value_UITableViewDataSource(x) to_value_wrapper(x, UITableViewDataSource)
#define is_value_UITableViewDataSource(x) is_value_wrapper(x, UITableViewDataSource)

JS_WRAP_CLASS(UITableViewDataSource, NSObject);
  JS_PROP(NumberOfRowsInSection);
  JS_PROP(CellForRowAt);
  JS_PROP(WillDisplayCellForRowAt);
  Nan::Persistent<Function>* _numberRowsCallback;
  Nan::Persistent<Function>* _cellCallback;
  Nan::Persistent<Function>* _displayCallback;
JS_WRAP_CLASS_END(UITableViewDataSource);

#if __OBJC__
typedef SUITableViewDataSource UITableViewDataSource;
#endif

#endif /* NUITableViewDataSource_h */
