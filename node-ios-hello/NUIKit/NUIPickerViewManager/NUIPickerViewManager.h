//
//  NUIPickerViewManager.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-17.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIPickerViewManager_h
#define NUIPickerViewManager_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NUIPickerViewManager : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIPickerViewManager();
  virtual ~NUIPickerViewManager();

  static NAN_METHOD(New);
  
  JS_PROP(titleForRow);
  JS_PROP(didSelectRow);
  JS_PROP(attributedTitleForRow);
  
  sweetiekit::JSFunction _numberComponents;
  sweetiekit::JSFunction _numberRowsInComponent;
  sweetiekit::JSFunction _titleForRow;
  sweetiekit::JSFunction _attributedTitleForRow;
  sweetiekit::JSFunction _didSelectRow;
};

#endif /* NUIPickerViewManager_h */
