//
//  NSCNGeometry.h
//  node-ios-hello
//
//  Created by Emily Kolar on 2019-5-19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSCNGeometry_h
#define NSCNGeometry_h    

#include "NNSObject.h"

#define js_value_SCNGeometry(x) js_value_wrapper_known(x, SCNGeometry)
#define to_value_SCNGeometry(x) to_value_wrapper_known(x, SCNGeometry)

class NSCNGeometry : public NNSObject {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSCNGeometry();
  virtual ~NSCNGeometry();

  static NAN_METHOD(New);
};

#endif /* NSCNGeometry_h */
