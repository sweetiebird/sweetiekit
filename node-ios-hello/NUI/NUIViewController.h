//
//  NUIViewController.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewController_h
#define NUIViewController_h

#import <UIKit/UIKit.h>

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

//class NUIView;

extern Local<Object> makeUIViewController();

class NUIViewController : public ObjectWrap {
public:
  static Local<Object> Initialize(Isolate *isolate);
//  unsigned int GetWidth();
//  unsigned int GetHeight();
//  NUIView* GetView();

protected:
  static NAN_METHOD(New);
//  static NAN_GETTER(WidthGetter);
//  static NAN_GETTER(HeightGetter);
//  static NAN_GETTER(ViewGetter);

  NUIViewController();
  ~NUIViewController();

private:
//  NUIView* viewWrapper;
  UIViewController* controller;
};

#endif /* NUIViewController_h */
