//
//  NUITableViewDataSourceDataSource.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
#include "defines.h"
#include "NUITableViewDataSource.h"
#include "NUITableViewCell.h"
#include "NUIControl.h"

Nan::Persistent<FunctionTemplate> NUITableViewDataSource::type;

std::pair<Local<Object>, Local<FunctionTemplate>> NUITableViewDataSource::Initialize(Isolate *isolate) {
  Nan::EscapableHandleScope scope;

  // constructor
  Local<FunctionTemplate> ctor = Nan::New<FunctionTemplate>(New);
  ctor->Inherit(Nan::New(NUIControl::type));
  ctor->InstanceTemplate()->SetInternalFieldCount(1);
  ctor->SetClassName(JS_STR("UITableViewDataSource"));
  type.Reset(ctor);

  // prototype
  Local<ObjectTemplate> proto = ctor->PrototypeTemplate();
  JS_SET_PROP(proto, "numberOfRowsInSection", NumberOfRowsInSection);
  JS_SET_PROP(proto, "cellForRowAt", CellForRowAt);

  // ctor
  Local<Function> ctorFn = Nan::GetFunction(ctor).ToLocalChecked();

  return std::pair<Local<Object>, Local<FunctionTemplate>>(scope.Escape(ctorFn), ctor);
}

NAN_METHOD(NUITableViewDataSource::New) {
  Nan::HandleScope scope;

  Local<Object> dObj = info.This();

  NUITableViewDataSource *nd = new NUITableViewDataSource();

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      nd->SetNSObject([[SUITableViewDataSource alloc] init]);
    });
  }
  nd->Wrap(dObj);

  info.GetReturnValue().Set(dObj);
}

NAN_GETTER(NUITableViewDataSource::NumberOfRowsInSectionGetter) {
  Nan::HandleScope scope;

  NUITableViewDataSource *view = ObjectWrap::Unwrap<NUITableViewDataSource>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_numberRowsCallback));
}
#include <vector>
namespace sweetiekit {

//
//
//template<typename T>
//void boring_template_fn(T t){
//    auto identity = [](decltype(t) t){ return t;};
//    std::cout << identity(t) << std::endl;
//}
//
//int main(int argc, char *argv[]) {
//    std::string s("My string");
//    boring_template_fn(s);
//    boring_template_fn(1024);
//    boring_template_fn(true);
//}
  struct NodeArgs {
  private:
    std::vector< Nan::Global<Value> > args;
  public:
    
    NodeArgs() { }
    ~NodeArgs() { Reset(); }
    
    void Reset() {
      args.clear();
    }
    
    void Reset(const Local<Value>* argv, int argc) {
      Reset();
      for (auto i = 0; i < argc; i++) {
        args.push_back(Nan::Global<Value>(argv[i]));
      }
    }
    std::vector< Local<Value> > Get() {
      std::vector< Local<Value> > arguments;
      for (auto i = 0; i < args.size(); i++) {
        arguments.push_back(Nan::New(args[i]));
      }
      return arguments;
    }
  };
  
  
  typedef void (^RunnerFn) ();
  
  struct NodeCall : Task {
    RunnerFn runner;
    NodeCall(RunnerFn fn) {
      runner = fn;
    }
    void Run() final {
      runner();
    }
  };

  class EnterIsolate
  {
      Isolate* isolate;
    public:
      EnterIsolate(Isolate* iso) {
        isolate = iso;
        isolate->Enter();
      }
      ~EnterIsolate() {
        isolate->Exit();
      }
  };
  template<typename GetArgsFn, typename OnFinishedFn>
  void Call(
    Isolate* isolate,
    const Nan::Global<Function>& cb,
    const char* method,
    GetArgsFn getArgs,
    OnFinishedFn onFinished)
  {
  #if 0
    __block uv_sem_t sem;
    uv_sem_init(&sem, 0);
    __block volatile bool resultSet = false;
    
    @autoreleasepool {
      dispatch_async([AppDelegate queue], ^ {
    node::MultiIsolatePlatform* platform = GetMainThreadMultiIsolatePlatform();
    platform->CallOnForegroundThread(isolate, new NodeCall(^ {
        Nan::HandleScope scope;
        Local<Function> callback = Nan::New(cb);
        if (!callback.IsEmpty()) {
          
          Local<Object> asyncObject = Nan::New<Object>();
          AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);
          std::vector< Local<Value> > argv(getArgs());
          Local<Value> res = asyncResource.MakeCallback(callback, (int)argv.size(), &argv[0]).ToLocalChecked();
          sweetiekit::Kick();
          //result.Reset(res);
          //auto onFinishedFn = [](decltype(onFinished) onFinished){ return onFinished;};
          onFinished(res);
          resultSet = true;
          uv_sem_post(&sem);
        }
      }));
    });
    }
//    {
//      EnterIsolate enter(isolate);
//      assert(platform->FlushForegroundTasks(isolate));
//    }
    if (!resultSet) {
      uv_sem_wait(&sem);
    }
    uv_sem_destroy(&sem);
    assert(resultSet);
  #elif 0
    @autoreleasepool {
      dispatch_async([AppDelegate queue], ^ {
        Local<Function> callback = Nan::New(cb);
        if (!callback.IsEmpty()) {
          
          Local<Object> asyncObject = Nan::New<Object>();
          AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);
          std::vector< Local<Value> > argv(getArgs());
          Local<Value> res = asyncResource.MakeCallback(callback, (int)argv.size(), &argv[0]).ToLocalChecked();
          sweetiekit::Kick();
          //result.Reset(res);
          //auto onFinishedFn = [](decltype(onFinished) onFinished){ return onFinished;};
          onFinished(res);
        }
      });
    }
  #elif 1
  uv_sem_t sem;
  uv_sem_init(&sem, 0);
  Nan::Global<Value> result;
  //Local<Function> cbFn = Local<Function>::Cast(info[10]);

  //Nan::Global<Function> cb(cbFn);
  {
    std::lock_guard<std::mutex> lock(sweetiekit::reqMutex);
    sweetiekit::reqCbs.push_back([&sem, &onFinished, &getArgs, &result, &cb, method]() -> void {

      // platform code.

      {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);

        sweetiekit::resCbs.push_back([&sem, &onFinished, &getArgs, &result, &cb, method]() -> void {
          {
            Local<Object> asyncObject = Nan::New<Object>();
            AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);

            Local<Function> cbFn = Nan::New(cb);
            std::vector< Local<Value> > argv(getArgs());
            Local<Value> ret = asyncResource.MakeCallback(cbFn, (int)argv.size(), &argv[0]).ToLocalChecked();
            result.Reset(ret);
            onFinished(Nan::New(result));
            uv_sem_post(&sem);
          }

          //delete vrPoseRes;
        });
      }

      uv_async_send(&sweetiekit::resAsync);

    });
  }

  uv_sem_post(&sweetiekit::reqSem);
  uv_sem_wait(&sem);
  uv_sem_destroy(&sem);

  #elif 1
    uv_sem_t sem;
    uv_sem_init(&sem, 0);
    //Nan::Global<Value> result;
    volatile bool resultSet = false;
    
    {
      std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([method, &cb, /*&result,*/ &sem, &getArgs, &onFinished, &resultSet]() -> void {
        
        Local<Function> callback = Nan::New(cb);
        if (!callback.IsEmpty()) {
          
          Local<Object> asyncObject = Nan::New<Object>();
          AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);
          std::vector< Local<Value> > argv(getArgs());
          Local<Value> res = asyncResource.MakeCallback(callback, (int)argv.size(), &argv[0]).ToLocalChecked();
          sweetiekit::Kick();
          //result.Reset(res);
          //auto onFinishedFn = [](decltype(onFinished) onFinished){ return onFinished;};
          onFinished(res);
          resultSet = true;
        }
        uv_sem_post(&sem);
      });
    }
    uv_async_send(&sweetiekit::resAsync);
    if (!resultSet) {
      uv_sem_wait(&sem);
    }
    uv_sem_destroy(&sem);
    //return result;
    #endif
  }


  
  template<typename R>
  void Call(
    const Nan::Global<Function>& cb,
    const char* method,
    int argc,
    Nan::Global<Value>* args,
    R onFinished)
  {
    uv_sem_t sem;
    uv_sem_init(&sem, 0);
    Nan::Global<Value> result;
    
    {
      std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([method, argc, &cb, args, &result, &sem, &onFinished]() -> void {
        
        Local<Function> callback = Nan::New(cb);
        if (!callback.IsEmpty()) {
          Local<Value>* argv = new Local<Value>[argc];
          for (auto i = 0; i < argc; i++) {
            argv[i] = Nan::New(args[i]);
          }
          
          Local<Object> asyncObject = Nan::New<Object>();
          AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);
          Local<Value> res = asyncResource.MakeCallback(callback, argc, argv).ToLocalChecked();
          result.Reset(res);
          //auto onFinishedFn = [](decltype(onFinished) onFinished){ return onFinished;};
          onFinished(res);
          
          delete [] argv;
        }
        uv_sem_post(&sem);
      });
    }
    uv_async_send(&sweetiekit::resAsync);
    uv_sem_wait(&sem);
    uv_sem_destroy(&sem);
    //return result;
  }


  Local<Value> Call(
    Local<Function> function,
    const char* method,
    int argc,
    Local<Value>* argv)
  {
    uv_sem_t sem;
    uv_sem_init(&sem, 0);
    Nan::Global<Function> cb(function);
    Nan::Global<Value>* args = new Nan::Global<Value>[argc];
    for (auto i = 0; i < argc; i++) {
      args[i].Reset(argv[i]);
    }
    Nan::Global<Value> result;
    
    {
      std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([method, argc, &cb, &args, &result, &sem]() -> void {
        
        Local<Function> callback = Nan::New(cb);
        if (!callback.IsEmpty()) {
          Local<Value>* argv = new Local<Value>[argc];
          for (auto i = 0; i < argc; i++) {
            argv[i] = Nan::New(args[i]);
          }
          
          Local<Object> asyncObject = Nan::New<Object>();
          AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, method);
          Local<Value> res = asyncResource.MakeCallback(callback, sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
          result.Reset(res);
          
          delete [] argv;
        }
        uv_sem_post(&sem);
      });
    }
    uv_async_send(&sweetiekit::resAsync);
    uv_sem_wait(&sem);
    uv_sem_destroy(&sem);
    delete [] args;
    return Nan::New(result);
  }

};
NAN_SETTER(NUITableViewDataSource::NumberOfRowsInSectionSetter) {
  Nan::HandleScope scope;

  NUITableViewDataSource *del = ObjectWrap::Unwrap<NUITableViewDataSource>(info.This());
  SUITableViewDataSource* d = del->As<SUITableViewDataSource>();

  del->_numberRowsCallback->Reset(Local<Function>::Cast(value));
  Isolate* isolate = JS_ISOLATE();
  __block Nan::Global<Function> cb(Local<Function>::Cast(value));

  //dispatch_queue_t q = dispatch_get_current_queue();

  //auto loop = GetCurrentEventLoop(JS_ISOLATE());
  
  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      [d setNumberRowsClosureWithClosure:^NSInteger(UITableView * _Nonnull tv, NSInteger section) {

#if 1
        __block NSInteger result = 0;
        sweetiekit::Call(isolate, cb, "NUITableViewDataSource::NumberOfRowsInSectionSetter",
        ^{
          std::vector< Local<Value> > argv;
          argv.push_back(JS_STR(""));
          argv.push_back(JS_INT(static_cast<int32_t>(section)));
          return argv;
        },
        ^void(Local<Value> ret){
          result = TO_INT32(ret);
        });
        return result;
#elif 1
        Local<Value> argv[] = {
          JS_STR(""),
          JS_INT(static_cast<int32_t>(section)),
        };
        NSInteger result TO_INT32(sweetiekit::Call(
          Nan::New(*del->_numberRowsCallback),
          "NUITableViewDataSource::NumberOfRowsInSectionSetter",
          sizeof(argv)/sizeof(argv[0]), argv));
        return result;
#elif 1
        volatile NSInteger result = -1;
        volatile bool resultSet = false;
        uv_sem_t sem;
        uv_sem_init(&sem, 0);
        {
          std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
            sweetiekit::resCbs.push_back([section, del, &result, &resultSet, &sem]() -> void {
            
            Local<Function> callback = Nan::New(*del->_numberRowsCallback);
            if (!callback.IsEmpty()) {
              Local<Value> argv[] = {
                JS_STR(""),
                JS_INT(static_cast<int32_t>(section)),
              };
            
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "NUITableViewDataSource::NumberOfRowsInSectionSetter");
              result = TO_INT32(asyncResource.MakeCallback(callback, sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked());
            }
            resultSet = true;
            uv_sem_post(&sem);
          });
        }
        uv_async_send(&sweetiekit::resAsync);
        uv_sem_wait(&sem);
        assert(resultSet);
        assert(result >= 0);

        return result;
#else
        __block NSInteger result = 0;
        //dispatch_sync(dispatch_get_main_queue(), ^ {
        
            Local<Function> callback = Nan::New(*del->_numberRowsCallback);
            if (!callback.IsEmpty()) {
              Local<Value> argv[] = {
                JS_STR(""),
                JS_INT(static_cast<int32_t>(section)),
              };
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
              result = TO_INT32(asyncResource.MakeCallback(callback, sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked());
            }
        //});

        return result;
#endif
      }];
    });
  }
}

NAN_GETTER(NUITableViewDataSource::CellForRowAtGetter) {
  Nan::HandleScope scope;

  NUITableViewDataSource *view = ObjectWrap::Unwrap<NUITableViewDataSource>(info.This());

  info.GetReturnValue().Set(Nan::New(view->_cellCallback));
}

NAN_SETTER(NUITableViewDataSource::CellForRowAtSetter) {
  Nan::HandleScope scope;


  NUITableViewDataSource *nui = ObjectWrap::Unwrap<NUITableViewDataSource>(info.This());
  SUITableViewDataSource* ui = nui->As<SUITableViewDataSource>();
  
  NUITableViewDataSource *del = ObjectWrap::Unwrap<NUITableViewDataSource>(info.This());

  del->_cellCallback->Reset(Local<Function>::Cast(value));
  __block Nan::Global<Function> cb(Local<Function>::Cast(value));
  Isolate* isolate = JS_ISOLATE();
  
  //dispatch_queue_t q = dispatch_queue_create_with_target(DISPATCH_CURRENT_QUEUE_LABEL, nullptr, nullptr);

  @autoreleasepool {
    dispatch_sync(dispatch_get_main_queue(), ^ {
      SUITableViewDataSource* d = del->As<SUITableViewDataSource>();
      [d setCellClosureWithClosure:^UITableViewCell *(UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath, UITableViewCell * cell) {
        __block UITableViewCell* result = nullptr;
        
        auto section = [indexPath section];
        auto row = [indexPath row];
#if 1
        sweetiekit::Call(isolate, cb, "NUITableViewDataSource::CellForRowAtSetter",
        ^{
          Local<Object> indexPathObj = Object::New(Isolate::GetCurrent());
          indexPathObj->Set(JS_STR("section"), JS_NUM(section));
          indexPathObj->Set(JS_STR("row"), JS_NUM(row));
          std::vector< Local<Value> > args;
          args.push_back(JS_STR(""));
          args.push_back(JS_OBJ(indexPathObj));
          if (cell != nullptr)
          {
            Local<Value> argv[] = {
              Nan::New<v8::External>((__bridge void*)cell)
            };
            Local<Object> value = JS_FUNC(Nan::New(NNSObject::GetNSObjectType(cell, NUITableViewCell::type)))->NewInstance(JS_CONTEXT(), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked();
            args.push_back(value);
          }
          return args;
        },
        ^void(Local<Value> ret){
          NUITableViewCell *ncell = ObjectWrap::Unwrap<NUITableViewCell>(JS_OBJ(ret));
          result = ncell->As<UITableViewCell>();
        });

        return result;
#else
        dispatch_sync(q, ^ {
        
          [indexPath section];
          
          Local<Object> indexPathObj = Object::New(Isolate::GetCurrent());
          indexPathObj->Set(JS_STR("section"), JS_NUM(section));
          indexPathObj->Set(JS_STR("row"), JS_NUM(row));

          Local<Value> argv[] = {
            JS_STR(""),
            JS_OBJ(indexPathObj),
          };
          
          Local<Function> cb = Nan::New(*del->_cellCallback);
          
          Local<Value> obj = (cb->Call(JS_CONTEXT(), v8::Undefined(JS_ISOLATE()), sizeof(argv)/sizeof(argv[0]), argv).ToLocalChecked());
          
          NUITableViewCell *ncell = ObjectWrap::Unwrap<NUITableViewCell>(JS_OBJ(obj));
          result = ncell->As<UITableViewCell>();
        });

        return result;
#endif
      }];
    });
  }
}

NUITableViewDataSource::NUITableViewDataSource ()
: _numberRowsCallback(new Nan::Persistent<Function>())
, _cellCallback(new Nan::Persistent<Function>())
{}

NUITableViewDataSource::~NUITableViewDataSource () {
  delete _numberRowsCallback;
  delete _cellCallback;
}
