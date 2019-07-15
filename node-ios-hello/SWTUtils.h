//
//  SWTUtils.h
//  node-ios-hello
//
//  Created by Emily Kolar on 7/10/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#ifndef SWTUtils_h
#define SWTUtils_h

namespace sweetiekit
{
  void setup(v8::Isolate* isolate, v8::Local<v8::Context> context, struct uv_loop_s* loop);
  Isolate* currentIsolate();
  Local<Context> currentContext(Isolate* isolate_ = currentIsolate());
}

class EnterNode {
public:
  v8::Isolate* isolate_;
  v8::Persistent<v8::Context> context_;

  EnterNode(v8::Isolate* isolate = sweetiekit::currentIsolate(), v8::Local<v8::Context> context = sweetiekit::currentContext())
      : isolate_(isolate),
        context_(isolate, context)
  {
  }

  virtual ~EnterNode()
  {
  }
  
  virtual void OnRun() = 0;

  virtual void Run() {
    Isolate* isolate_(sweetiekit::currentIsolate());
    v8::Locker locker(isolate_);
    isolate_->Enter();
    assert(isolate_ == v8::Isolate::GetCurrent());
    v8::HandleScope handle_scope(isolate_);
    Local<Context> context(sweetiekit::currentContext());
    v8::Context::Scope context_scope(context);
    OnRun();
    isolate_->Exit();
  }
};


#if __OBJC__
typedef void (^BlockCallback)();

class EnterNodeWithBlock : public EnterNode {
public:
  BlockCallback block_;


  EnterNodeWithBlock(BlockCallback block,
    v8::Isolate* isolate = sweetiekit::currentIsolate(),
    v8::Local<v8::Context> context = sweetiekit::currentContext())
    : EnterNode(isolate, context)
    , block_(block)
  {
  }
  
  void OnRun() override {
    if (block_) {
      block_();
    }
  }
};
#endif

#endif /* SWTUtils_h */
