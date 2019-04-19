//
//  NUIStoryboard.h
//  node-ios-hello
//
//  Created by Emily Kolar on 4/18/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIStoryboard_h
#define NUIStoryboard_h

#import <UIKit/UIKit.h>

#include <v8.h>
#include <node.h>
#include <nan.h>
using namespace v8;
using namespace node;

extern Local<Object> makeUIStoryboard();

class NUIStoryboard : public ObjectWrap {
public:
  static Local<Object> Initialize(Isolate *isolate);

protected:
  static NAN_METHOD(New);
  static NAN_METHOD(InstantiateViewController);

  NUIStoryboard();
  ~NUIStoryboard();

private:
  UIStoryboard* storyboard;
};


#endif /* NUIStoryboard_h */
