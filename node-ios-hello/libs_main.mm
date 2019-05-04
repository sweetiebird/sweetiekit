//
//  libs_main.mm
//  node-ios-hello
//
//  Created by Shawn on 3/20/19.
//  Copyright © 2019 Sweetiebird. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "NNSObject.h"
#include "NNSUserDefaults.h"
#include "NUIApplication.h"
#include "NUIWindow.h"
#include "NUIViewController.h"
#include "NUIView.h"
#include "NUIRefreshControl.h"
#include "NUIControl.h"
#include "NUIStoryboard.h"
#include "NUIButton.h"
#include "NUITabBarController.h"
#include "NUIImage.h"
#include "NUIImageView.h"
#include "NUILabel.h"
#include "NUITextField.h"
#include "NUINavigationController.h"
#include "NUIImagePickerController.h"
#include "NUIImagePickerControllerDelegate.h"
#include "NUITableViewController.h"
#include "NUITableView.h"
#include "NUITableViewCell.h"
#include "NUITableViewDataSource.h"
#include "NCALayer.h"
#include "NCABasicAnimation.h"
#include <unistd.h>

#include <string>
#include <map>
#include <thread>
#include <v8.h>
#include <node.h>
#include "nan.h"

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import "node_ios_hello-Swift.h"
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
    Local<Value> result;
    if (!callback.IsEmpty()) {
      Local<Object> asyncObject = Nan::New<Object>();
      AsyncResource asyncResource(Isolate::GetCurrent(), asyncObject, "UIButton::New");
      auto res = asyncResource.MakeCallback(callback, argc, argv);
      Kick();
      if (res.ToLocal(&result)) {
        if (result->IsPromise()) {
          Local<Promise> promise = result.As<Promise>();
          if (!promise->HasHandler()) {
            promise->Then(JS_CONTEXT(),
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
            Isolate::GetCurrent()->RunMicrotasks();
          }
          if (promise->State() == Promise::kRejected) {
            Nan::ThrowError(promise->Result());
          } else {
            result = promise->Result();
          }
        }
      }
    }
    return result;
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
    tickKicker();
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


  
        auto N_NSObject = NNSObject::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSObject").ToLocalChecked(), N_NSObject.first);
  
        auto N_NSUserDefaults = NNSUserDefaults::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("NSUserDefaults").ToLocalChecked(), N_NSUserDefaults.first);
  
        // UIKit
  
        auto N_UIApplication = NUIApplication::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIApplication").ToLocalChecked(), N_UIApplication.first);
  
        auto N_UIWindow = NUIWindow::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIWindow").ToLocalChecked(), N_UIWindow.first);
  
        auto N_UIResponder = NUIResponder::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIResponder").ToLocalChecked(), N_UIResponder.first);
  
        auto N_UIViewController = NUIViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIViewController").ToLocalChecked(), N_UIViewController.first);
  
        auto N_UITabBarController = NUITabBarController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITabBarController").ToLocalChecked(), N_UITabBarController.first);

        auto N_UITableViewController = NUITableViewController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewController").ToLocalChecked(), N_UITableViewController.first);

        auto N_UINavigationController = NUINavigationController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UINavigationController").ToLocalChecked(), N_UINavigationController.first);

        auto N_UIImagePickerController = NUIImagePickerController::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImagePickerController").ToLocalChecked(), N_UIImagePickerController.first);

        auto N_UIView = NUIView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIView").ToLocalChecked(), N_UIView.first);
  
        auto N_UIControl = NUIControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIControl").ToLocalChecked(), N_UIControl.first);
  
        auto N_UIRefreshControl = NUIRefreshControl::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIRefreshControl").ToLocalChecked(), N_UIRefreshControl.first);
  
        auto N_UIStoryboard = NUIStoryboard::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIStoryboard").ToLocalChecked(), N_UIStoryboard.first);
  
        auto N_UIButton = NUIButton::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIButton").ToLocalChecked(), N_UIButton.first);
  
        auto N_UITextField = NUITextField::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITextField").ToLocalChecked(), N_UITextField.first);
  
        auto N_UIImage = NUIImage::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImage").ToLocalChecked(), N_UIImage.first);
  
        auto N_UIImageView = NUIImageView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImageView").ToLocalChecked(), N_UIImageView.first);
  
        auto N_UILabel = NUILabel::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UILabel").ToLocalChecked(), N_UILabel.first);

        auto N_UITableViewCell = NUITableViewCell::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewCell").ToLocalChecked(), N_UITableViewCell.first);

        auto N_UITableView = NUITableView::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableView").ToLocalChecked(), N_UITableView.first);

        // UIKit delegates ========
  
        auto N_UIImagePickerControllerDelegate = NUIImagePickerControllerDelegate::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UIImagePickerControllerDelegate").ToLocalChecked(), N_UIImagePickerControllerDelegate.first);

        auto N_UITableViewDataSource = NUITableViewDataSource::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("UITableViewDataSource").ToLocalChecked(), N_UITableViewDataSource.first);
  
        // CoreAnimation
  
        auto N_CALayer = NCALayer::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CALayer").ToLocalChecked(), N_CALayer.first);
  
        auto N_CABasicAnimation = NCABasicAnimation::Initialize(Isolate::GetCurrent());
        exports->Set(Nan::New("CABasicAnimation").ToLocalChecked(), N_CABasicAnimation.first);

        uintptr_t initFunctionAddress = (uintptr_t)InitExports;
        Local<Array> initFunctionAddressArray = Nan::New<Array>(2);
        initFunctionAddressArray->Set(0, Nan::New<Integer>((uint32_t)(initFunctionAddress >> 32)));
        initFunctionAddressArray->Set(1, Nan::New<Integer>((uint32_t)(initFunctionAddress & 0xFFFFFFFF)));
        exports->Set(Nan::New("initFunctionAddress").ToLocalChecked(), initFunctionAddressArray);
        Nan::SetMethod(exports, "UIApplicationMain", NUIApplication::Main);
        
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
static uv_timer_t embed_timer;
static uv_async_t embed_async;
static volatile int embed_closed;

static int embed_timer_called;

static void embed_thread_runner(void* arg) {
  int r;
  int fd;
  int timeout;

  while (!embed_closed) {
    fd = uv_backend_fd(uv_default_loop());
    timeout = uv_backend_timeout(uv_default_loop());

    do {
#if defined(HAVE_KQUEUE)
      struct timespec ts;
      ts.tv_sec = timeout / 1000;
      ts.tv_nsec = (timeout % 1000) * 1000000;
      r = kevent(fd, NULL, 0, NULL, 0, &ts);
#elif defined(HAVE_EPOLL)
      {
        struct epoll_event ev;
        r = epoll_wait(fd, &ev, 1, timeout);
      }
#endif
    } while (r == -1 && errno == EINTR);
    auto start = uv_hrtime();
#if 1
    dispatch_sync(dispatch_get_main_queue(), ^{
      uv_run(uv_default_loop(), UV_RUN_NOWAIT);
      Isolate::GetCurrent()->RunMicrotasks();
    });
#else
    CFRunLoopWakeUp(CFRunLoopGetMain());
#endif
    auto now = uv_hrtime();
    auto elapsed = now - start;
    if (elapsed < 0.001*NSEC_PER_SEC) {
      usleep((0.001*NSEC_PER_SEC - elapsed) / 1000);
    }
  }
}


static void embed_cb(uv_async_t* async) {
  uv_run(uv_default_loop(), UV_RUN_ONCE);

  uv_sem_post(&embed_sem);
}

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

int main(int argc, char** argv)
{
#if 1
    registerNodeDLibs();
    chdir(getenv("HOME"));
    chdir("Documents");
    
    NSString* entry = [ScriptGetter GetWithName:@"demo"];
    if (entry == nullptr) {
      __builtin_trap();
    }
    auto args = [NSString stringWithFormat:@"node\0--jitless\0--builtins-in-stack-traces\0--abort-on-uncaught-exception\0%@\0\0", entry];
    fprintf(stderr, "%s\n", [entry UTF8String]);
    fprintf(stderr, "%s\n", [args UTF8String]);
    hello_node([args UTF8String]);
    
#else
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
#endif
}
