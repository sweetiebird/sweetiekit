//
//  NUITextField.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUITextField_h
#define NUITextField_h

#import <UIKit/UIKit.h>

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

extern Local<Object> makeUITextField();

class NUITextField : public ObjectWrap {
public:
  static Local<Object> Initialize(Isolate *isolate);
  CGRect GetFrame();

protected:
  static NAN_METHOD(New);
  static NAN_GETTER(FrameGetter);
  static NAN_SETTER(FrameSetter);

  NUITextField();
  ~NUITextField();

private:
  UITextField* textField;
};

#endif /* NUITextField_h */
