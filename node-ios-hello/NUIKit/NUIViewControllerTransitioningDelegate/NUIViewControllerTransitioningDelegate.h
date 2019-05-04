//
//  NUIViewControllerTransitioningDelegate.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/4/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NUIViewControllerTransitioningDelegate_h
#define NUIViewControllerTransitioningDelegate_h

#import <UIKit/UIKit.h>
#include "NNSObject.h"

class NUIViewControllerTransitioningDelegate : public NNSObject {
public:
  
  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);
  
  NUIViewControllerTransitioningDelegate();
  virtual ~NUIViewControllerTransitioningDelegate();
  
  static NAN_METHOD(New);
};

#endif /* NUIViewControllerTransitioningDelegate_h */
