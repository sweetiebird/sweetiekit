//
//  libs_main.mm
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//


#include "NNSObject.h"
#include "NUIApplication.h"
#include <unistd.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"
#include "main.h"

#import "libs_main.hpp"

extern "C" void iOSLog(const char* format, ...);

namespace node {
    extern std::map<std::string, std::pair<void *, bool>> dlibs;
}
using namespace v8;


#include <array>
#include <deque>
#include <mutex>
#include <thread>


namespace sweetiekit {
  uv_sem_t resSem;
  uv_sem_t reqSem;
  uv_async_t resAsync;
  std::mutex reqMutex;
  std::mutex resMutex;
  std::deque<std::function<void()>> reqCbs;
  std::deque<std::function<void()>> resCbs;
  std::thread reqThead;

  void RunResInMainThread(uv_async_t *handle) {
    Nan::HandleScope scope;

    std::function<void()> resCb;
    {
      std::lock_guard<std::mutex> lock(reqMutex);

      resCb = resCbs.front();
      resCbs.pop_front();
    }
    if (resCb) {
      resCb();
    }
  }
  
  Local<Value> CallSync(Local<Function> callback, const char* methodName, int argc, Local<Value>* argv)
  {
    Isolate* isolate = callback->GetIsolate();
    Nan::EscapableHandleScope handleScope;
    MicrotasksScope enableMicrotasks(isolate, MicrotasksScope::kRunMicrotasks);
    TryCatchReport reportErrors;
    GetMainThreadMultiIsolatePlatform()->DrainTasks(isolate);
    Local<Value> result;
    if (!callback.IsEmpty()) {
      Local<Object> asyncObject = Nan::New<Object>();
      AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
      auto res = asyncResource.MakeCallback(callback, argc, argv);
      Kick();
      if (res.ToLocal(&result)) {
        if (result->IsPromise()) {
          Local<Promise> promise = result.As<Promise>();
#if 1
          if (!promise->HasHandler()) {
            (void)promise->Then(JS_CONTEXT(),
            (v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
              int argc = info.Length();
              argc = argc;
            }).ToLocalChecked())).ToLocalChecked()->Catch(JS_CONTEXT(),
            (v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
              int argc = info.Length();
              argc = argc;
            }).ToLocalChecked()));
          }
          while (promise->HasHandler() && (promise->State() == Promise::kPending)) {
            //Isolate::GetCurrent()->RunMicrotasks();
            sweetiekit::nodeTick();
          }
#else
          if (promise->State() == Promise::kPending) {
            Nan::ThrowError("Unresolved promise");
          }
#endif
          if (promise->State() == Promise::kRejected) {
            Nan::ThrowError(promise->Result());
          } else {
            result = promise->Result();
          }
        }
      }
    }
    return handleScope.Escape(result);
  }
  
  void Resolve(Nan::Persistent<Function>* cb, bool shouldDelete) {
#if SYNC
    {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([cb, shouldDelete]() -> void {
          if (cb != nullptr)
          {
            Local<Function> callback = Nan::New(*cb);
            if (!callback.IsEmpty()) {
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
              asyncResource.MakeCallback(callback, 0, nullptr);
            }
            if (shouldDelete) {
              delete cb;
            }
          }
      });
    }
    uv_async_send(&sweetiekit::resAsync);
#else
    Nan::HandleScope scope;
    if (cb != nullptr)
    {
      Local<Function> callback = Nan::New(*cb);
      sweetiekit::CallSync(callback, "sweetiekit::Resolve", 0, nullptr);
    }
    if (shouldDelete) {
      delete cb;
    }
#endif
  }
  
  void CallAsync(Nan::Global<Function>& cb, const char* methodName) {
#if SYNC
    {
        std::lock_guard<std::mutex> lock(sweetiekit::resMutex);
        sweetiekit::resCbs.push_back([&cb, &methodName]() -> void {
          if (!cb.IsEmpty())
          {
            Local<Function> callback = Nan::New(cb);
            if (!callback.IsEmpty()) {
              Local<Object> asyncObject = Nan::New<Object>();
              AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, methodName);
              asyncResource.MakeCallback(callback, 0, nullptr);
            }
          }
      });
    }
    uv_async_send(&sweetiekit::resAsync);
#else
    if (!cb.IsEmpty())
    {
      Local<Function> callback = Nan::New(cb);
      if (!callback.IsEmpty()) {
        Local<Object> asyncObject = Nan::New<Object>();
        AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, methodName);
        asyncResource.MakeCallback(callback, 0, nullptr);
      }
    }
#endif
  }
  
  Nan::Callback tickKicker;
  
  void Kick() {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
    tickKicker();
#pragma clang diagnostic pop
  }
};


namespace sweetiekit {
void InitExports(Local<Object> exports) {
  iOSLog("InitExports\n");
      
  tickKicker.SetFunction(v8::Function::New(JS_CONTEXT(), [](const FunctionCallbackInfo<Value>& info) -> void {
}).ToLocalChecked());

  
  uv_sem_init(&sweetiekit::resSem, 0);
  uv_sem_init(&sweetiekit::reqSem, 0);
  uv_async_init(uv_default_loop(), &sweetiekit::resAsync, sweetiekit::RunResInMainThread);
  sweetiekit::reqThead = std::thread([]() -> void {
    for (;;) {
      uv_sem_wait(&sweetiekit::reqSem);

      std::function<void()> reqCb;
      {
        std::lock_guard<std::mutex> lock(sweetiekit::reqMutex);

        if (sweetiekit::reqCbs.size() > 0) {
          reqCb = sweetiekit::reqCbs.front();
          sweetiekit::reqCbs.pop_front();
        }
      }
      if (reqCb) {
        reqCb();
      } else {
        break;
      }
    }
  });

        NNSObject::RegisterTypes(exports);

        uintptr_t initFunctionAddress = (uintptr_t)InitExports;
        Local<Array> initFunctionAddressArray = Nan::New<Array>(2);
        initFunctionAddressArray->Set(0, Nan::New<Integer>((uint32_t)(initFunctionAddress >> 32)));
        initFunctionAddressArray->Set(1, Nan::New<Integer>((uint32_t)(initFunctionAddress & 0xFFFFFFFF)));
        exports->Set(Nan::New("initFunctionAddress").ToLocalChecked(), initFunctionAddressArray);
//        Nan::SetMethod(exports, "UIApplicationMain", NUIApplication::main);
        
        iOSLog("initialized!\n");
    }
    
    void Init(Local<Object> exports) {
        InitExports(exports);
    }
}

extern "C" {
    void node_register_module_sweetiekit(Local<Object> exports, Local<Value> module, Local<Context> context) {
        sweetiekit::Init(exports);
    }
}

inline void registerDlibs(std::map<std::string, std::pair<void *, bool>> &dlibs) {
    dlibs["std:sweetiekit.node"] = std::pair<void *, bool>((void *)&node_register_module_sweetiekit, false);
}

extern "C" void registerNodeDLibs() {
    registerDlibs(node::dlibs);
}

extern "C" void UIKit_PumpEvents() {
  const CFTimeInterval seconds = 0.000002;
  SInt32 result;
  do {
    result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds, TRUE);
  } while (result == kCFRunLoopRunHandledSource);
  
  do {
    result = CFRunLoopRunInMode((CFStringRef)UITrackingRunLoopMode, seconds, TRUE);
  } while (result == kCFRunLoopRunHandledSource);
}


void UIKit_PumpQuick(CFTimeInterval seconds = 0.000002, bool returnAfterHandled = FALSE) {
  if (![NSThread isMainThread]) {
    CFRunLoopWakeUp(CFRunLoopGetMain());
  } else {
    SInt32 result;
    do {
      result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, seconds/2, returnAfterHandled);
    } while (result == kCFRunLoopRunHandledSource);
    
    do {
      result = CFRunLoopRunInMode((CFStringRef)UITrackingRunLoopMode, seconds/2, returnAfterHandled);
    } while (result == kCFRunLoopRunHandledSource);
  }
}


#define HAVE_KQUEUE 1

#if defined(HAVE_KQUEUE) || defined(HAVE_EPOLL)

#if defined(HAVE_KQUEUE)
# include <sys/types.h>
# include <sys/event.h>
# include <sys/time.h>
#endif

#if defined(HAVE_EPOLL)
# include <sys/epoll.h>
#endif

#endif

static uv_thread_t embed_thread;
static uv_sem_t embed_sem;
//static uv_timer_t embed_timer;
//static uv_async_t embed_async;
static volatile int embed_closed;

static int embed_timer_called;

namespace sweetiekit {

  void nodePump(Isolate* isolate) {
    TryCatchReport tryCatch;
    {
      MicrotasksScope microScope(isolate, MicrotasksScope::kRunMicrotasks);

      GetMainThreadMultiIsolatePlatform()->DrainTasks(isolate);
      uv_run(uv_default_loop(), UV_RUN_NOWAIT);
      isolate->RunMicrotasks();
    }
  }
  
  Isolate* nodeIsolate;
  
  uint64_t nodeTick() {
    auto start = uv_hrtime();
#if 1
    dispatch_sync(dispatch_get_main_queue(), ^{
      if (nodeIsolate) {
        Isolate* isolate = nodeIsolate;
        nodeIsolate = nullptr;
        isolate->Enter();
      }
      Isolate* isolate = Isolate::GetCurrent();
      //Isolate* isolate = nodeIsolate;
//      Local<Context> context = isolate->GetCurrentContext();
      v8::Locker locker(isolate);
      v8::Isolate::Scope isolateScope(isolate);
      Nan::HandleScope handleScope;
      nodePump(isolate);
    });
#else
    CFRunLoopWakeUp(CFRunLoopGetMain());
#endif
    auto now = uv_hrtime();
    auto elapsed = now - start;
    return elapsed;
  }
}

static void embed_thread_runner(void* arg) {
  int r;
  int fd;
  int timeout;

  while (!embed_closed) {
    fd = uv_backend_fd(uv_default_loop());
    timeout = uv_backend_timeout(uv_default_loop());
    timeout = 1000;

    do {
#if defined(HAVE_KQUEUE)
      struct timespec ts;
      ts.tv_sec = timeout / 1000;
      ts.tv_nsec = (timeout % 1000) * 1000000;
      r = kevent(fd, NULL, 0, NULL, 0, &ts);
      //r = kevent(fd, NULL, 0, NULL, 0, NULL);
#elif defined(HAVE_EPOLL)
      {
        struct epoll_event ev;
        r = epoll_wait(fd, &ev, 1, timeout);
      }
#endif
    } while (r == -1 && errno == EINTR);
    auto elapsed = sweetiekit::nodeTick();
    
    if (elapsed < 0.005*NSEC_PER_SEC) {
      usleep((0.005*NSEC_PER_SEC - elapsed) / 1000);
    }
  }
}

//inline static void embed_cb(uv_async_t* async) {
//  uv_run(uv_default_loop(), UV_RUN_ONCE);
//
//  uv_sem_post(&embed_sem);
//}

extern "C" void embed_start() {
  //uv_loop_t external;

  //assert(0 == uv_loop_init(&external));

  embed_timer_called = 0;
  embed_closed = 0;

  //uv_async_init(&external, &embed_async, embed_cb);

  /* Start timer in default loop */
  //uv_timer_init(uv_default_loop(), &embed_timer);
  //uv_timer_start(&embed_timer, embed_timer_cb, 250, 0);

  /* Start worker that will interrupt external loop */
  uv_sem_init(&embed_sem, 0);
  uv_thread_create(&embed_thread, embed_thread_runner, NULL);


}


extern "C" void hello_node(const char* args);

//int main(int argc, char** argv)
//{
//#if 1
//    registerNodeDLibs();
//    chdir(getenv("HOME"));
//    chdir("Documents");
//
//    NSString* entry = [ScriptGetter GetWithName:@"demo"];
//    if (entry == nullptr) {
//      __builtin_trap();
//    }
//    auto args = [NSString stringWithFormat:@"node\0--jitless\0--builtins-in-stack-traces\0--abort-on-uncaught-exception\0%@\0\0", entry];
//    fprintf(stderr, "%s\n", [entry UTF8String]);
//    fprintf(stderr, "%s\n", [args UTF8String]);
//    hello_node([args UTF8String]);
//
//#else
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
//    }
//#endif
//}
