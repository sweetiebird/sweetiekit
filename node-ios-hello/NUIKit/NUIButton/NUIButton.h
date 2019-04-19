//
//  NUIButton.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/19/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIButton_h
#define NUIButton_h

#import <UIKit/UIKit.h>

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

extern Local<Object> makeUIView();

class NUIButton : public ObjectWrap {
public:
  static Local<Object> Initialize(Isolate *isolate);
  CGRect GetFrame();

protected:
  static NAN_METHOD(New);

  NUIButton();
  ~NUIButton();

private:
  NUIButton* button;
};

#endif /* NUIButton_h */
