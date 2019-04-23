//
//  NUITableViewDataSource.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITableViewDataSource_h
#define NUITableViewDataSource_h

#include "NNSObject.h"

JS_WRAP_CLASS(UITableViewDataSource, NSObject);
  JS_PROP(NumberOfRowsInSection);
  JS_PROP(CellForRowAt);
  Nan::Persistent<Function>* _numberRowsCallback;
  Nan::Persistent<Function>* _cellCallback;
JS_WRAP_CLASS_END(UITableViewDataSource);

#endif /* NUITableViewDataSource_h */
