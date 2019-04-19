//
//  NUIView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIView_h
#define NUIView_h

#import <UIKit/UIKit.h>

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

//class NUIViewController;

extern Local<Object> makeUIView();

class NUIView : public ObjectWrap {
public:
  static Local<Object> Initialize(Isolate *isolate);
  CGRect GetFrame();

protected:
  static NAN_METHOD(New);
  static NAN_GETTER(FrameGetter);

  NUIView();
  ~NUIView();

private:
//  friend class NUIViewController;
  UIView* me;
};

#endif /* NUIView_h */
