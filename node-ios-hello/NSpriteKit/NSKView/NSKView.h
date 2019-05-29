//
//  NSKView.h
//  node-ios-hello
//
//  Created by Emily Kolar on 5/7/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef NSKView_h
#define NSKView_h

#import "NUIView.h"

#define js_value_SKView(x) js_value_wrapper(x, SKView)
#define to_value_SKView(x) to_value_wrapper(x, SKView)

class NSKView : public NUIView {
public:

  static Nan::Persistent<FunctionTemplate> type;
  static std::pair<Local<Object>, Local<FunctionTemplate>> Initialize(Isolate *isolate);

  NSKView();
  virtual ~NSKView();

  static NAN_METHOD(New);
  static NAN_METHOD(presentScene);
};

#endif /* NSKView_h */
