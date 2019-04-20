//
//  NUIImagePickerControllerDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIImagePickerControllerDelegate_h
#define NUIImagePickerControllerDelegate_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"

class NUIImagePickerControllerDelegate : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NUIImagePickerControllerDelegate();
  virtual ~NUIImagePickerControllerDelegate();
  
  static NAN_METHOD(New);
  static NAN_METHOD(Destroy);
  static NAN_GETTER(OnInfoGetter);
  static NAN_SETTER(OnInfoSetter);
  Nan::Persistent<Function>* _onInfo;
};


#endif /* NUIImagePickerControllerDelegate_h */
