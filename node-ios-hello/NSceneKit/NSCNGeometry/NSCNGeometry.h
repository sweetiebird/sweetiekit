//
//  NSCNGeometry.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNGeometry_h
#define NSCNGeometry_h    

#import <UIKit/UIKit.h>
#include "NNSObject.h"
#include "defines.h"

using namespace v8;
using namespace node;

class NSCNGeometry : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNGeometry();
  virtual ~NSCNGeometry();

  static NAN_METHOD(New);
};

#endif /* NSCNGeometry_h */